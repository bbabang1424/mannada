package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.mannada.dao.QuestionDao;
import kr.ac.kopo.mannada.model.Answer;
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

	@Transactional
	@Override
	public void addAnswer(Answer item) {
		dao.addAnswer(item);
		dao.changeStatus(item.getQuestionId());
	}

	@Override
	public Answer answer(int id) {
		return dao.answer(id);
	}

	@Override
	public void addViewCnt(int id) {
		dao.addViewCnt(id);
	}

	@Override
	public void updateAnswer(Answer item) {
		dao.updateAnswer(item);
	}

	@Transactional
	@Override
	public void deleteAnswer(int id) {
		dao.unChangeStatus(id);
		dao.deleteAnswer(id);
	}

}
