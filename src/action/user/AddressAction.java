package action.user;

import java.util.ArrayList;
import java.util.List;

import entity.Address;
import service.AddressService;
import service.impl.AddressServiceImpl;
import action.BaseAction;

public class AddressAction extends BaseAction{
	private boolean ok;
	private Address address;
	private List<Address> addrs = new ArrayList<Address>();
	
	public String form(){
		try{
//			AddressService service = new AddressServiceImpl();
//			addrs = service.list(0);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public String ajaxAdd(){
		try{
			AddressService service = new AddressServiceImpl();
			service.add(address);
			ok = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "ajaxAdd";
	}


	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Address> getAddrs() {
		return addrs;
	}

	public void setAddrs(List<Address> addrs) {
		this.addrs = addrs;
	}
	
	
}
