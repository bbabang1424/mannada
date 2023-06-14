package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;

@Repository
public class ChatDaoImpl implements ChatDao {
	
	@Autowired
	SqlSession sql;
	

	@Override
	public List<Manna> mannaList(int num) {
		return sql.selectList("chat.manna_list", num);
	}

	@Override
	public List<Chat> chatList(int id) {
		return sql.selectList("chat.chat_list", id);
	}

	@Override
	public void add(Chat item) {
		sql.insert("chat.send_message", item);
	}

	@Override
	public void userSetNull(HashMap<String, Object> map) {
		sql.update("chat.user_setNull", map);
	}

	@Override
	public void delete(int id) {
		sql.delete("chat.delete", id);
	}

}
