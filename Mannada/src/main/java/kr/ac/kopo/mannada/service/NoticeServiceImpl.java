package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.mannada.dao.NoticeDao;
import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;
	

	@Override
	public List<Notice> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Transactional
	@Override
	public void add(Notice item) {
		
		dao.add(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setNoticeId(item.getId());
				
				dao.addAttach(attach);
			}
			
		}
	}

	@Override
	public Notice item(int id) {
		return dao.item(id);
	}

	@Transactional
	@Override
	public void update(Notice item) {
		
		dao.update(item);
		
		if(item.getAttachs() != null) {
			for(Attach attach : item.getAttachs()) {
				attach.setNoticeId(item.getId());
				
				dao.addAttach(attach);
			}
			
		}
	}

	@Override
	public void delete(int id) {
		dao.deleteAttachNoticeId(id);
		dao.delete(id);
	}

	@Override
	public boolean deleteAttach(int id) {
		if(dao.deleteAttach(id)) {
			return true;
		}
		else
			return false;
	}

	@Override
	public void addViewCnt(int id) {
		dao.addViewCnt(id);
	}
	

}
