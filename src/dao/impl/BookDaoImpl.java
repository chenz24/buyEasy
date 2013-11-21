package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import dao.BookDao;
import entity.Book;
import entity.BookQuery;

public class BookDaoImpl implements BookDao{
	
	public void add(Book book) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql1 = "insert into goods (catid,title,thumb,keywords,description,url," +
		 "clicks,posts,collects,sales_num,price,discount,stocks,status,uid,inputtime,updatetime) values" + 
		 "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql1);
		pst.setInt(1, book.getCatid());
		pst.setString(2, book.getTitle());
		pst.setString(3, book.getThumb());
		pst.setString(4, book.getKeywords());
		pst.setString(5, book.getDescription());
		pst.setString(6, book.getUrl());
		pst.setInt(7, book.getClicks());
		pst.setInt(8, book.getPosts());
		pst.setInt(9, book.getCollects());
		pst.setInt(10, book.getSales_num());
		pst.setDouble(11, book.getPrice());
		pst.setDouble(12, book.getDiscount());
		pst.setInt(13, book.getStocks());
		pst.setInt(14, book.getStatus());
		pst.setInt(15, book.getUid());
		pst.setInt(16, book.getInputtime());
		pst.setInt(17, book.getUpdatetime());
		pst.executeUpdate();
		//获取自增的ID
		ResultSet rs = pst.getGeneratedKeys();
		if(rs.next()){
			int id = rs.getInt(1);
			book.setBid(id);
			String sql2 = "insert into books (bid,author,publisher,publish_time,print_num,word_num," + 
							"edition,pages,isbn,author_intro,catalog,passage,print_time,book_size)" +
							"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql2);
			pst.setInt(1, book.getBid());
			pst.setString(2, book.getAuthor());
			pst.setString(3, book.getPublisher());
			pst.setInt(4, book.getPublish_time());
			pst.setInt(5, book.getPrint_num());
			pst.setInt(6, book.getWord_num());
			pst.setInt(7, book.getEdition());
			pst.setInt(8, book.getPages());
			pst.setString(9, book.getIsbn());
			pst.setString(10, book.getAuthor_intro());
			pst.setString(11, book.getCatalog());
			pst.setString(12, book.getPassage());
			pst.setInt(13, book.getPrint_time());
			pst.setInt(14, book.getBook_size());
			//如果books副表添加失败，删除主表。这里用事务怎么做。要做到两表的索引键相同，可以考虑使用外键吧。
			if(pst.executeUpdate()==0){
				String sql = "delete from goods where gid = ?";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				pst.executeUpdate();
			}
		}
		DBUtil.closeConnection();
	}
	
	public List<Book> findByQuery(BookQuery query) throws Exception{
		String where = "1 = 1";
		String limit = "";
		if(query.getAuthor()!=null){
			where = where + " and author = '" + query.getAuthor() + "'";
		}
		if(query.getTitle()!=null){
			where = where + " and title like '%" + query.getTitle() + "%'";
		}
		if(query.getCatid()!=null){
			where = where + " and catid in (" + query.getCatid() + ")";
		}
		if(query.getIsbn()!=null){
			where = where + " and isbn = '" + query.getIsbn() + "'";
		}
		if(query.getPublisher()!=null){
			where = where + " and publisher = '" + query.getPublisher() + "'";
		}
		if(query.getPrice1()!=0){
			where = where + " and price > " + query.getPrice1();
		}
		if(query.getPrice2()!=0){
			where = where + " and price < " + query.getPrice2();
		}
		if(query.getDiscount1()!=0){
			where = where + " and discount > " + query.getDiscount1();
		}
		if(query.getDiscount2()!=0){
			where = where + " and discount < " + query.getDiscount2();
		}
		if(query.getStatus()!=0){
			where = where + " and status = " + query.getStatus();
		}
		if(query.getAttr()!=0){
			where = where + " and attr = " + query.getAttr();
		}
		if(query.getOrder()==null){
			where = where + " order by gid desc";
		}else if(query.getOrder()=="priceAsc"){
			where = where + " order by price asc";
		}else if(query.getOrder()=="priceDsc"){
			where = where + " order by price desc";
		}
		if(query.getP()!=0&&query.getNum()!=0){
			int current = (query.getP()-1) * query.getNum();
			limit = " limit " + current + "," + query.getNum();
		}
		if(query.getP()==0&&query.getNum()!=0){
			limit = " limit 0," + query.getNum();
		}
		String sql = "select * from goods join books on goods.gid = books.bid join category on goods.catid = category.cid where " + where + limit;
		System.out.println(sql);//debug
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		List<Book> books = new ArrayList<Book>();
		while(rs.next()){
			Book b = new Book();
			//主表数据
			b.setGid(rs.getInt("gid"));
			b.setCatid(rs.getInt("catid"));
			b.setTitle(rs.getString("title"));
			b.setThumb(rs.getString("thumb"));
			b.setKeywords(rs.getString("keywords"));
			b.setDescription(rs.getString("description"));
			b.setUrl(rs.getString("url"));
			b.setClicks(rs.getInt("clicks"));
			b.setPosts(rs.getInt("posts"));
			b.setCollects(rs.getInt("collects"));
			b.setSales_num(rs.getInt("sales_num"));
			b.setPrice(rs.getDouble("price"));
			b.setDiscount(rs.getInt("discount"));
			b.setStocks(rs.getInt("stocks"));
			b.setStatus(rs.getInt("status"));
			b.setUid(rs.getInt("uid"));
			b.setInputtime(rs.getInt("inputtime"));
			b.setUpdatetime(rs.getInt("updatetime"));
			b.setAttr(rs.getInt("attr"));
			//副表数据
			b.setBid(rs.getInt("bid"));
			b.setAuthor(rs.getString("author"));
			b.setPublisher(rs.getString("publisher"));
			b.setPublish_time(rs.getInt("publish_time"));
			b.setPrint_num(rs.getInt("print_num"));
			b.setWord_num(rs.getInt("word_num"));
			b.setEdition(rs.getInt("edition"));
			b.setPages(rs.getInt("pages"));
			b.setIsbn(rs.getString("isbn"));
			b.setAuthor_intro(rs.getString("author_intro"));
			b.setCatalog(rs.getString("catalog"));
			b.setPassage(rs.getString("passage"));
			b.setPrint_time(rs.getInt("print_time"));
			b.setBook_size(rs.getInt("book_size"));
			b.setCatname(rs.getString("catname"));
			books.add(b);
		}
		DBUtil.closeConnection();
		return books;
	}
	/**
	 * 返回查询的总数
	 */
	public int countByQuery(BookQuery query) throws Exception{
		String where = "1 = 1";
		if(query.getAuthor()!=null){
			where = where + " and author = '" + query.getAuthor() + "'";
		}
		if(query.getTitle()!=null){
			where = where + " and title like '%" + query.getTitle() + "%'";
		}
		if(query.getCatid()!=null){
			where = where + " and catid in (" + query.getCatid() + ")";
		}
		if(query.getIsbn()!=null){
			where = where + " and isbn = '" + query.getIsbn() + "'";
		}
		if(query.getPublisher()!=null){
			where = where + " and publisher = '" + query.getPublisher() + "'";
		}
		if(query.getPrice1()!=0){
			where = where + " and price > " + query.getPrice1();
		}
		if(query.getPrice2()!=0){
			where = where + " and price < " + query.getPrice2();
		}
		if(query.getDiscount1()!=0){
			where = where + " and discount > " + query.getDiscount1();
		}
		if(query.getDiscount2()!=0){
			where = where + " and discount < " + query.getDiscount2();
		}
		if(query.getStatus()!=0){
			where = where + " and status = " + query.getStatus();
		}
		String sql = "select count(*) as total from goods join books on goods.gid = books.bid where " + where;
		System.out.println("bookdapimpl" + sql);//debug
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		int total;
		if(rs.next()){
			total = rs.getInt("total");
			System.out.println("total:" + total);
			DBUtil.closeConnection();
			return total;
		}else{
			DBUtil.closeConnection();
			return 0;
		}
		
	}
	//根据ID查找商品
	public Book findById(int id) throws Exception{
		Book b = new Book();
		String sql = "select * from goods join books on goods.gid = books.bid where gid = ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		if(rs.next()){
			b.setGid(rs.getInt("gid"));
			b.setCatid(rs.getInt("catid"));
			b.setTitle(rs.getString("title"));
			b.setThumb(rs.getString("thumb"));
			b.setKeywords(rs.getString("keywords"));
			b.setDescription(rs.getString("description"));
			b.setUrl(rs.getString("url"));
			b.setClicks(rs.getInt("clicks"));
			b.setPosts(rs.getInt("posts"));
			b.setCollects(rs.getInt("collects"));
			b.setSales_num(rs.getInt("sales_num"));
			b.setPrice(rs.getDouble("price"));
			b.setDiscount(rs.getInt("discount"));
			b.setStocks(rs.getInt("stocks"));
			b.setStatus(rs.getInt("status"));
			b.setUid(rs.getInt("uid"));
			b.setInputtime(rs.getInt("inputtime"));
			b.setUpdatetime(rs.getInt("updatetime"));
			b.setAttr(rs.getInt("attr"));
			//副表数据
			b.setBid(rs.getInt("bid"));
			b.setAuthor(rs.getString("author"));
			b.setPublisher(rs.getString("publisher"));
			b.setPublish_time(rs.getInt("publish_time"));
			b.setPrint_num(rs.getInt("print_num"));
			b.setWord_num(rs.getInt("word_num"));
			b.setEdition(rs.getInt("edition"));
			b.setPages(rs.getInt("pages"));
			b.setIsbn(rs.getString("isbn"));
			b.setAuthor_intro(rs.getString("author_intro"));
			b.setCatalog(rs.getString("catalog"));
			b.setPassage(rs.getString("passage"));
			b.setPrint_time(rs.getInt("print_time"));
			b.setBook_size(rs.getInt("book_size"));
		}
		DBUtil.closeConnection();
		return b;
	}
	/**
	 * 商品编辑入库
	 */
	public void modify(Book book) throws Exception{
		Connection conn = DBUtil.getConnection();
		String sql1 = "update goods set catid=?,title=?,thumb=?,keywords=?,description=?,url=?," +
						"clicks=?,posts=?,collects=?,sales_num=?,price=?,discount=?,stocks=?,status=?,uid=?,updatetime=?,attr=?" + 
						" where gid=?";
		PreparedStatement pst = conn.prepareStatement(sql1);
		pst.setInt(1, book.getCatid());
		pst.setString(2, book.getTitle());
		pst.setString(3, book.getThumb());
		pst.setString(4, book.getKeywords());
		pst.setString(5, book.getDescription());
		pst.setString(6, book.getUrl());
		pst.setInt(7, book.getClicks());
		pst.setInt(8, book.getPosts());
		pst.setInt(9, book.getCollects());
		pst.setInt(10, book.getSales_num());
		pst.setDouble(11, book.getPrice());
		pst.setDouble(12, book.getDiscount());
		pst.setInt(13, book.getStocks());
		pst.setInt(14, book.getStatus());
		pst.setInt(15, book.getUid());
		pst.setInt(16, book.getUpdatetime());
		pst.setInt(17, book.getAttr());
		pst.setInt(18, book.getGid());
		pst.executeUpdate();
		String sql2 = "update books set author=?,publisher=?,publish_time=?,print_num=?,word_num=?," + 
						"edition=?,pages=?,isbn=?,author_intro=?,catalog=?,passage=?,print_time=?,book_size=?" + 
						" where bid=?";
		pst = conn.prepareStatement(sql2);
		pst.setString(1, book.getAuthor());
		pst.setString(2, book.getPublisher());
		pst.setInt(3, book.getPublish_time());
		pst.setInt(4, book.getPrint_num());
		pst.setInt(5, book.getWord_num());
		pst.setInt(6, book.getEdition());
		pst.setInt(7, book.getPages());
		pst.setString(8, book.getIsbn());
		pst.setString(9, book.getAuthor_intro());
		pst.setString(10, book.getCatalog());
		pst.setString(11, book.getPassage());
		pst.setInt(12, book.getPrint_time());
		pst.setInt(13, book.getBook_size());
		pst.setInt(14, book.getGid());
		pst.executeUpdate();
		DBUtil.closeConnection();
	}
	
	
	
	
	
	
	
	
	
	
}
