package kr.ac.kopo.mannada.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.mannada.dao.AddressDao;
import kr.ac.kopo.mannada.model.Address;

@Repository
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	AddressDao dao;

	@Override
	public List<Address> metro() {		
		return dao.metro();
	}

	@Override
	public List<Address> city(String metro) {
		return dao.city(metro);
	}

	@Override
	public List<Address> road(Address address) {
		return dao.road(address);
	}

	@Override
	public List<Address> jibun(Address address) {
		return dao.jibun(address);
	}

}
