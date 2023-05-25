package kr.ac.kopo.mannada.service;

import kr.ac.kopo.mannada.model.Manager;

public interface ManagerService {

	boolean login(Manager manager);

	Manager item(String nickname);

	void update(Manager item);
	
	boolean checkPW(Manager item);
 
	void password(Manager item);

	boolean checkNick(String id);
}
