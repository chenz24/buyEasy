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

public class SearchAction extends BaseAction{
	private BookQuery query = new BookQuery();
	private int p;
	private List<Book> books;
	private String pager;
	private String simplePage;
	private List<Book> recommends;
	private List<Category> topcats = new ArrayList<Category>();//搜索框用
	private int catid;
	private String priceorder;
	private String currurl;
	private List<Category> catTree;
	
	public String execute(){
		try{
			CategoryService catServ = new CategoryServiceImpl();
			BookService service = new BookServiceImpl();
			BookDao dao = new BookDaoImpl();
			catTree = catServ.CatTree(0);//树形列表
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			//设置 搜索条件
			String cats = catServ.findChildrenIds(catid);
			query.setCatid(cats);
			String temp = query.getTitle();
			if(temp!=null) temp = new String(temp.getBytes("ISO-8859-1"),"utf-8");
			query.setTitle(temp);
			temp = query.getAuthor();
			if(temp!=null) temp = new String(temp.getBytes("ISO-8859-1"),"utf-8");
			System.out.println(temp);
			query.setAuthor(temp);
			temp = query.getPublisher();
			if(temp!=null) temp = new String(temp.getBytes("ISO-8859-1"),"utf-8");
			query.setPublisher(temp);
			if(priceorder!=null){
				query.setOrder(priceorder);
			}else{
				priceorder = "priceAsc";
			}
			if(priceorder=="priceAsc"){
				priceorder = "priceDsc";
			}else if(priceorder=="priceAsc"){
				priceorder = "priceDsc";
			}
			query.setNum(Constant.PERPAGE);
			int total = dao.countByQuery(query);
			if(p==0) p = 1;
			String curpage = httpRequest.getRequestURI();//当前页面uri
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			currurl = curpage;
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"");//分页
			pager = page.getPager(0);
			simplePage = page.getPager(1);
			query.setP(p);
			books = service.findByQuery(query);
			//根据条件返回一个列表
			BookQuery recommend = new BookQuery();
			recommend.setCatid(cats);
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

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public String getPriceorder() {
		return priceorder;
	}

	public void setPriceorder(String priceorder) {
		this.priceorder = priceorder;
	}

	public String getCurrurl() {
		return currurl;
	}

	public void setCurrurl(String currurl) {
		this.currurl = currurl;
	}

	public List<Category> getCatTree() {
		return catTree;
	}

	public void setCatTree(List<Category> catTree) {
		this.catTree = catTree;
	}
	
	
}
