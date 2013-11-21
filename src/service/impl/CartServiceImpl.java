package service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import com.opensymphony.xwork2.ActionContext;


import dao.BookDao;
import dao.CartDao;
import dao.impl.BookDaoImpl;
import dao.impl.CartDaoImpl;

import entity.Book;
import entity.CartItem;
import entity.Order;
import entity.User;
import service.CartService;
import util.Constant;

public class CartServiceImpl implements CartService{
	public Map<Integer, CartItem> store = new HashMap<Integer, CartItem>(); 
	
	public String add(int id) throws Exception{
		if(store.containsKey(id)){
			return "yes";//已经购买过
		}else{
			BookDao dao = new BookDaoImpl();
			Book book = dao.findById(id);
			CartItem cart = new CartItem();
			cart.setBook(book);
			cart.setIsbuy(true);
			cart.setNumber(1);
			//cart.setDiscount(book.getDiscount());
			store.put(id, cart);
			return "no";
		}	
	}
	//返回标志isbuy为buy的列表
	public List<CartItem> getBooks(boolean buy) throws Exception{
		List<CartItem> list = new ArrayList<CartItem>();
		Collection<CartItem> items = store.values();
		for(CartItem item : items){
			//if(item.isIsbuy()){//这里把判断去掉，全部列出
				list.add(item);
			//}
		}
		return list;
	}
	//计算总价    
	public double PriceAll() throws Exception{
		int sum = 0;
		Collection<CartItem> items = store.values();
		for (CartItem item : items) {
			if (item.isIsbuy() == true) {
				sum += item.getBook().getPrice() * item.getBook().getDiscount() * item.getNumber() / 100;//
			}
		}
		return sum;
	}
	//购物车删除商品
	public void del(int id) throws Exception{
		store.get(id).setIsbuy(false);
	}
	//恢复删除的商品
	public void recover(int id) throws Exception{
		store.get(id).setIsbuy(true);
	}
	//变更购物车内商品数量
	public void modify(int id,int num) throws Exception{
		store.get(id).setNumber(num);
	}
	//订单入库
	public void orderAdd(Order order,String addrJson) throws Exception{
		Object obj = JSONValue.parse(addrJson);
		JSONObject obj2 = (JSONObject)obj;
		order.setFull_address(obj2.get("full_address").toString());
		order.setReceive_name(obj2.get("receive_name").toString());
		order.setMobile(obj2.get("mobile").toString());
		order.setZipcode(obj2.get("zipcode").toString());
		order.setTel(obj2.get("tel").toString());
		User u = (User) ActionContext.getContext().getSession().get("user");
		int uid = u.getUid();
		order.setUid(uid);
		Date date = new Date();
		order.setOrder_time((int)date.getTime());
		CartDao dao = new CartDaoImpl();
		List<CartItem> list = new ArrayList<CartItem>();
		System.out.println("test:" + store.size());//debug
		Collection<CartItem> items = store.values();
		System.out.println("cart num:" + items.size());//debug
		for(CartItem item : items){
			if(item.isIsbuy()){
				list.add(item);
			}
		}
		dao.orderAdd(order,list);
		//清空session
		
		ActionContext.getContext().getSession().remove(Constant.CART_KEY);
	}
	
	
	public static void main(String[] args) throws Exception{
		String jsonText = "{\"receive_name\":\"陈乐琪\",\"full_address\":\"山东济南历城区\",\"zipcode\":\"23423\",\"tel\":\"243234343\",\"mobile\":\"\"}";
		  JSONParser parser = new JSONParser();
		  Object obj = parser.parse(jsonText);
		  System.out.println(obj);
		  JSONObject obj2 = (JSONObject) obj;
		  System.out.println(obj2.get(1));
		 
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
