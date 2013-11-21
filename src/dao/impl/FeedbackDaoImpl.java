package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.Constant;
import util.DBUtil;
import dao.FeedbackDao;
import entity.Feedback;

public class FeedbackDaoImpl implements FeedbackDao{

	public void add(Feedback f) throws Exception,SQLException {
		String sql = "insert into feedback (uid,username,subject,content,ip,addtime,gid) values" +
						"(?,?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, f.getUid());
		pst.setString(2, f.getUsername());
		pst.setString(3, f.getSubject());
		pst.setString(4, f.getContent());
		pst.setString(5, f.getIp());
		pst.setInt(6, f.getAddtime());
		pst.setInt(7, f.getGid());
		pst.executeUpdate();
		//更新统计待写
		DBUtil.closeConnection();
	}

	public List<Feedback> feedbacks(int gid,int p) throws Exception {
		String sql = "select * from feedback where gid=? limit " + (p-1) * Constant.PERPAGE + "," + Constant.PERPAGE;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, gid);
		ResultSet rs = pst.executeQuery();
		List<Feedback> feedbacks = new ArrayList<Feedback>();
		while(rs.next()){
			Feedback f = new Feedback();
			f.setGid(rs.getInt("gid"));
			f.setUid(rs.getInt("uid"));
			f.setUsername(rs.getString("username"));
			f.setSubject(rs.getString("subject"));
			f.setContent(rs.getString("content"));
			f.setAddtime(rs.getInt("addtime"));
			feedbacks.add(f);
		}
		return feedbacks;
	}
	
	public int count(int gid) throws Exception{
		String sql = "select count(*) as c from feedback where gid=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, gid);
		ResultSet rs = pst.executeQuery();
		int count = 0;
		if(rs.next()){
			count = rs.getInt("c");
		}
		return count;
	}

}
