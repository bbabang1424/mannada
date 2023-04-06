package kr.ac.kopo.mannada.dao;

import kr.ac.kopo.mannada.model.User;

public interface UserDao {

	User login(User user);

	void signup(User item);

	int checkId(String id);

}
