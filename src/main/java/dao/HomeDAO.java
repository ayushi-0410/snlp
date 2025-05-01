package dao;

import java.util.List;

import modal.UserDetails;

public interface HomeDAO {

	boolean checkEmailAlreadyExist(String email);

	boolean saveNewUserDetails(UserDetails user);

	List<UserDetails> getAllUserList();

}
