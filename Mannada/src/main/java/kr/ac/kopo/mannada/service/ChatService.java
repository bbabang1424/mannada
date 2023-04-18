package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;

public interface ChatService {

	List<Manna> mannaList(int num);

	List<Chat> chatList(int mannaId);

	void sendMessage(Chat item);

}
