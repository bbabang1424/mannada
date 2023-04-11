package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.pager.Pager;

public interface QuestionService {

	List<Question> list(Pager pager);

	void add(Question item);

	Question item(int id);

	void update(Question item);

	void delete(int id);

}
