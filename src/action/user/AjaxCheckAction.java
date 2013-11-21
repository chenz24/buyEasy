package action.user;

import entity.User;
import service.UserService;
import service.impl.UserServiceImpl;
import action.BaseAction;

public class AjaxCheckAction extends BaseAction{
	private String email;
	private String emailcode;
	private String checkCode;
	private String username;
	private int uid;
	private boolean ok;
	
	public String getEmailcode() {
		return emailcode;
	}

	public void setEmailcode(String emailcode) {
		this.emailcode = emailcode;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
		
	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	UserService service = new UserServiceImpl();
	//检测email
	public String checkEmail(){
		try{
			System.out.println(email);
			if(service.verifyEmail(email)){
				ok = true;
			}else{
				ok= false;
			}
			return "success";
		}catch(Exception e){
			System.out.println(email);
			e.printStackTrace();
			return "fail";
			
		}
	}
	//检测验证码
	public String veriCheckCode(){
		System.out.println(checkCode);
		try{		
			if(service.verifyCode(checkCode)){
				ok = true;
			}else{
				ok = false;
			}
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	//检测用户名
	public String checkUser(){
		try{
			if(service.verifyName(username)){
				ok = true;
			}else{
				ok = false;
			}
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}		
	}
	//检测邮箱验证码
	public String verifyEmailCode(){
		System.out.println("ajax :" + uid);
		try{
			if(service.verifyEmailCode(uid,emailcode)){
				ok = true;
			}else{
				ok = false;
			}
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
}
