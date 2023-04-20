package kr.ac.kopo.mannada.dao;

import java.util.List;

import kr.ac.kopo.mannada.model.Answer;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.pager.Pager;

public interface QuestionDao {

	int total(Pager pager);

	List<Question> list(Pager pager);

	void add(Question item);

	Question item(int id);

	void update(Question item);

	void delete(int id);

	void addAnswer(Answer item);

	void changeStatus(int questionId);

	Answer answer(int id);

}
