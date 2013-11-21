package service;

import java.util.List;

import entity.User;
import entity.UserQuery;

public interface UserService {
	public void register(User user,String ip) throws Exception;
	public boolean verifyCode(String checkCode) throws Exception;
	public boolean verifyName(String name) throws Exception;
	public boolean verifyEmail(String email) throws Exception;
	public boolean verifyEmailCode(int uid,String emailcode) throws Exception;
	public User checkLogin(String email,String password) throws Exception;
	public boolean isLogin() throws Exception;
	public List<User> findByQuery(UserQuery query) throws Exception;
	public void logOut() throws Exception;
}
