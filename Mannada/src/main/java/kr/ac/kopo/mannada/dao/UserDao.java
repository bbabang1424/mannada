package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.mannada.model.User;

public interface UserDao {

	User login(User user);

	void signup(User item);

	int checkId(String id);

	void addPartner(HashMap<String, Object> map);

	/*회원정보수정 및 탈퇴 관련*/
	List<User> profile();

	User item(String id);

	void proUpdate(User item);

	int checkPW(String id);

	void updatePW(User user);

}
