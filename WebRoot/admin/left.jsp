<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>左侧导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='stylesheet' type='text/css' href='css/admin_left.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
function show(url){
	location.href = url;
}
</script>
<base target="main" />
</head>
<body>
<div class="menu">
<% String action = request.getParameter("action");%>
<% if(action.equals("setting")) {%>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">系统管理</a></dt>
    <dd>
      <ul id="items">
        <li><a href="config.do" target="main">网站信息设置</a></li>
        <li><a href="coming.jsp" target="main">支付方式</a></li>
        <li><a href="coming.jsp" target="main">配送方式</a></li>
        <li><a href="coming.jsp" target="main">地区列表</a></li>
        <li><a href="coming.jsp" target="main">用户中心设置</a></li>
        <li><a href="coming.jsp" target="main">快捷菜单设置</a></li>
        <li><a href="coming.jsp" target="main">数据库设置</a></li>
      </ul>
    </dd>
  </dl>
<% }else if(action.equals("content")) {%>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">商品管理</a></dt>
    <dd>
      <ul id="items">
        <li><a href="categoryList.do" target="main">栏目管理</a></li>
        <li><a href="categoryShow.do" target="main">添加栏目</a></li>
        <li><a href="bookList.do" target="main">商品列表</a></li>
        <li><a href="bookForm.do" target="main">添加商品</a></li>
        <li><a href="statUpdate.do" target="main">更新数量统计</a></li>       
        <li><a href="coming.jsp" target="main">商品评论</a></li>
        <li><a href="coming.jsp" target="main">合作商家</a></li>
        <li><a href="coming.jsp" target="main">缺货登记</a></li>
      </ul>
    </dd>
  </dl>
<% }else if(action.equals("order")){ %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">订单管理</a></dt>
    <dd>
      <ul id="items">
      	<li><a href="orderList.do" target="main">订单列表</a></li>
        <li><a href="coming.jsp" target="main">订单查询</a></li>
        <li><a href="coming.jsp" target="main">订单合并</a></li>
        <li><a href="coming.jsp" target="main">订单打印</a></li>
        <li><a href="coming.jsp" target="main">添加订单</a></li>
        <li><a href="coming.jsp" target="main">发货单列表</a></li>
        <li><a href="coming.jsp" target="main">退货单列表</a></li> 
      </ul>
    </dd>
  </dl>
<% }else if(action.equals("article")){ %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">文章管理</a></dt>
    <dd>
      <ul id="items">
        <li><a href="coming.jsp" target="main">文章分类</a></li>
        <li><a href="coming.jsp" target="main">文章列表</a></li>
        <li><a href="coming.jsp" target="main">发布文章</a></li>
        <li><a href="coming.jsp" target="main">文章评论</a></li>
      </ul>
    </dd>
  </dl>
<% } else if(action.equals("user")){ %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">会员管理</a></dt>
    <dd>
      <ul id="items">
        <li><a href="userList.do" target="main">会员列表</a></li>
        <li><a href="coming.jsp" target="main">会员等级</a></li>
        <li><a href="coming.jsp" target="main">生成当天新闻</a></li>
        <li><a href="coming.jsp" target="main">生成地图索引</a></li>
      </ul>
    </dd>
  </dl> 
<% } else if(action.equals("admin")){ %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">权限管理</a></dt>
    <dd>
      <ul id="items">
        <li><a href="coming.jsp" target="main">后台用户管理</a></li>
        <li><a href="coming.jsp" target="main">添加后台用户</a></li>      
        <li><a href="coming.jsp" target="main">角色管理</a></li>
        <li><a href="coming.jsp" target="main">管理日志</a></li>
      </ul>
    </dd>
  </dl> 
<% }else if(action.equals("caiji")) { %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target="_self">扩展工具</a></dt>
    <dd>
      <ul id="items">
        <li><a href="coming.jsp" target="main">广告管理</a></li>
        <li style="background:#e8f3fd;font-weight:600;"><a  href="coming.jsp" target="main" style="background:none;">添加广告</a></li>
        <li><a href="coming.jsp" target="main">友情链接管理</a></li>
        <li><a href="coming.jsp" target="main">文件管理</a></li>
        <li><a href="coming.jsp" target="main">邮件发送</a></li>
        <li><a href="coming.jsp" target="main">幻灯设置</a></li>
      </ul>
    </dd>
  </dl>
<% }else{ %>
  <dl>
    <dt><a onClick="showHide('items');" href="#" target=_self>自定义快捷菜单</a></dt>
    <dd>
      <ul id="items"><volist name="Think.config.web_admin_nav" id="gxcms">
        <li><a href="{$gxcms}" target="main">{$key|get_replace_html=0,10}</a></li>
      </volist></ul>
    </dd>
  </dl>
<% } %>
</div>
<script language="javascript">
function showHide(objname){
	$("#items").toggleClass("none"); 
}
</script>
</body>
</html>