package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Review;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;

public interface UserDao {
 
	User login(User user);

	void signup(User item);

	int checkId(String id);

	void addPartner(HashMap<String, Object> map);

	int checkNick(String id);
	
	int total(Pager pager);
	
	List<User> list(Pager pager);

	User item(int num);
	
	int reviewTotal(Pager viewPager);
	
	List<Review> reviewList(int numr);

	void reviewAdd(Review review); 

	void reviewDelete(int id);

	void update(User item);

	void password(User item);

	int checkPW(User item);

	void stop(User item);

	void photoAdd(Attach attach);

	Attach photoItem(int attachId);

	void photoDelete(int attachId);

	int checkLogin(Map<String, String> check);

	String saveId(String userId);
	
}
