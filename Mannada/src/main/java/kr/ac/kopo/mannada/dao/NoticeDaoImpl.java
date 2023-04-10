package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.pager.Pager;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public int total(Pager pager) {
		return sql.selectOne("notice.total", pager);
	}

	@Override
	public List<Notice> list(Pager pager) {
		return sql.selectList("notice.list", pager);
	}

	@Override
	public void add(Notice item) {
		sql.insert("notice.add", item);
	}

	@Override
	public Notice item(int id) {
		return sql.selectOne("notice.item", id);
	}

	@Override
	public void update(Notice item) {
		sql.update("notice.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("notice.delete", id);
	}

}
