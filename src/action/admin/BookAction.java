package action.admin;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dao.BookDao;
import dao.impl.BookDaoImpl;

import service.AdminService;
import service.BookService;
import service.CategoryService;
import service.impl.AdminServiceImpl;
import service.impl.BookServiceImpl;
import service.impl.CategoryServiceImpl;
import util.Pager;
import util.Constant;
import entity.Book;
import entity.BookQuery;
import entity.Category;
import action.BaseAction;

public class BookAction extends BaseAction{
	private Book book;
	private Map<Integer, String> categorys = new LinkedHashMap<Integer, String>();
	private int id;
	private String ids;
	private String formTitle;
	private String action;
	private String msg;
	private String url;
	private String publish_time;
	private String print_time;
	private BookQuery query = new BookQuery();
	private List<Book> books;
	private int p;
	private String pager;
	private int catid;
	
	

	
	
	BookService service = new BookServiceImpl();
	public String form(){
		action = "bookAdd.do";
		formTitle = "添加商品";
		try{
			AdminService adminServ = new AdminServiceImpl();
			book = new Book();
			book.setCatid(id);
			categorys = adminServ.catOptions();
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	/**
	 * 提交数据
	 * @return
	 */
	public String add(){
		try{
			msg = "添加成功！";
			url = "bookForm.do";
			//下面这段可以写在service里
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			if(print_time.trim().equals("")){
				print_time = "2012-07-14";
			}
			if(publish_time.trim().equals("")){
				publish_time = "2012-07-14";
			}
			System.out.println(print_time);//debug
			book.setPublish_time((int)(format.parse(publish_time).getTime()/1000));
			book.setPrint_time((int)(format.parse(print_time).getTime()/1000));
			Date time = new Date();
			book.setInputtime((int)(time.getTime()/1000));
			book.setUpdatetime((int)(time.getTime()/1000));	
			service.add(book);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			msg = "添加失败！";
			url = "bookForm.do";
			return "fail";
		}
	}
	
	//商品列表
	public String list(){
		try{
			AdminService adminServ = new AdminServiceImpl();
			categorys = adminServ.catOptions();
			BookDao dao = new BookDaoImpl();
			String title = httpRequest.getParameter("query.title");
			//中文乱码问题
			if(title!=null) title = new String(title.getBytes("ISO-8859-1"),"utf-8");		
			query.setTitle(title);
			//
			CategoryService catServ = new CategoryServiceImpl();
			String cats = catServ.findChildrenIds(catid);
			query.setCatid(cats);
			int total = dao.countByQuery(query);
			if(p==0) p = 1;
			String curpage = httpRequest.getRequestURI();
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"");
			pager = page.getPager(0);		
			query.setP(p);
			query.setNum(Constant.PERPAGE);//设定每页显示的数量
			books = service.findByQuery(query);
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			msg = "发生错误";
			return "fail";
		}
	}
	
	//商品编辑
	public String edit(){
		try{
			action = "bookModify.do";
			formTitle = "编辑商品";
			book = service.findById(id);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Long time = new Long(book.getPublish_time())* 1000;//这里注意要把时间戳转成毫秒
			publish_time = format.format(time);
			time = new Long(book.getPrint_time())*1000;
			print_time = format.format(time);
			AdminService adminServ = new AdminServiceImpl();
			categorys = adminServ.catOptions();
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	//商品编辑入库
	public String modify(){
		try{
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");	
			book.setPublish_time((int)(format.parse(publish_time).getTime()/1000));
			book.setPrint_time((int)(format.parse(print_time).getTime()/1000));
			System.out.println("print_time" + book.getPrint_time());
			System.out.println("publish_time" + book.getPublish_time());
			Date time = new Date();
			book.setUpdatetime((int)(time.getTime()/1000));
			service.modify(book);
			msg = "修改成功";
			url = "bookList.do";
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
			url = "bookList.do";
			return "fail";
		}
	}
	
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public String getPager() {
		return pager;
	}

	public void setPager(String pager) {
		this.pager = pager;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public BookQuery getQuery() {
		return query;
	}

	public void setQuery(BookQuery query) {
		this.query = query;
	}

	public String getPublish_time() {
		return publish_time;
	}

	public void setPublish_time(String publishTime) {
		publish_time = publishTime;
	}

	public String getPrint_time() {
		return print_time;
	}

	public void setPrint_time(String printTime) {
		print_time = printTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getFormTitle() {
		return formTitle;
	}

	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Map<Integer, String> getCategorys() {
		return categorys;
	}

	public void setCategorys(Map<Integer, String> categorys) {
		this.categorys = categorys;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
