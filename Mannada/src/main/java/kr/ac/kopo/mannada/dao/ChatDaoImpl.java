package kr.ac.kopo.mannada.dao;

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
	public List<Chat> chatList(int mannaId) {
		return sql.selectList("chat.chat_list", mannaId);
	}

	@Override
	public void sendMessage(Chat item) {
		sql.insert("chat.send_message", item);
	}

}
