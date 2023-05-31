package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Reply;
import kr.ac.kopo.mannada.pager.Pager;

public interface CommunityService {

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
	
	/* 메인페이지 카테고리별 게시판 인기글 : 후기, 소통 */
	List<Community> reviewList(Pager pager);

	List<Community> talkList(Pager pager);

}
