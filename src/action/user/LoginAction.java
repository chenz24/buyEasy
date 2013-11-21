package action.user;


import com.opensymphony.xwork2.ActionContext;

import entity.User;

import action.BaseAction;
import service.UserService;
import service.impl.UserServiceImpl;

public class LoginAction extends BaseAction{
	private String email;
	private String password;
	private String errorInfo;
	private boolean ok;
	private String username;

	public String execute(){
		UserService service = new UserServiceImpl();
		try{
			if(service.checkLogin(email, password)!=null){
				System.out.println("登陆成功!");
				return "success";
			}else{
				System.out.println(email);
				errorInfo = "用户名或密码错误，请重试";
				return "fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			errorInfo = "用户名或密码错误，请重试";
			return "fail";
		}
	}
	//验证是否登陆
	public String isLogin(){
		try{
			UserService service = new UserServiceImpl();
			if(service.isLogin()){
				ok = true;
			}else{
				ok = false;
			}
			User u = (User) ActionContext.getContext().getSession().get("user");
			if(u!=null) username = u.getUsername();			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	//退出登陆
	public String logOut(){
		try{
			UserService service = new UserServiceImpl();
			service.logOut();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getErrorInfo() {
		return errorInfo;
	}
	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}	
	
	
}
