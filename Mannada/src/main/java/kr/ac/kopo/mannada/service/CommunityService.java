package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.pager.Pager;

public interface CommunityService {

	List<Community> list(Pager pager);

	void add(Community item);

	Community item(int id);

	void update(Community item);

	void delete(int id);

}
