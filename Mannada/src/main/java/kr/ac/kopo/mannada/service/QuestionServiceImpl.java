package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.QuestionDao;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	QuestionDao dao;
	

	@Override
	public List<Question> list(Pager pager) {
		
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Question item) {
		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.add(item);
	}

	@Override
	public Question item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(Question item) {

		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

}
