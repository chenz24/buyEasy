package action.admin;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import entity.Config;

import service.AdminService;
import service.impl.AdminServiceImpl;

import action.BaseAction;

public class ConfigSettingAction extends BaseAction{

	private Map<String, String> configs;
	private Config config;
	

	public Config getConfig() {
		return config;
	}

	public void setConfig(Config config) {
		this.config = config;
	}

	public Map<String, String> getConfigs() {
		return configs;
	}

	public void setConfigs(Map<String, String> configs) {
		this.configs = configs;
	}
	
	public String show(){
		AdminService service = new AdminServiceImpl();
		try{
			configs = service.configs();
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	
	public String update(){
		AdminService service = new AdminServiceImpl();
		try{
			service.updateConfig(configs);
			//把一些公共信息写入application
			ActionContext.getContext().getApplication().put("sitename", configs.get("sitename"));
			System.out.println("configaction");
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
		
	}
}
