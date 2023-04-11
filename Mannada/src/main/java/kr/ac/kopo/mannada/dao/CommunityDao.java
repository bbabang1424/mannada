package kr.ac.kopo.mannada.dao;

import java.util.List;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.pager.Pager;

public interface CommunityDao {

	int total(Pager pager);

	List<Community> list(Pager pager);

	void add(Community item);

	Community item(int id);

	void update(Community item);

	void delete(int id);

}
