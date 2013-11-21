package service.impl;

import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import entity.UserQuery;
import service.UserService;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import util.Constant;
import util.DBUtil;
import util.Md5Util;

public class UserServiceImpl implements UserService{
	public void register(User user,String ip) throws Exception{
		UserDao userDao = new UserDaoImpl();
		String desPwd = Md5Util.md5(user.getPassword());
		user.setPassword(desPwd);
		user.setRegip(ip);
		user.setRegdate((int)System.currentTimeMillis());
		user.setLastloginip(ip);
		user.setLastlogindate((int)System.currentTimeMillis());
		userDao.save(user);
		//邮箱加密
		
	}
	//验证码校验
	public boolean verifyCode(String checkCode) throws Exception{
		String codeSession = (String)ActionContext.getContext().getSession().get("checkCode");
		if(checkCode.equalsIgnoreCase(codeSession)){
			return true;
		}else{
			return false;
		}	
	}
	//用户名检验
	public boolean verifyName(String name){
		//UserDao dao = new UserDaoImpl();
		//User user = new User();
		//user = dao.
		return true;
	}
	//email检验
	public boolean verifyEmail(String email) throws Exception{
		UserDao dao = new UserDaoImpl();
		User user = (User) dao.findByEmail(email);
		if(user.getUid()>0){
			return true;
		}else{
			return false;
		}
	}
	//邮箱验证码校验
	public boolean verifyEmailCode(int uid,String emailcode) throws Exception{
		UserDao dao = new UserDaoImpl();
		if(uid==0) return false;
		if(dao.verifyEmailCode(uid).equals(emailcode)){
			return true;
		}else{
			return false;
		}
		
	}
	//登录验证
	public User checkLogin(String email,String password) throws Exception{
		UserDao dao = new UserDaoImpl();
		User user = (User) dao.findByEmail(email);
		String pwd = Md5Util.md5(password);
		if(user.getPassword().equals(pwd)){
			//加密再次密码；
			BASE64Encoder encoder = new BASE64Encoder();
			String pwdStr = new String(encoder.encode((user.getPassword() + Constant.AUTH_KEY).getBytes()));
			//拼接保存到cookie的字符串
			String cookieStr = user.getUid() + "&" + user.getUsername() + "&" + user.getEmail() + "&" + pwdStr;
			Cookie cookie = new Cookie("user", cookieStr);
			ServletActionContext.getResponse().addCookie(cookie);
			//将登陆信息写入session
			ActionContext.getContext().getSession().put("user", user);
			return user;
		}else{
			return null;
		}
	}
	//验证是否已经登陆
	public boolean isLogin() throws Exception{
		//读取cookie
		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		Cookie c = null;
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("user")){
					c = cookies[i];
				} 
			}
		}
		if(ActionContext.getContext().getSession().get("user")!=null){
			System.out.println("session 已经创建");//debug
			return true;
		}else if(c == null){
			System.out.println("cookie为空，未登录");//debug
			return false;
		}else if(c!=null){
			System.out.println("cookie有，session无，验证cookie有效性");//debug
			String[] cookieArr = c.getValue().split("[&]");
			int uid = Integer.parseInt(cookieArr[0]);
			String pwd = cookieArr[3];
			if(uid==0 || pwd==null) return false;
			//密码解密
			BASE64Decoder decoder = new BASE64Decoder();
			String pwdStr = new String(decoder.decodeBuffer(pwd));
			UserDao dao = new UserDaoImpl();
			User u = dao.findById(uid);
			System.out.println("password:" + u.getPassword() + Constant.AUTH_KEY);
			if((u.getPassword() + Constant.AUTH_KEY).equals(pwdStr)){
				System.out.println("创建session");//debug
				ActionContext.getContext().getSession().put("user", u);
				return true;
			}else{
				return false;
			}
			
		}else{
			return false;
		}
		
	//思路：先判断有无session，若无验证cookie密码是否相同，然后写入session

	}
	public List<User> findByQuery(UserQuery query) throws Exception {
		UserDao dao = new UserDaoImpl();
		List<User> users = dao.findByQuery(query);
		return users;
	}
	public void logOut() throws Exception {
		//读取cookie
		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("user")){
					System.out.println(cookies[i].getValue());
					Cookie c = new Cookie("user", null);
					c.setMaxAge(0);//删除cookie
					ServletActionContext.getResponse().addCookie(c);
				} 
			}
		}
		//删除session
		if(ActionContext.getContext().getSession().get("user")!=null){
			ActionContext.getContext().getSession().remove("user");
		}
		
	}
	
	
	
	
	
	
	
}
