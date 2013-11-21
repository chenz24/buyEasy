package action.main;

import java.util.ArrayList;
import java.util.List;

import dao.BookDao;
import dao.impl.BookDaoImpl;

import service.BookService;
import service.CategoryService;
import service.impl.BookServiceImpl;
import service.impl.CategoryServiceImpl;
import util.Constant;
import util.Pager;

import entity.Book;
import entity.BookQuery;
import entity.Category;
import action.BaseAction;

public class ListAction extends BaseAction{
	private BookQuery query = new BookQuery();
	private int catid;
	private Category category;
	private int p;
	private List<Book> books;
	private String pager;
	private String simplePage;
	private List<Category> catTree;
	private String position;
	private List<Category> siblings;
	private List<Book> recommends;
	private List<Category> topcats = new ArrayList<Category>();//搜索框用


	public String list(){
		try{
			if(catid == 0) return "fail";
			//左侧分类树
			CategoryService catServ = new CategoryServiceImpl();
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			//获取本栏目基本信息，title，description之类
			category = catServ.findById(catid);
			//当前位置
			position = catServ.position(catid);
			//获得兄弟类列表
			siblings = catServ.findSiblings(category.getParentId());
			//左侧弹出层栏目
			catTree = catServ.CatTree(0);
			BookService service = new BookServiceImpl();
			//查找子分类
			String ids = catServ.findChildrenIds(catid);
			BookDao dao = new BookDaoImpl();
			query.setCatid(ids);//查找返回列表
			query.setNum(Constant.PERPAGE);
			int total = dao.countByQuery(query);
			if(p==0) p = 1;
			String curpage = httpRequest.getRequestURI();//当前页面uri
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"");//分页
			pager = page.getPager(0);
			simplePage = page.getPager(1);
			query.setP(p);
			books = service.findByQuery(query);
			//根据条件返回一个列表
			BookQuery recommend = new BookQuery();
			recommend.setCatid(ids);
			recommend.setNum(5);//设定读取的数量
			recommends = service.findByQuery(recommend);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	public BookQuery getQuery() {
		return query;
	}


	public void setQuery(BookQuery query) {
		this.query = query;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int catid) {
		this.catid = catid;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public String getPager() {
		return pager;
	}

	public void setPager(String pager) {
		this.pager = pager;
	}

	public List<Category> getCatTree() {
		return catTree;
	}

	public void setCatTree(List<Category> catTree) {
		this.catTree = catTree;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getSiblings() {
		return siblings;
	}

	public void setSiblings(List<Category> siblings) {
		this.siblings = siblings;
	}

	public String getSimplePage() {
		return simplePage;
	}

	public void setSimplePage(String simplePage) {
		this.simplePage = simplePage;
	}

	public List<Book> getRecommends() {
		return recommends;
	}

	public void setRecommends(List<Book> recommends) {
		this.recommends = recommends;
	}

	public List<Category> getTopcats() {
		return topcats;
	}

	public void setTopcats(List<Category> topcats) {
		this.topcats = topcats;
	}
}
