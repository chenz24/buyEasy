package action.user;

import com.opensymphony.xwork2.ActionContext;

import dao.UserDao;
import dao.impl.UserDaoImpl;

import service.UserService;
import service.impl.UserServiceImpl;
import util.EmailUtil;
import util.VerifyUtil;
import entity.User;
import action.BaseAction;

public class RegAction extends BaseAction{
	private User user;
	private String checkCode;
	private String emailCode;
	private int uid;
	private String errorInfo;
	


	public String execute(){
		try{
			UserService service = new UserServiceImpl();
			
			//验证码校验
			if(!service.verifyCode(checkCode)){
				System.out.println("验证码错误");
				errorInfo = "验证码错误！";
				return "fail";
			}
			//email校验
			if(service.verifyEmail(user.getEmail())){
				System.out.println("email已经被占用");
				errorInfo = "email已经注册过";
				return "fail";
			}
			//用户名校验
			if(service.verifyName(user.getUsername())){
				System.out.println("昵称已被占用！请换个吧");//暂不禁止同名
			}
			String emailcode = VerifyUtil.getVerifyCode();//邮箱注册码
			user.setEmail_verify_code(emailcode);	
			String ip = httpRequest.getRemoteAddr();
			service.register(user, ip);
			//EmailUtil.sendEmail(user.getEmail(), emailcode);
			System.out.println("emailcode: " + emailcode);
			//将以下三个变量放入session
			//ActionContext.getContext().getSession().put("emailcode", emailcode);
			ActionContext.getContext().getSession().put("user", user);
//			ActionContext.getContext().getSession().put("username", user.getUsername());
//			ActionContext.getContext().getSession().put("email", user.getEmail());
//			ActionContext.getContext().getSession().put("emailcode", user.getEmail());
			return "verify";
		}catch(Exception e){
			e.printStackTrace();
			errorInfo = "注册出现错误，请重试！或者联系管理员";
			return "fail";
		}
	}
	
	public String regOk(){
		UserService service = new UserServiceImpl();
		try{
			if(service.verifyEmailCode(uid, emailCode)){
				UserDao dao = new UserDaoImpl();
				dao.verifyUser(1, uid);
				
				return "success";
			}else{
				errorInfo = "邮箱验证码填写错误！";
				return "fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
		
		
	}
	
	public String getErrorInfo() {
		return errorInfo;
	}

	public void setErrorInfo(String errorInfo) {
		this.errorInfo = errorInfo;
	}

	public String getEmailCode() {
		return emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
