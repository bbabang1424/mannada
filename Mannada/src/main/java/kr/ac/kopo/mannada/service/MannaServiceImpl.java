package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.MannaDao;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class MannaServiceImpl implements MannaService {
	
	@Autowired
	MannaDao dao;
	

	@Override
	public List<Manna> list(Pager pager) {
		int total = dao.total(pager);

		pager.setTotal(total);

		return dao.list(pager);
	}


	@Override
	public void add(Manna item) {
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.add(item);
	}


	@Override
	public Manna item(int id) {
		return dao.item(id);
	}


	@Override
	public void update(Manna item) {
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.update(item);
	}


	@Override
	public void delete(int id) {
		dao.delete(id);
	}

}
