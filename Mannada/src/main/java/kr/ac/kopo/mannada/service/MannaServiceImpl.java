package kr.ac.kopo.mannada.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.mannada.dao.ChatDao;
import kr.ac.kopo.mannada.dao.MannaDao;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;

@Service
public class MannaServiceImpl implements MannaService {
	
	@Autowired
	MannaDao dao;
	
	@Autowired
	ChatDao chatDao;
	

	@Override
	public List<Manna> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Manna item) {
		dao.add(item);
	}

	@Override
	public Manna item(int id) {
		return dao.item(id);
	}

	@Override
	public void update(Manna item) {
		dao.update(item);
	}

	@Transactional
	@Override
	public void delete(int id) {
		chatDao.delete(id);
		dao.deleteJoins(id);
		
		dao.delete(id);
	}

	/*테스트*/
	@Override
	public void dummy() {
		for(int index=1; index<100; index++) {
			Manna item = new Manna();
			
			item.setTitle("만나다명"+index);
			item.setdDay("2023-04-19");
			item.setMember(12);
			
			dao.add(item);
		}
	}

	@Override
	public void init() {
		while(true) {
			List<Manna> list = dao.list(new Pager());
			
			if(list.size()<1)
				break;
			for(Manna item : list)
				dao.delete(item.getId());
		}
	}

	@Override
	public void addViewCnt(int id) {
		dao.addViewCnt(id);
	}

	@Override
	public List<User> memberList(int id) {
		return dao.memberList(id);
	}

	@Override
	public void addJoin(HashMap<String, Object> map) {
		dao.addJoin(map);
	}

	@Transactional
	@Override
	public void deleteJoin(HashMap<String, Object> map) {
		chatDao.userSetNull(map);
		dao.deleteJoin(map);
	}

	@Override
	public int joinStatus(Map<String, Object> js) {
		return dao.joinStatus(js);
	}

}
