package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Reply;
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

	
	/* 댓글 */
	
	@Override
	public void addReply(Reply reply) {
		sql.insert("community.add_reply", reply);
	}

	@Override
	public Reply replyItem(int id) {
		return sql.selectOne("community.item_reply", id);
	}

	@Override
	public void updateReply(Reply item) {
		sql.update("community.update_reply", item);
	}

	@Override
	public void deleteReply(int id) {
		sql.delete("community.delete_reply", id);
	}

	
	/* 조회수 증가 */
	
	@Override
	public void addViewCnt(int id) {
		sql.update("community.addViewCnt", id);
	}

	/* 댓글리스트 */
	@Override
	public List<Reply> replyList(Pager pager) {
		return sql.selectList("community.reply_list", pager);
	}

	@Override
	public List<Reply> detailReply(int id) {
		return sql.selectList("community.detail_reply", id);
	}

}
