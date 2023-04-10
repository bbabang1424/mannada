package kr.ac.kopo.mannada.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.ManagerDao;
import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.User;

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

}
