package action.main;

import java.util.ArrayList;
import java.util.List;

import service.BookService;
import service.CategoryService;
import service.impl.BookServiceImpl;
import service.impl.CategoryServiceImpl;

import entity.Book;
import entity.BookQuery;
import entity.Category;
import action.BaseAction;

public class DetailAction extends BaseAction{
	private int id;
	private Book book;
	private List<Book> recommends;
	private List<Category> catTree;
	private String position;
	private String msg;
	private List<Category> topcats = new ArrayList<Category>();//搜索框用
	
	
	public String execute(){
		try{
			if(id == 0){
				msg="参数错误";
				return "fail";
			}
			BookService service = new BookServiceImpl();
			book = service.findById(id);
			CategoryService catServ = new CategoryServiceImpl();
			topcats = catServ.findSiblings(0);//找出顶级栏目，用在搜索框
			position = catServ.position(book.getCatid());//当前位置
			catTree = catServ.CatTree(0);//弹出层栏目框
			BookQuery recommend = new BookQuery();
			recommend.setCatid(book.getCatid() + "");
			recommend.setNum(10);//设定读取的数量
			recommends = service.findByQuery(recommend);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public List<Book> getRecommends() {
		return recommends;
	}
	public void setRecommends(List<Book> recommends) {
		this.recommends = recommends;
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<Category> getTopcats() {
		return topcats;
	}
	public void setTopcats(List<Category> topcats) {
		this.topcats = topcats;
	}
	
}
