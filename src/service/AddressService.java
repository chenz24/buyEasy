package service;

import java.util.List;

import entity.Address;

public interface AddressService {
	public void add(Address address) throws Exception;
	public List<Address> list(int id) throws Exception;
	public void edit(Address address) throws Exception;
}
