package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.CommunityDao;
import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Reply;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	CommunityDao dao;
	

	@Override
	public List<Community> list(Pager pager) {
		
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Community item) {
		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.add(item);
	}

	@Override
	public Community item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(Community item) {
		
		if(item.getTitle() == "")
			item.setTitle(null);
		
		dao.update(item);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}
	
	/* 댓글 */
	
	@Override
	public void addReply(Reply reply) {
		dao.addReply(reply);
	}

	@Override
	public Reply replyItem(int id) {
		return dao.replyItem(id);
	}

	@Override
	public void updateReply(Reply item) {
		dao.updateReply(item);
	}

	@Override
	public void deleteReply(int id) {
		dao.deleteReply(id);
	}

	
	/* 조회수 증가 */
	
	@Override
	public void addViewCnt(int id) {
		dao.addViewCnt(id);
	}
	
	/*댓글 리스트*/
	@Override
	public List<Reply> replyList(Pager pager) {
		return dao.replyList(pager);
	}

	@Override
	public List<Reply> detailReply(int id, Pager pager) {
		
		int total = dao.totalReply(id);
		pager.setTotal(total);
		pager.setPerPage(10);
		pager.setPage(1);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pager", pager);
		
		return dao.detailReply(map);
	}

	/* 메인페이지용 */
	
	@Override
	public List<Community> reviewList(Pager pager) {
		return dao.reviewList(pager);
	}

	@Override
	public List<Community> talkList(Pager pager) {
		return dao.talkList(pager);
	}

}
