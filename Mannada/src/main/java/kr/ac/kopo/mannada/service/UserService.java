package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import kr.ac.kopo.mannada.model.User;

public interface UserService {

	boolean login(User user);

	void signup(User item);

	boolean checkId(String id);

	void addPartner(HashMap<String, Object> map);

}
