package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.CommunityDao;
import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao dao;
	

	@Override
	public List<Community> list(Pager pager) {
		
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Community item) {
		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.add(item);
	}

	@Override
	public Community item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(Community item) {
		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

}
