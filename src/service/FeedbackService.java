package service;

import java.util.List;

import entity.Feedback;

public interface FeedbackService {
	public void add(Feedback f) throws Exception;
	public List<Feedback> feedbacks(int id,int p) throws Exception;
}
