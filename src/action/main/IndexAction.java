package action.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import service.BookService;
import service.CategoryService;
import service.impl.BookServiceImpl;
import service.impl.CategoryServiceImpl;

import entity.Book;
import entity.BookQuery;
import entity.Category;
import action.BaseAction;

public class IndexAction extends BaseAction{
	private List<Category> catTree;
	private BookQuery query = new BookQuery();
	private List<Category> topcats = new ArrayList<Category>();//搜索框用
	private List<Category> topCatgories = new ArrayList<Category>();//首页主要内容栏目
	private Map<Integer, List<Category>> soncats = new HashMap<Integer, List<Category>>();
	private Map<Integer, List<Book>> books = new HashMap<Integer, List<Book>>();
	private Map<Integer, List<Book>> recommend = new HashMap<Integer, List<Book>>();
	private List<Book> special = new ArrayList<Book>();
	
	public String execute(){
		try{
			CategoryService catServ = new CategoryServiceImpl();
			BookService service = new BookServiceImpl();
			//特别推荐
			query.setAttr(1);
			query.setNum(4);
			special = service.findByQuery(query);
			topcats = catServ.findSiblings(0);//顶级栏目，用于搜索框
			catTree = catServ.CatTree(0);//栏目树
			//循环读取顶级栏目
			List<Integer> catids = new ArrayList<Integer>();
			catids.add(1);
			catids.add(2);
			catids.add(3);
			catids.add(4);
			//catids.add(5);
			//catids.add(6);
			catids.add(7);
			//catids.add(8);
			catids.add(10);
			Iterator<Integer> it = catids.iterator();
			query.setAttr(0);
			query.setNum(10);
			while(it.hasNext()){
				int cid = it.next();
				Category c = catServ.findById(cid);
				topCatgories.add(c);//这里有bug
				List<Category> list = catServ.findSiblings(cid);
				soncats.put(cid, list);
				String ids = catServ.findChildrenIds(cid);
				query.setCatid(ids);
				List<Book> booklist = service.findByQuery(query);
				books.put(cid, booklist);
				recommend.put(cid, booklist);//推荐列表
			}
			//循环读取一级子栏目
			
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public List<Category> getCatTree() {
		return catTree;
	}

	public void setCatTree(List<Category> catTree) {
		this.catTree = catTree;
	}

	public BookQuery getQuery() {
		return query;
	}

	public void setQuery(BookQuery query) {
		this.query = query;
	}

	public List<Category> getTopcats() {
		return topcats;
	}

	public void setTopcats(List<Category> topcats) {
		this.topcats = topcats;
	}

	public List<Category> getTopCatgories() {
		return topCatgories;
	}

	public void setTopCatgories(List<Category> topCatgories) {
		this.topCatgories = topCatgories;
	}

	public Map<Integer, List<Category>> getSoncats() {
		return soncats;
	}

	public void setSoncats(Map<Integer, List<Category>> soncats) {
		this.soncats = soncats;
	}

	public Map<Integer, List<Book>> getBooks() {
		return books;
	}

	public void setBooks(Map<Integer, List<Book>> books) {
		this.books = books;
	}

	public Map<Integer, List<Book>> getRecommend() {
		return recommend;
	}

	public void setRecommend(Map<Integer, List<Book>> recommend) {
		this.recommend = recommend;
	}

	public List<Book> getSpecial() {
		return special;
	}

	public void setSpecial(List<Book> special) {
		this.special = special;
	}
	
	
}
