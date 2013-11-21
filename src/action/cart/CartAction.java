package action.cart;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import entity.Address;
import entity.CartItem;
import entity.Category;
import entity.Order;
import entity.User;
import factory.ServiceFactory;
import service.AddressService;
import service.CartService;
import service.CategoryService;
import service.impl.AddressServiceImpl;
import service.impl.CartServiceImpl;
import service.impl.CategoryServiceImpl;
import action.BaseAction;

public class CartAction extends BaseAction{
	private int id;
	private boolean ok;
	private int num;
	private List<CartItem> list;
	private double sumAll;
	private List<Address> addrs = new ArrayList<Address>();
	private String addrJson;
	private Order order;
	private String errorInfo;
	private List<Category> topcats = new ArrayList<Category>();//搜索框用
	private List<Category> catTree;
	//添加
	public String add(){
		try{
			CartService cartService = ServiceFactory.getCartService("session");//session方式创建
			String str = cartService.add(id);
			if(str == "yes"){
				ok = true;
			}else{
				ok = false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "add";
	}
	//列表显示
	public String list(){
		try{
			CategoryService catServ = new CategoryServiceImpl();
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			catTree = catServ.CatTree(0);//弹出层栏目框
			CartService cartService = ServiceFactory.getCartService("session");
			list = cartService.getBooks(true);
			if(list.size()==0) {
				errorInfo = "购物车为空，请先选购";
				return "fail";
			}
			sumAll = cartService.PriceAll();
			System.out.println("cartlist: " + list.size());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	//购物车删除商品
	public String del(){
		try{
			CartService cartService = ServiceFactory.getCartService("session");
			cartService.del(id);
			sumAll = cartService.PriceAll();
			ok = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "del";
	}
	//恢复删除的商品
	public String recover(){
		try{
			CartService cartService = ServiceFactory.getCartService("session");
			cartService.recover(id);
			sumAll = cartService.PriceAll();
			ok = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "recover";
	}
	//变更购物车商品数量
	public String modify(){
		try{
			CartService cartService = ServiceFactory.getCartService("session");
			cartService.modify(id, num);
			sumAll = cartService.PriceAll();
			ok = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "modify";
	}
	//确认订单页面
	public String order(){
		try{
			User user = (User)ActionContext.getContext().getSession().get("user");
			if(user==null){
				errorInfo = "请先登陆";
				return "fail";
			}
			CategoryService catServ = new CategoryServiceImpl();
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			catTree = catServ.CatTree(0);//弹出层栏目框
			CartService cartService = ServiceFactory.getCartService("session");
			list = cartService.getBooks(true);
			sumAll = cartService.PriceAll();
			AddressService service = new AddressServiceImpl();
			addrs = service.list(user.getUid());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	//订单入库
	public String orderAdd(){
		try{
			CategoryService catServ = new CategoryServiceImpl();
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			catTree = catServ.CatTree(0);//弹出层栏目框
			CartService service = ServiceFactory.getCartService("session");
			sumAll = service.PriceAll();
			service.orderAdd(order,addrJson);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
		
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean getOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public List<CartItem> getList() {
		return list;
	}
	public void setList(List<CartItem> list) {
		this.list = list;
	}
	public double getSumAll() {
		return sumAll;
	}
	public void setSumAll(double sumAll) {
		this.sumAll = sumAll;
	}
	public List<Address> getAddrs() {
		return addrs;
	}
	public void setAddrs(List<Address> addrs) {
		this.addrs = addrs;
	}
	public String getAddrJson() {
		return addrJson;
	}
	public void setAddrJson(String addrJson) {
		this.addrJson = addrJson;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}

	public String getErrorInfo() {
		return errorInfo;
	}
	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}
	public List<Category> getTopcats() {
		return topcats;
	}
	public void setTopcats(List<Category> topcats) {
		this.topcats = topcats;
	}
	public List<Category> getCatTree() {
		return catTree;
	}
	public void setCatTree(List<Category> catTree) {
		this.catTree = catTree;
	}
	
	
	
}
