package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.ManagerDao;
import kr.ac.kopo.mannada.model.Manager;

@Service
public class ManagerServiceImpl implements ManagerService {
 	
	@Autowired
	ManagerDao dao; 
	

	@Override
	public boolean login(Manager manager) {
		Manager item = dao.login(manager);
		
		if(item != null) {
			manager.setPw(item.getPw());
			manager.setNickname(item.getNickname());
			
			return true;
		} else
			return false; 
	}

	@Override
	public Manager item(String nickname) {
		return dao.item(nickname);
	}

	@Override
	public void update(Manager item) {
		dao.update(item);
	}

	@Override
	public boolean checkPW(Manager item) {
		if(dao.checkPW(item)==1)
			return true;
		else
			return false;
	}

	@Override
	public void password(Manager item) {
		dao.password(item);
	}

	@Override
	public boolean checkNick(String id) {
		if(dao.checkNick(id)==0)
			return true;
		else
			return false;
	}

	@Override
	public int checkLogin(String id, String pw) {
		Map<String, String> check = new HashMap<String, String>();
		check.put("id", id);
		check.put("pw", pw);
		
		return dao.checkLogin(check);
	}

	@Override
	public String saveId(String mgId) {
		return dao.saveId(mgId);
	}

}
