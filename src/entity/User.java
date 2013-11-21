package entity;

public class User {
	private int uid;
	private String username;
	private String password;
	private String email;
	private String regip;
	private int regdate;
	private String lastloginip;
	private int lastlogindate;
	private int status;
	private String email_verify_code;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEmail_verify_code() {
		return email_verify_code;
	}
	public void setEmail_verify_code(String emailVerifyCode) {
		email_verify_code = emailVerifyCode;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public int getRegdate() {
		return regdate;
	}
	public void setRegdate(int regdate) {
		this.regdate = regdate;
	}
	public String getLastloginip() {
		return lastloginip;
	}
	public void setLastloginip(String lastloginip) {
		this.lastloginip = lastloginip;
	}
	public int getLastlogindate() {
		return lastlogindate;
	}
	public void setLastlogindate(int lastlogindate) {
		this.lastlogindate = lastlogindate;
	}
	
	
}
