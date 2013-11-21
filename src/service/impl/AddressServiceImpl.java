package service.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import dao.AddressDao;

import entity.Address;
import entity.User;
import service.AddressService;

public class AddressServiceImpl implements AddressService{

	public void add(Address address) throws Exception {
		User user = (User)ActionContext.getContext().getSession().get("user");
		address.setUid(user.getUid());
		AddressDao dao = new AddressDao();
		String consignee = address.getConsignee();
		if(consignee!=null) consignee = new String(consignee.getBytes("ISO-8859-1"),"utf-8");
		address.setConsignee(consignee);
		String addr = address.getAddress();
		if(addr!=null) addr = new String(addr.getBytes("ISO-8859-1"),"utf-8");
		address.setAddress(addr); 
		dao.add(address);
	}

	public void edit(Address address) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public List<Address> list(int id) throws Exception {
		AddressDao dao = new AddressDao();
		List<Address> addrs = dao.findByUid(id);
		return addrs;
	}

}
