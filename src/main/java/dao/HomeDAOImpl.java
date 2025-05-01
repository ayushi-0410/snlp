package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import modal.UserDetails;

public class HomeDAOImpl implements HomeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean checkEmailAlreadyExist(String email) {
		// TODO Auto-generated method stub
		UserDetails user = (UserDetails) sessionFactory.getCurrentSession().get(UserDetails.class, email);
		System.out.println("user = " + user);
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean saveNewUserDetails(UserDetails user) {
		// TODO Auto-generated method stub
		System.out.println("helllo in dao");
		sessionFactory.getCurrentSession().merge(user);
		return true;
	}

	@Override
	public List<UserDetails> getAllUserList() {
		// TODO Auto-generated method stub
		return (List<UserDetails>) sessionFactory.getCurrentSession().createQuery("FROM userDetails", UserDetails.class)
				.getResultList();
	}

}
