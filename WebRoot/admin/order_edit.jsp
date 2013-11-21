<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加/编辑订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='css/admin_style.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<form action="orderModify.do" method="post" name="gxform" id="gxform">
<input type="hidden" name="order.oid" value="${order.oid}">
  
<table width="98%" border="0" cellpadding="4" cellspacing="1" class="table">
<tr class="table_title"><td colspan="4">编辑订单资料</td></tr>
<tr class="tr rt">
<td width="100">会员帐号：</td>
<td colspan="3" class="lt"><input type="text" name="order.uid" maxlength="150" style="width:200px" value="游客"> *</td>
</tr>
<tr class="tr rt">
<td >总价格：</td>
<td colspan="3"class="lt"><input type="text" name="order.total_price" maxlength="50" style="width:200px" value="<s:property value="order.total_price" />"> *</td></tr> 
<tr class="tr rt">
<td >收件人：</td>
<td colspan="3"class="lt"><input type="text" name="order.receive_name" maxlength="20" style="width:200px" value="${order.receive_name}"></td>
</tr>
<tr class="tr rt">
<td >收件地址：</td>
<td colspan="3"class="lt"><input type="text" name="order.full_address" maxlength="20" style="width:200px" value="${order.full_address}"> </td>
</tr>
<tr class="tr rt">
<td >邮政编码：</td>
<td colspan="3"class="lt"><input type="text" name="order.zipcode" maxlength="150" style="width:200px" value="${order.zipcode}"> *</td>
</tr> 
<tr class="tr rt">
<td >电话：</td>
<td colspan="3"class="lt"><input type="text" name="order.tel" maxlength="150" style="width:200px" value="${order.tel}"> *</td>
</tr>
<tr class="tr rt">
<td >手机：</td>
<td colspan="3"class="lt"><input type="text" name="order.mobile" maxlength="150" value="${order.mobile}" style="width:200px"/></td>
</tr> 
<tr class="tr rt">
<td >订单状态：</td>
<td colspan="3"class="lt"><input type="text" name="order.status" maxlength="150" style="width:200px" value="${order.status}"></td>
</tr>
<tr class="tr rt">
<td >订单时间：</td>
<td colspan="3"class="lt"><input type="text" name="order.ordertime" maxlength="50" style="width:200px" value="2011-03-23 11:57:10"></td>
</tr>
<tr class="tr lt">
<td colspan="4"><input class="bginput" type="submit" name="submit" value=" 修 改" ></td>
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