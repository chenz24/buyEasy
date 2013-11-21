package action.main;

import java.util.ArrayList;
import java.util.List;

import dao.FeedbackDao;
import dao.impl.FeedbackDaoImpl;

import service.FeedbackService;
import service.impl.FeedbackServiceImpl;
import util.Constant;
import util.Pager;

import entity.Feedback;
import action.BaseAction;

public class FeedbackAjaxAction extends BaseAction{
	private List<Feedback> feedbacks = new ArrayList<Feedback>();
	private int gid;
	private int p;
	private String pager;
	
	
	
	public String execute(){
		try{
			Thread.sleep(1000);//loading效果
			FeedbackService service = new FeedbackServiceImpl();
			FeedbackDao dao = new FeedbackDaoImpl();
			if(p==0) p = 1;
			feedbacks = service.feedbacks(gid,p);
			String curpage = httpRequest.getRequestURI();//当前页面uri
			if(httpRequest.getQueryString()!=null){
				curpage = curpage + "?" + httpRequest.getQueryString();
			}
			int total = dao.count(gid);
			Pager page = new Pager(total, Constant.PERPAGE, p, curpage, 0, 6,"feedback");//分页
			pager = page.getjsPager(0);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}


	public List<Feedback> getFeedbacks() {
		return feedbacks;
	}


	public void setFeedbacks(List<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}


	public int getGid() {
		return gid;
	}


	public void setGid(int gid) {
		this.gid = gid;
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
}
