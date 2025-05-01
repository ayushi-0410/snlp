package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import dao.HomeDAO;
import jakarta.transaction.Transactional;
import modal.UserDetails;

public class HomeServiceImpl implements HomeService {

	@Autowired
	HomeDAO homeDao;

	@Transactional
	@Override
	public boolean checkEmailAlreadyExist(String email) {
		// TODO Auto-generated method stub
		System.out.println("in services impl");
		return homeDao.checkEmailAlreadyExist(email);
	}

	@Transactional
	@Override
	public boolean saveNewUserDetails(String name, String email, String password) {
		// TODO Auto-generated method stub
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		UserDetails user = new UserDetails();
		user.setEmail(email.trim());
		user.setName(name.trim());
		user.setPassword(encoder.encode(password.trim()));
		user.setEnabled(true);
		user.setPhone("");
		user.setAuthority("USER");
		return homeDao.saveNewUserDetails(user);
	}

	@Transactional
	@Override
	public String saveGuestUserDetails() {
		// TODO Auto-generated method stub
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		List<UserDetails> userList = homeDao.getAllUserList();
		String userName = "guestUser_" + (userList.size() + 1);

		UserDetails user = new UserDetails();
		user.setEmail(userName);
		user.setName("Guest User_" + (userList.size() + 1));
		user.setPassword(encoder.encode("123"));
		user.setEnabled(true);
		user.setPhone("");
		user.setAuthority("USER");
		homeDao.saveNewUserDetails(user);
		return userName;
	}

}
