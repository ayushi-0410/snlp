package controller;

import java.security.Principal;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.HomeService;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "/")
	public String home() {
		System.out.println("in login controller");
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLogin(@RequestParam(value = "error", required = false) String error, ModelMap model,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "expired", required = false) String expired) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("Authenticated User: " + auth.getName());
		System.out.println("Roles: " + auth.getAuthorities());

		System.out.println("hello in login" + error);

		if (error != null) {
			System.out.println("error!=null");
			model.addAttribute("error", "Invalid username and password");
		}
		if (logout != null) {
			System.out.println("logout not equal null");
			model.addAttribute("msg", "You've been logged out successfully.");
		}
		if ("true".equals(expired)) {
			model.addAttribute("expiredMsg", "Your session has expired. Please login again.");
		}
		System.out.println("modal value is = " + model.toString());
		return "login";
	}

	@RequestMapping(value = "/profile")
	public String my(Authentication authentication, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		boolean isUser = false;
		boolean isAdmin = false;

		System.out.println("in profile getting auth = " + authentication);

		/* String email=principal.getName(); */
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {

			System.out.println("in profile role is = " + grantedAuthority.getAuthority());

			if (grantedAuthority.getAuthority().contains("USER")) {
				isUser = true;
				break;
			} else if (grantedAuthority.getAuthority().contains("ADMIN")) {
				isAdmin = true;
				break;
			}
		}
		if (isUser) {
			return "redirect:/userHome";
		} else if (isAdmin) {
			return "redirect:/admin";
		} else {
			throw new IllegalStateException();
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in logout phase");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/index?logout";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(Principal user, ModelMap model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("Authenticated User ____________ : " + auth.getName());
		System.out.println("Roles _________________ : " + auth.getAuthorities());

		if (user.getName() != null) {
			model.addAttribute("msg", "Hi " + user.getName() + ", you do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}
		return "403";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String printWelcome2(Principal principal, ModelMap model) {
		try {
			if (principal == null) {
				return "index";
			} else {
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
		}
	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(@RequestParam("email") String email, @RequestParam("name") String name,
			@RequestParam("password") String password, @RequestParam("cpassword") String cpassword, ModelMap map) {
		System.out.println("hello in signup controler");
		boolean checkEmailExist = homeService.checkEmailAlreadyExist(email.trim());
		System.out.println("check email = " + checkEmailExist);
		if (checkEmailExist == true) {
			map.addAttribute("error", "User Name already exist");
		} else {
			boolean addNewUser = homeService.saveNewUserDetails(name, email, password);
			if (addNewUser == true) {
				map.addAttribute("error", "Signup successfull, please login");
			}
		}
		return "login";
	}

//	@RequestMapping("/logInAsGuest")
//	public String logInAsGuest(HttpServletRequest request, Principal p1) {
//		try {
//			String userName = homeService.saveGuestUserDetails();
//	        Authentication auth = new UsernamePasswordAuthenticationToken(userName, null, AuthorityUtils.createAuthorityList("ROLE_USER"));
//	        SecurityContextHolder.getContext().setAuthentication(auth);
//	        System.out.println("authentication is = "+auth);
//	        System.out.println("principle is ="+p1);					    
//		  return "redirect:/userHome";			
//		} catch (Exception ex) {
//			ex.printStackTrace();
//			return null;
//		}
//	}

	@RequestMapping("/logInAsGuest")
	public String logInAsGuest(HttpServletRequest request) {
		try {
			String userName = homeService.saveGuestUserDetails();
			Authentication auth = new UsernamePasswordAuthenticationToken(userName, null,
					AuthorityUtils.createAuthorityList("USER"));
			SecurityContextHolder.getContext().setAuthentication(auth);

			// Persist authentication in session (if needed)
			request.getSession().setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());

			// Fetching the updated Principal
			Principal principal = SecurityContextHolder.getContext().getAuthentication();
			System.out.println("authentication is = " + auth);
			System.out.println("Updated Principal = " + principal);

			return "redirect:/userHome";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "errorPage"; // Return a valid view instead of null
		}
	}

}
