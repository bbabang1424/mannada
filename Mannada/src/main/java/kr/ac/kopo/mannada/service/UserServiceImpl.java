package kr.ac.kopo.mannada.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.UserDao;
import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Review;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
 
@Service
public class UserServiceImpl implements UserService {
	private String uploadPath = "d://upload/";
	
	@Autowired
	UserDao dao;
	
	@Override
	public boolean login(User user) {
		User item = dao.login(user);
		
		if(item != null) {
			user.setNum(item.getNum());
			user.setPw(null);
			user.setNickname(item.getNickname());
			user.setIntro(item.getIntro());
			user.setStatus(0);
			
			return true;
		} else
			return false;
	}

	@Override
	public void signup(User item) {		
		dao.signup(item);
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public void addPartner(HashMap<String, Object> map) {
		dao.addPartner(map);
	}

	@Override
	public boolean checkNick(String id) {
		if(dao.checkNick(id)==0)
			return true;
		else
			return false;
	}

	@Override
	public List<User> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public User item(int num) {
		return dao.item(num);
	}

	@Override
	public List<Review> reviewList(int num) {
		return dao.reviewList(num);
	}

	@Override
	public void reviewAdd(Review review) {
		dao.reviewAdd(review);
	}

	@Override
	public void reviewDelete(int id) {
		dao.reviewDelete(id);
	}

	@Override
	public void update(User item) {
		dao.update(item);
	}

	@Override
	public void password(User item) { 
		dao.password(item);
	}

	@Override
	public boolean checkPW(User item) {
		if(dao.checkPW(item)==1)
			return true;
		else
			return false;
	}

	@Override
	public void stop(User item) {
		dao.stop(item);
	}

	@Override
	public void photo(User item) {
		Attach attach = item.getAttach();
		attach.setNum(item.getNum());
		
		dao.photoAdd(attach);
	}

	@Override
	public void attachDelete(int attachId) {
		Attach attach = dao.photoItem(attachId);
		
		if(attach != null) {
			String uuid = attach.getUuid();
			String filename = attach.getFilename();
			
			File file = new File(uploadPath + uuid + "_" + filename);
			file.delete();
			
			dao.photoDelete(attachId);
		}
	}

}
