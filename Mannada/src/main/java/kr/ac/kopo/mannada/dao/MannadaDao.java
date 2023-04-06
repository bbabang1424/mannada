package kr.ac.kopo.mannada.dao;

import java.util.List;

import kr.ac.kopo.mannada.model.Mannada;
import kr.ac.kopo.mannada.pager.Pager;

public interface MannadaDao {

	int total(Pager pager);

	List<Mannada> list(Pager pager);

	void add(Mannada item);

	Mannada item(int id);

	void update(Mannada item);

	void delete(int id);

}
