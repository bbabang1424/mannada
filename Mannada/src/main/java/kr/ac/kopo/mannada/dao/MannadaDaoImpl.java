package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Mannada;
import kr.ac.kopo.mannada.pager.Pager;

@Repository
public class MannadaDaoImpl implements MannadaDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public int total(Pager pager) {
		return sql.selectOne("mannada.total", pager);
	}

	@Override
	public List<Mannada> list(Pager pager) {
		return sql.selectList("mannada.list", pager);
	}

	@Override
	public void add(Mannada item) {
		sql.insert("mannada.add", item);
	}

	@Override
	public Mannada item(int id) {
		return sql.selectOne("mannada.item", id);
	}

	@Override
	public void update(Mannada item) {
		sql.update("mannada.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("mannada.delete", id);
	}

}
