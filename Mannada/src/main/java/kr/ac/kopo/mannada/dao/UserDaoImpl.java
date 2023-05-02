package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;

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
	
	/*회원정보수정 및 탈퇴 관련*/
	@Override
	public List<User> profile() {
		return sql.selectList("user.profile");
	}

	@Override
	public User item(String id) {
		return sql.selectOne("user.item", id);
	}

	@Override
	public void proUpdate(User item) {
		sql.update("user.proUpdate", item);
	}

	@Override
	public int checkPW(String id) {
		return sql.selectOne("user.checkPW", id);
	}

	@Override
	public void updatePW(User user) {
		sql.update("user.updatePW", user);
	}

}
