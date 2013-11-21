<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>栏目频道列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='./css/admin_style.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/jquery.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/admin_all.js"></script>
</head>
<body>
<form action="category.php" method="post" name="catform" id="catform">
<table width="98%" border="0" cellpadding="4" cellspacing="1" class="table">
  <tr class="table_title">
    <td colspan="10">栏目分类列表</td>
  </tr>
  <tr class="list_head ct">
    <td width="50">编号</td>
    <td >栏目名称</td>
    <td width="70">类型</td>
    <td width="70">记录</td>
    <td width="70">发表</td>
    <td width="70">内容</td>
    <td width="90">创建</td>
    <td width="50">状态</td>
    <td width="70">操作</td>
    <td width="50">排序</td>
  </tr>
 <s:iterator value="list" status="state">
  <tr class="tr ct">
    <td ><input type='checkbox' name='ids' value='<s:property value="cid" />' class="noborder"><s:property value="cid" /></td>
    <td class="lt">【<a href="categoryEdit.do?cid=<s:property value="cid" />" ><s:property value="catName" /></a>】</td>
    <td class="td">大分类</td>
    <td class="td"><font color="red"><s:property value="count" /></font>条</td>
    <td class="td"><a href="bookForm.do?id=${cid}">发布内容</a></td>
    <td class="td"><a href="bookList.do?catid=${cid}">查看内容</a></td>
    <td class="td"><a href="categoryShow.do?id=<s:property value="cid" />">创建子栏目</a></td>
    <td class="td"><a href="javascript:void(0)" title="显示状态,将在导航栏上显示">显示</a></td>
    <td class="td"><a href="categoryEdit.do?id=<s:property value="cid" />">编辑</a> <a href="categoryDel.do?ids=<s:property value="cid" />" onClick="alert('演示站，删除功能暂时屏蔽！');return false;">删除</a></td>
    <td class="td"><input type='text' name='category.listOrder' value='<s:property value="listOrder" />' class="bginput" style="width:22px;" maxlength="3"></td>
  </tr>
 </s:iterator>  
    <tr>
    <td colspan="10" bgcolor="#FFFFFF">
    <input style="*padding-top:2px;" class="bginput" type="button" id="checkall" value="全/反选">
     <input type="submit" value="批量删除" onClick="if(confirm('删除功能暂时屏蔽')){catform.action='#';}else{return false}" class="bginput"/>&nbsp;&nbsp;
     <input type="submit" value="修改排序" name="Submit"  class="bginput"  onclick="catform.action='category.php?act=updateorder';"/> 注：删除分类将删除该分类下面的所有内容</td>
  </tr>
</table>
</form>
<style>
#footer, #footer a:link, #footer a:visited {
	clear:both;
	color:#0072e3;
	font:12px/1.5 Arial;
	margin-top:10px;
	text-align:center;
	white-space:nowrap;
}
</style>
<div id="footer">程序版本：1.0&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2012-2013 All rights reserved</div>
</body>
</html>