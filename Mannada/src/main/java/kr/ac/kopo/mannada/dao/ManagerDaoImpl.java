package kr.ac.kopo.mannada.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Manager;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	 
	@Autowired
	SqlSession sql;
	

	@Override
	public Manager login(Manager manager) {
		return sql.selectOne("manager.login", manager);
	}

 
	@Override
	public Manager item(String nickname) {
		return sql.selectOne("manager.item", nickname);
	}


	@Override
	public void update(Manager item) {
		sql.update("manager.update", item); 
	}


	@Override
	public int checkPW(Manager item) {
		return sql.selectOne("manager.check_pw", item);
	}


	@Override
	public void password(Manager item) {
		sql.update("manager.password", item);
	}


	@Override
	public int checkNick(String id) {
		return sql.selectOne("manager.check_nick", id);
	}

}
