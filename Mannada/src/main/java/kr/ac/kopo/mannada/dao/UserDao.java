package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import kr.ac.kopo.mannada.model.User;

public interface UserDao {

	User login(User user);

	void signup(User item);

	int checkId(String id);

	void addPartner(HashMap<String, Object> map);

	User item(User user);

	void modify(User item);

	void pwModify(User item);

}
