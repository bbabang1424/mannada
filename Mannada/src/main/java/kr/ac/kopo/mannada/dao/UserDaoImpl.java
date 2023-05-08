package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
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

	@Override
	public void addPartner(HashMap<String, Object> map) {
		sql.insert("user.add_partner", map);
	}

	@Override
	public User item(User user) {
		return sql.selectOne("user.item", user);
	}
	
	@Override
	public void modify(User item) {
		sql.update("user.modify", item);
	}

	@Override
	public void pwModify(User item) {
		sql.update("user.pw_modify", item);
	}
}
