package service;

import java.util.List;
import java.util.Map;

import entity.Category;


public interface AdminService {
	public Map<String, String> configs() throws Exception;
	public void updateConfig(Map<String, String> configs) throws Exception;
	public void categoryAdd(Category catgory) throws Exception;
	public Map<Integer, String> catOptions() throws Exception;
	public List<Category> findAll() throws Exception;
	public Category findById(int id) throws Exception;
	public void modify(int id,Category c) throws Exception;
	public void delete(int id) throws Exception;
}
