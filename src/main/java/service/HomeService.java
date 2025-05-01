package service;

public interface HomeService {

	boolean checkEmailAlreadyExist(String email);

	boolean saveNewUserDetails(String name, String email, String password);

	String saveGuestUserDetails();

}
