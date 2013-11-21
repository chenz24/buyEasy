package action.admin;

import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import dao.impl.UserDaoImpl;

import service.UserService;
import service.impl.UserServiceImpl;
import util.Constant;
import util.Pager;

import entity.User;
import entity.UserQuery;

import action.BaseAction;

public class UserAction extends BaseAction{
	private int p;
	private List<User> users = new ArrayList<User>();
	private String username;
	private UserQuery query = new UserQuery();
	private String pager;
	
	public String list(){
		try{
			UserService service = new UserServiceImpl();
			UserDao dao = new UserDaoImpl();
			username = httpRequest.getParameter("username");
			if(username!=null){
				username = new String(username.getBytes("ISO-8859-1"),"utf8");
				query.setUsername(username);
			}
			int total = dao.countByQuery(query);
			if(p==0) p = 1;
			String curpage = httpRequest.getRequestURI();
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"");
			pager = page.getPager(0);		
			query.setP(p);
			query.setNum(Constant.PERPAGE);//设定每页显示的数量
			users = service.findByQuery(query);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserQuery getQuery() {
		return query;
	}

	public void setQuery(UserQuery query) {
		this.query = query;
	}

	public String getPager() {
		return pager;
	}

	public void setPager(String pager) {
		this.pager = pager;
	}
}
