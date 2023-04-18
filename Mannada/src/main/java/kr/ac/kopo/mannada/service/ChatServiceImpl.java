package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mannada.dao.ChatDao;
import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDao dao;

	@Override
	public List<Manna> mannaList(int num) {
		return dao.mannaList(num);
	}

	@Override
	public List<Chat> chatList(int mannaId) {
		return dao.chatList(mannaId);
	}

	@Override
	public void sendMessage(Chat item) {
		dao.sendMessage(item);
	}

}
