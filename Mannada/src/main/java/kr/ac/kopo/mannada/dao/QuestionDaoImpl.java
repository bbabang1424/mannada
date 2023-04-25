package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Answer;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.pager.Pager;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public int total(Pager pager) {
		return sql.selectOne("question.total", pager);
	}

	@Override
	public List<Question> list(Pager pager) {
		return sql.selectList("question.list", pager);
	}

	@Override
	public void add(Question item) {
		sql.insert("question.add", item);
	}

	@Override
	public Question item(int id) {
		return sql.selectOne("question.item", id);
	}

	@Override
	public void update(Question item) {
		sql.update("question.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("question.delete", id);
	}

	@Override
	public void addAnswer(Answer item) {
		sql.insert("question.add_answer", item);
	}

	@Override
	public void changeStatus(int questionId) {
		sql.update("question.change_status", questionId);
	}

	@Override
	public Answer answer(int id) {
		return sql.selectOne("question.answer", id);
	}

}
