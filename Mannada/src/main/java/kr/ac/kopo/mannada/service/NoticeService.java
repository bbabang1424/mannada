package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.pager.Pager;

public interface NoticeService {

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int id);

	void update(Notice item);

	void delete(int id);

	boolean deleteAttach(int id);

	void addViewCnt(int id);

}
