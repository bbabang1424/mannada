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

}
