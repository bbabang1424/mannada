package kr.ac.kopo.mannada.service;

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
			manager.setName(item.getName());
			manager.setNickname(item.getNickname());
			
			return true;
		} else
			return false; 
	}


	@Override
	public Manager item(String id) {
		return dao.item(id);
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

}
