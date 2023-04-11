package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.pager.Pager;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public int total(Pager pager) {
		return sql.selectOne("community.total", pager);
	}

	@Override
	public List<Community> list(Pager pager) {
		return sql.selectList("community.list", pager);
	}

	@Override
	public void add(Community item) {
		sql.insert("community.add", item);
	}

	@Override
	public Community item(int id) {
		return sql.selectOne("community.item", id);
	}

	@Override
	public void update(Community item) {
		sql.update("community.update", item);
	}

	@Override
	public void delete(int id) {
		sql.delete("community.delete", id);
	}

}
