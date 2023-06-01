package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Review;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;

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
	public int checkNick(String id) {
		return sql.selectOne("user.check_nick", id);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("user.total", pager);
	}
	
	@Override
	public List<User> list(Pager pager) {
		return sql.selectList("user.list", pager);
	}

	@Override
	public User item(int num) {
		return sql.selectOne("user.item", num);
	}

	@Override
	public int reviewTotal(Pager viewPager) {
		return sql.selectOne("user.review_total", viewPager);
	}
	
	@Override
	public List<Review> reviewList(int num) {
		return sql.selectList("user.review", num);
	}

	@Override
	public void reviewAdd(Review review) {
		sql.insert("user.review_add", review);
	}

	@Override
	public void reviewDelete(int id) {
		sql.delete("user.review_delete", id);
	}

	@Override
	public void update(User item) {
		sql.update("user.update", item);
	}

	@Override
	public void password(User item) {
		sql.update("user.password", item);  
	}

	@Override
	public int checkPW(User item) {
		return sql.selectOne("user.check_pw", item);
	}

	@Override
	public void stop(User item) {
		sql.update("user.stop", item);
	}

	@Override
	public void photoAdd(Attach attach) {
		sql.insert("user.photo", attach);
	}

	@Override
	public Attach photoItem(int attachId) {
		return sql.selectOne("user.photo_item", attachId);
	}

	@Override
	public void photoDelete(int attachId) {
		sql.delete("user.photo_delete", attachId);
	}

	@Override
	public int checkLogin(Map<String, String> check) {
		return sql.selectOne("user.check_login", check);
	}

	@Override
	public String saveId(String userId) {
		return sql.selectOne("user.save_id", userId);
	}

}
