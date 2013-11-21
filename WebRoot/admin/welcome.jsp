<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>环境检测</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='css/admin_style.css'>
<head>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery.js"></script>
<style>td{ height:22px; line-height:22px}</style>
</head>
<body>
<table width="98%" border="0" cellpadding="4" cellspacing="1" class="table">
  <tr class="table_title">
    <td colspan="2">系统环境检测：</td>
  </tr>
  <tr class="ji">
    <td width="200">主机名 (IP：端口)：</td>
    <td ><%=request.getServerName() %> (:<%=request.getServerPort()%>)</td>
  </tr>
  <tr class="ou">
    <td>服务器IP：</td>
    <td><%=request.getLocalAddr() %></td>
  </tr>
  <tr class="ji">
    <td>服务器时间：</td>
    <td><%= new Date() %></td>
  </tr>
  <tr class="ou">
    <td>服务器引擎：</td>
    <td><%=getServletContext().getServerInfo() %></td>
  </tr>
  <tr class="ji">
    <td>HTTP解译引擎：</td>
    <td><%=request.getProtocol() %></td>
  </tr>
  <tr class="ou">
    <td>服务器所在地区：</td>
    <td><%=request.getLocale() %></td>
  </tr>
  <tr class="ji">
    <td>服务器时区：</td>
    <td><%=System.getProperty("user.timezone") %></td>
  </tr>
  <tr class="ou">
    <td>服务器操作系统：</td>
    <td><%=System.getProperty("os.name") + System.getProperty("os.version")%></td>
  </tr>
 <%
		  	float fFreeMemory=(float)Runtime.getRuntime().freeMemory();
			float fTotalMemory=(float)Runtime.getRuntime().totalMemory();
			float fPercent=fFreeMemory/fTotalMemory*100;
 %> 
  <tr class="ji">
    <td>java虚拟机剩余内存：</td>
    <td><%=fFreeMemory/1024/1024%>M</td>
  </tr>
  <tr class="ou">
    <td>java虚拟机分配内存：</td>
    <td><%=fTotalMemory/1024/1024%>M</td>
  </tr>     
</table>
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