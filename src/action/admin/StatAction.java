package action.admin;

import dao.AdminDao;
import dao.BookDao;
import dao.impl.AdminDaoImpl;
import dao.impl.BookDaoImpl;
import entity.BookQuery;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

public class StatAction {
	private String msg;
	private String url;
	
	public String execute(){
		try{
			CategoryService service = new CategoryServiceImpl();
			BookDao dao = new BookDaoImpl();
			AdminDao adao = new AdminDaoImpl();
			String ids = service.findChildrenIds(0);
			String[] idArr = ids.split("[,]");
			BookQuery query = new BookQuery();
			int total = 0;
			for(int i=0;i<idArr.length;i++){
				int currentId = Integer.parseInt(idArr[i]);//遍历到的当前ID
				String cids = service.findChildrenIds(currentId);//找到所有子类
				query.setCatid(cids);
				total = dao.countByQuery(query);//统计文档数量
				adao.statUpdate(currentId, total);
			}
			msg = "统计更新成功！";
			url = "categoryList.do";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
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
}
