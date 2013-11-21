package util;

public class Pager {
	private int total;
	private int perpage;
	private int curpage;
	private String qryurl;
	private int maxpage;
	private int page;//显示的分页个数
	//private int simple;
	private String onclick;
	
	public Pager(int total,int perpage,int curpage,String qryurl,int maxpage,int page,String onclick){
		this.total = total;
		this.perpage = perpage;
		this.curpage = curpage;
		this.maxpage = maxpage;
		this.page = page;
		//this.simple = simple;
		this.onclick = onclick;
		if(curpage < 0){
			this.curpage = 0;
		}
		if(qryurl.indexOf("p=")>0){
			this.qryurl = qryurl.substring(0, qryurl.indexOf("p="));
		}else if(qryurl.indexOf("?")<0){
			this.qryurl = qryurl + "?";
		}else{
			this.qryurl = qryurl + "&";
		}
	}
	
	public String getPager(int type){
		StringBuilder pager = new StringBuilder();
		int from;
		int to;
		int offset;
		int realpages;//理论总页数
		int pages;//实际总页数
		
		if(total > perpage){
			offset = 2;//当前页前面的页数
			realpages = (int) Math.ceil(((double)total / perpage));
			System.out.println("pager:" + realpages);//debug
			pages = maxpage!=0&&maxpage<realpages ? maxpage : realpages;
			//如果实际总页数小于显示页数
			if(page > pages){
				from = 1;
				to = pages;
			}else{
				from = curpage - offset;//起始页
				to = from + page - 1;//终止页
				if(from < 1){
					to = curpage + 1 - from;
					from = 1;
					if(to - from < pages){
						to = page;
					}
				}else if(to > pages){
					from = pages - page + 1;
					to = pages;
				}			
			}

			if(curpage!=1){
				pager.append("<a href='"+ qryurl  + "p=1'>首页</a>");
			}else{
				pager.append("<a class='void'>首页</a>");
			}
			if(curpage > 1){
				pager.append("<a href='" + qryurl + "p=" + (curpage - 1) + "'>上一页</a>");		
			}else{
				pager.append("<a class='void'>上一页</a>");
			}
			//这里添加simple控制
			if(type != 1){
				for(int i = from; i<=to; i++){
					if(i == curpage){
						pager.append("<a class='current'>" + i + "</a>");
					}else{
						pager.append("<a href='" + qryurl + "p=" + i + "'>" + i + "</a>");
					}
				}
			}else{
				pager.append("<span class='current'>" + curpage + "/" + pages + "</span>");
			}
			
			if(curpage < pages){
				pager.append("<a href='" + qryurl + "p=" + (curpage + 1) + "'>下一页</a>");
			}else{
				pager.append("<a class='void'>下一页</a>");
			}
			if(curpage < pages){
				pager.append("<a href='" + qryurl + "p="+ pages + "'>末页</a>");
			}else{
				pager.append("<a class='void'>末页</a>");
			}
			if(type != 1){
				pager.append("<span>" + curpage + "/" + pages +"</span><span>共"  + total + "条</span><span>");
			}
		}else{
			pager.append("当前共一页  " + total + " 条记录");
		}		
		return pager.toString();
	}

	public String getjsPager(int type){
		StringBuilder pager = new StringBuilder();
		int from;
		int to;
		int offset;
		int realpages;//理论总页数
		int pages;//实际总页数
		
		if(total > perpage){
			offset = 2;//当前页前面的页数
			realpages = (int) Math.ceil(((double)total / perpage));
			System.out.println("pager:" + realpages);//debug
			pages = maxpage!=0&&maxpage<realpages ? maxpage : realpages;
			//如果实际总页数小于显示页数
			if(page > pages){
				from = 1;
				to = pages;
			}else{
				from = curpage - offset;//起始页
				to = from + page - 1;//终止页
				if(from < 1){
					to = curpage + 1 - from;
					from = 1;
					if(to - from < pages){
						to = page;
					}
				}else if(to > pages){
					from = pages - page + 1;
					to = pages;
				}			
			}

			if(curpage!=1){
				pager.append("<a href='javascript:void(0);' onclick='" + onclick + "(1)" + "'>首页</a>");
			}else{
				pager.append("<a class='void'>首页</a>");
			}
			if(curpage > 1){
				pager.append("<a href='javascript:void(0);' onclick='" + onclick + "(" + (curpage - 1) + ")" + "'>上一页</a>");		
			}else{
				pager.append("<a class='void'>上一页</a>");
			}
			//这里添加simple控制
			if(type != 1){
				for(int i = from; i<=to; i++){
					if(i == curpage){
						pager.append("<a class='current'>" + i + "</a>");
					}else{
						pager.append("<a href='javascript:void(0);' onclick='" + onclick + "(" + i + ")" + "'>" + i + "</a>");
					}
				}
			}else{
				pager.append("<span class='current'>" + curpage + "/" + pages + "</span>");
			}
			
			if(curpage < pages){
				pager.append("<a href='javascript:void(0);' onclick='" + onclick + "(" + (curpage + 1) + ")'>下一页</a>");
			}else{
				pager.append("<a class='void'>下一页</a>");
			}
			if(curpage < pages){
				pager.append("<a href='javascript:void(0);' onclick='"  + onclick + "(" + pages + ")'>末页</a>");
			}else{
				pager.append("<a class='void'>末页</a>");
			}
			if(type != 1){
				pager.append("<span>" + curpage + "/" + pages +"</span><span>共"  + total + "条</span><span>");
			}
		}else{
			pager.append("当前共一页  " + total + " 条记录");
		}		
		return pager.toString();
	}
	
}
