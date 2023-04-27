package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.UserDao;
import kr.ac.kopo.mannada.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public boolean login(User user) {
		User item = dao.login(user);
		
		if(item != null) {
			user.setNum(item.getNum());
			user.setPw(null);
			user.setName(item.getName());
			user.setNickname(item.getNickname());
			
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

	/*회원정보수정 및 탈퇴 관련*/
	@Override
	public List<User> profile() {
		return dao.profile();
	}

	@Override
	public User item(String id) {
		return dao.item(id);
	}

	@Override
	public void proUpdate(User item) {
		dao.proUpdate(item);
	}

	@Override
	public boolean checkPW(String id) {
		if(dao.checkPW(id) == 1)
			return true;
		else
			return false;
	}

	@Override
	public void updatePW(User user) {
		dao.updatePW(user);
	}
	
}
