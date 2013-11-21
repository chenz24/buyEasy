package service;

import java.util.List;

import entity.Book;
import entity.BookQuery;

public interface BookService {
	public void add(Book book) throws Exception;
	public List<Book> findByQuery(BookQuery query) throws Exception;
	public Book findById(int id) throws Exception;
	public void modify(Book book) throws Exception;
}
