package kr.ac.kopo.mannada.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.model.Address;

@Repository
public class AddressDaoImpl implements AddressDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Address> metro() {
		return sql.selectList("address.metro");
	}

	@Override
	public List<Address> city(String metro) {
		return sql.selectList("address.city", metro);
	}

	@Override
	public List<Address> road(Address address) {
		return sql.selectList("address.road", address);
	}

	@Override
	public List<Address> jibun(Address address) {
		return sql.selectList("address.jibun", address);
	}

}
