package action.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import service.AdminService;
import service.impl.AdminServiceImpl;
import entity.Category;

public class CategoryAction {
	private Category category;
	private Map<Integer, String> categorys = new LinkedHashMap<Integer, String>();
	private List<Category> list = new ArrayList<Category>();
	private int id;
	private String ids;
	private String formTitle;
	private String action;
	private String msg;
	private String url;
	

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Category> getList() {
		return list;
	}

	public void setList(List<Category> list) {
		this.list = list;
	}

	public Map<Integer, String> getCategorys() {
		return categorys;
	}

	public void setCategorys(Map<Integer, String> categorys) {
		this.categorys = categorys;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getFormTitle() {
		return formTitle;
	}

	public void setFormTitle(String formTitle) {
		this.formTitle = formTitle;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	AdminService service = new AdminServiceImpl();
	//栏目查看
	public String show(){
		formTitle = "添加";
		action = "categoryAdd.do";
		try{
			category = new Category();//这里注意初始化
			category.setParentId(id);
			//System.out.println(category.toString());//debug		
			categorys = service.catOptions();
			//System.out.println(categorys.toString());//debug
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
		
	}
	//栏目添加入库
	public String add(){		
		try{
			System.out.println("栏目名称：" + category.getCatName());//debug
			service.categoryAdd(category);
			msg = "栏目添加成功!";
			url = "categoryList.do";
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	//栏目列表
	public String list(){		
		try{
			list = service.findAll();
			System.out.println(list.size());//debug
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	//栏目编辑页面
	public String edit(){
		formTitle = "编辑";
		action = "categoryModify.do";
		try{
			categorys = service.catOptions();
			category = service.findById(id);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
	}
	//栏目编辑更新入库
	public String modify(){
		try{
			service.modify(category.getCid(), category);
			msg = "栏目编辑成功!";
			url = "categoryList.do";
			return "success";
		}catch(Exception e){
			msg = "栏目编辑失败!";
			url = "categoryList.do";
			e.printStackTrace();
			return "fail";
		}
	}
	//栏目删除
	public String delete(){
		try{
			service.delete(id);
			msg = "栏目删除成功!";
			url = "categoryList.do";
			return "success";
		}catch (Exception e) {
			e.printStackTrace();
			msg = "栏目删除失败!";
			url = "categoryList.do";
			return "fail";
		}
	}
}
