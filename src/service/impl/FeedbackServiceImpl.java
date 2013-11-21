package service.impl;

import java.util.List;

import dao.FeedbackDao;
import dao.impl.FeedbackDaoImpl;
import entity.Feedback;
import service.FeedbackService;

public class FeedbackServiceImpl implements FeedbackService{

	public void add(Feedback f) throws Exception {
		FeedbackDao dao = new FeedbackDaoImpl();
		System.out.println(f.getIp());
		dao.add(f);
	}

	public List<Feedback> feedbacks(int id,int p) throws Exception {
		FeedbackDao dao = new FeedbackDaoImpl();
		List<Feedback> feedbacks = dao.feedbacks(id,p);
		return feedbacks;
	}

}
