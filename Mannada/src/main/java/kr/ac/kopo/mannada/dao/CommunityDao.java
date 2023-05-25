package kr.ac.kopo.mannada.dao;

import java.util.List;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Reply;
import kr.ac.kopo.mannada.pager.Pager;

public interface CommunityDao {

	int total(Pager pager);

	List<Community> list(Pager pager);

	void add(Community item);

	Community item(int id);

	void update(Community item);

	void delete(int id);

	void addReply(Reply reply);

	Reply replyItem(int id);

	void updateReply(Reply item);

	void deleteReply(int id);

	void addViewCnt(int id);

	List<Reply> replyList(Pager pager);

	List<Reply> detailReply(int id);

	List<Community> reviewList(Pager pager);

	List<Community> talkList(Pager pager);

}
