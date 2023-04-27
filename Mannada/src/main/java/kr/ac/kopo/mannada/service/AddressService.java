package kr.ac.kopo.mannada.service;

import java.util.List;

import kr.ac.kopo.mannada.model.Address;

public interface AddressService {

	List<Address> metro();

	List<Address> city(String metro);

	List<Address> road(Address address);

	List<Address> jibun(Address address);

}
