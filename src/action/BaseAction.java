package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;


public class BaseAction implements ServletRequestAware,SessionAware,CookiesAware,RequestAware{
	protected HttpServletRequest httpRequest;
	protected Map<String, Object> session;
	protected Map<String, String> cookie;
	protected Map<String, Object> request;
	
	public void setServletRequest(HttpServletRequest httpRequest) {
		this.httpRequest = httpRequest;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setCookiesMap(Map<String, String> cookie){
		this.cookie = cookie;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	
}
