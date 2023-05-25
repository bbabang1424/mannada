package kr.ac.kopo.mannada.dao;

import kr.ac.kopo.mannada.model.Manager;

public interface ManagerDao {

	Manager login(Manager manager);

	Manager item(String id);

	void update(Manager item);
 
	int checkPW(Manager item);

	void password(Manager item);

}
