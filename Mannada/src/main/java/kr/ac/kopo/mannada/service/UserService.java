package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import java.util.List;
import kr.ac.kopo.mannada.model.Review;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
 
public interface UserService {

	boolean login(User user);

	void signup(User item);

	boolean checkId(String id);

	void addPartner(HashMap<String, Object> map);

	boolean checkNick(String id);
	
	List<User> list(Pager pager);

	User item(int num);

	List<Review> reviewList(int num); 

	void reviewAdd(Review review);

	void reviewDelete(int id);

	void update(User item);

	void password(User item);

	boolean checkPW(User item);

	void stop(User item);

	void photo(User item);
	
	void attachDelete(int attachId);

}
