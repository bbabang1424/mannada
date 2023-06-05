package kr.ac.kopo.mannada.dao;

import java.util.List;

import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.pager.Pager;

public interface NoticeDao {

	int total(Pager pager);

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int id);

	void update(Notice item);

	void delete(int id);

	void addAttach(Attach attach);

	void deleteAttachNoticeId(int id);

	boolean deleteAttach(int id);

	void addViewCnt(int id);

}
