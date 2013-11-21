package dao;

import java.util.List;

import entity.Feedback;

public interface FeedbackDao {
	public void add(Feedback f) throws Exception;
	public List<Feedback> feedbacks(int gid,int p) throws Exception;
	public int count(int gid) throws Exception;
}
