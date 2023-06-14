package kr.ac.kopo.mannada.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;

public interface ChatDao {

	List<Manna> mannaList(int num);

	List<Chat> chatList(int id);

	void add(Chat item);

	void userSetNull(HashMap<String, Object> map);

	void delete(int id);

}
