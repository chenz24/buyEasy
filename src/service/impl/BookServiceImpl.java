package service.impl;

import java.util.List;

import dao.BookDao;
import dao.impl.BookDaoImpl;
import entity.Book;
import entity.BookQuery;
import service.BookService;

public class BookServiceImpl implements BookService{
	//商品添加入库
	public void add(Book book) throws Exception{
		BookDao dao = new BookDaoImpl();
		dao.add(book);
	}
	//列出所有商品
	public List<Book> findByQuery(BookQuery query) throws Exception{
		BookDao dao = new BookDaoImpl();
		List<Book> books = dao.findByQuery(query);
		return books;
	}
	//根据ID查找
	public Book findById(int id) throws Exception{
		BookDao dao = new BookDaoImpl();
		Book book = dao.findById(id);
		return book;
	}
	//商品编辑入库
	public void modify(Book book) throws Exception{
		BookDao dao = new BookDaoImpl();
		dao.modify(book);
	}
}
