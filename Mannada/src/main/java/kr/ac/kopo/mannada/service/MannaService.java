package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.pager.Pager;

public interface MannaService {

	List<Manna> list(Pager pager);

	void add(Manna item);

	Manna item(int id);

	void update(Manna item);

	void delete(int id);

}