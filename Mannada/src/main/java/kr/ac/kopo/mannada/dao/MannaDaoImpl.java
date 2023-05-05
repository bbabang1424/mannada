package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.pager.Pager;

@Repository
public class MannaDaoImpl implements MannaDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public int total(Pager pager) {
		return sql.selectOne("manna.total", pager);
	}

	@Override
	public List<Manna> list(Pager pager) {
		return sql.selectList("manna.list", pager);
	}

	@Override
	public void add(Manna item) {
		sql.insert("manna.add", item);
	}

	@Override
	public Manna item(int id) {
		return sql.selectOne("manna.item", id);
	}

	@Override
	public void update(Manna item) {
		sql.update("manna.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("manna.delete", id);
	}

	@Override
	public void deleteJoins(int id) {
		sql.delete("manna.delete_joins", id);
	}

	@Override
	public void addViewCnt(int id) {
		sql.update("manna.addViewCnt", id);
	}

}
