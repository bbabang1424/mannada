package kr.ac.kopo.mannada.dao;

import java.util.Map;

import kr.ac.kopo.mannada.model.Manager;

public interface ManagerDao {

	Manager login(Manager manager);

	Manager item(String nickname);

	void update(Manager item);
 
	int checkPW(Manager item);

	void password(Manager item);

	int checkNick(String id);

	int checkLogin(Map<String, String> check);

	String saveId(String mgId);

}
