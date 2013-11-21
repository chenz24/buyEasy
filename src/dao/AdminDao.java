package dao;

import java.util.List;
import java.util.Map;


import entity.Category;

public interface AdminDao {
	public Map<String, String> findConfigs() throws Exception;
	public void updateConfig(String key,String value) throws Exception;
	public void categoryAdd(Category category) throws Exception;
	public List<Category> findAll() throws Exception;
	public Category findById(int id)throws Exception;
	public void modify(int id,Category c) throws Exception;
	public void delete(int id) throws Exception;
	public void statUpdate(int cid,int count) throws Exception;
}
