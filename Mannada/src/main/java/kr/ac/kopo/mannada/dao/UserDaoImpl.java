package kr.ac.kopo.mannada.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SqlSession sql;
	
	
	@Override
	public User login(User user) {
		return sql.selectOne("user.login", user);
	}

	@Override
	public void signup(User item) {
		sql.insert("user.signup", item);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("user.check_id", id);
	}

}
