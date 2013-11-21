package action.main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import service.FeedbackService;
import service.impl.FeedbackServiceImpl;
import entity.Feedback;
import entity.User;
import action.BaseAction;

public class FeedbackAction extends BaseAction{
	private String subject;
	private String content;
	private int gid;
	private int ok;
	private List<Feedback> feedbacks = new ArrayList<Feedback>();
	

	public String ajaxAdd(){
		try{
			if(ActionContext.getContext().getSession().get("user")==null){
				ok = 2;//用户未登录
				return "fail";
			}
			FeedbackService service = new FeedbackServiceImpl();
			Feedback f = new Feedback();
			f.setSubject(subject);
			f.setContent(content);
			f.setGid(gid);
			String ip = httpRequest.getRemoteAddr();
			f.setIp(ip);
			User user = (User) ActionContext.getContext().getSession().get("user");
			f.setUid(user.getUid());
			f.setUsername(user.getUsername());
			int addtime = (int)(new Date().getTime()/1000);		
			f.setAddtime(addtime);
			service.add(f);
			ok = 1;//发布成功
		}catch (Exception e) {
			e.printStackTrace();
			ok = 0;//发布失败
		}
		return "ajaxAdd";
	}
	


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public int getOk() {
		return ok;
	}

	public void setOk(int ok) {
		this.ok = ok;
	}

	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public List<Feedback> getFeedbacks() {
		return feedbacks;
	}
	public void setFeedbacks(List<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}
}
