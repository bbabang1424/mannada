package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.MannadaDao;
import kr.ac.kopo.mannada.model.Mannada;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class MannadaServiceImpl implements MannadaService {
	
	@Autowired
	MannadaDao dao;
	

	@Override
	public List<Mannada> list(Pager pager) {
		int total = dao.total(pager);

		pager.setTotal(total);

		return dao.list(pager);
	}


	@Override
	public void add(Mannada item) {
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.add(item);
	}


	@Override
	public Mannada item(int id) {
		return dao.item(id);
	}


	@Override
	public void update(Mannada item) {
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.update(item);
	}


	@Override
	public void delete(int id) {
		dao.delete(id);
	}

}
