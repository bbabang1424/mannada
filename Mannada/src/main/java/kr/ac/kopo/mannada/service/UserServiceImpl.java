package kr.ac.kopo.mannada.service;

import java.util.HashMap;
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

}
