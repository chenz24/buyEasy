package dao;

import java.util.List;

import entity.User;
import entity.UserQuery;

public interface UserDao {
	public void save(User user) throws Exception;
	public void update(User user,int uid) throws Exception;
	public User findByEmail(String email) throws Exception;
	public User findById(int id) throws Exception;
	public String verifyEmailCode(int uid) throws Exception;
	public void verifyUser(int level,int uid) throws Exception;
	public List<User> findByQuery(UserQuery query) throws Exception;
	public int countByQuery(UserQuery query) throws Exception;
}
