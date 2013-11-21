package service;

import java.util.List;

import entity.Category;

public interface CategoryService {
	public List<Category> CatTree(int nodeId) throws Exception;
	public String position(int id) throws Exception;
	public Category findById(int id) throws Exception;
	public List<Category> findSiblings(int pid) throws Exception;
	public String findChildrenIds(int cid) throws Exception;
}
