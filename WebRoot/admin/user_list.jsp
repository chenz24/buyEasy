<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='css/admin_style.css'>
<link rel='stylesheet' type='text/css' href='css/dialog.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/admin_all.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/dialog.js"></script>
<script type="text/javascript">
<!--
function Imgshow(vname,img){
	art.dialog({
    padding: 0,
    title: vname,
    content: '<img src="'+img+'" width="183" height="248" alt="'+vname+'" />',
    lock: true
});
	}
	-->
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="5" cellspacing="1" class="table">
<tr>
  <td colspan="8" class="table_title"><span class="fl">商品管理</span><span class="fr"><a href="bookForm.do">添加商品</a></span></td>
</tr>
<form action="bookList.do" method="get" id="gxform" name="gxform">
<tr class="tr">
<td colspan="8"><span style="float:left"><label>搜索订单：&nbsp;&nbsp;</label>
</span>&nbsp;&nbsp;<input name="query.username" type="text" id="title" size="20" value="<s:property value="query.username" />">&nbsp;&nbsp;<input type="submit" value="搜 索" class="bginput" title="输入关键字" onKeyDown="diableReturn(event)"/>&nbsp;&nbsp;</td>
</tr>
<tr align="center" class="list_head">
<td width="70">编号
  <a href=""><img src="images/admin/down.gif" border="0" alt="点击按ID降序排列"></a></td>
<td >email</td>
<td width="80">用户名</td>
<td width="50">登陆IP</td>
<td width="90">注册时间<a href=""><img src="images/admin/up.gif" border="0" alt="点击按时间升序排列"></a></td>
<td width="105">操作</td>
</tr>
<s:iterator value="users" status="state">
<tr class="tr" align="center">
<td align="left"><input name='ids[]' type='checkbox' value='65' class="noborder" checked="checked">${uid}</td>
<td align="left" style="color:#999"><a href="#" target="_blank">${email}</a>
</td>
<td class="td"><a href="bookList.do?catid=${catid}">${username}</a></td>
<td id="isser65" class="td">${lastloginip}</td>
<td class="td">2012-07-13</td>
<td class="td"><a href="orderEdit.do?id=<s:property value="oid"/>" title="点击修改订单">编辑</a> <a href="" onClick="return confirm('确定删除该订单吗?')" title="点击删除">删除</a>  </td>
</tr>
</s:iterator>

<tr class="tr"><td colspan="8" class="pages"><s:property value="pager" escape="false"/>&nbsp;<input type="input" name="page" id="page" class="pageinput"/>
<input type="button" value="跳 转" onclick="" class="pagebg"/></td></tr>
<tr class="tr"><td colspan="8">
<input type="button" id="checkall" value="全/反选" class="bginput">&nbsp;&nbsp;
<input type="submit" value="批量审核" class="bginput" onClick="gxform.action='?s=Admin/Video/Statusall/sid/1';" />&nbsp;&nbsp;<input type="submit" value="取消审核" class="bginput" onClick="gxform.action='?s=Admin/Video/Statusall/sid/0';" />&nbsp;&nbsp;<input type="submit" value="批量删除" onClick="if(confirm('删除后将无法还原,确定要删除吗?')){gxform.action='?s=Admin/Video/Delall';}else{return false}" class="bginput"/>&nbsp;&nbsp;<input type="button" value="批量生成" id="createhtml" name="Videoid" class="bginput" disabled/>&nbsp;&nbsp;<input type="button" id="changecid" name="changecid" class="bginput" value="批量移动"/></td>
</tr>
</form>
</table>
<!--连载框 -->
<div id="msg_tbc" class="tbc-block"></div>
<!--浮动层 -->
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery_jqmodal.js"></script>
<link rel='stylesheet' type='text/css' href='css/jquery_jqmodal.css'>
<style>#dia_title{height:25px;line-height:25px}.jqmWindow{height:200px;}</style>
<div class="jqmWindow" id="dialog">
<div id="dia_title"><span class="jqmTitle"></span><a href="javascript:void(0)" class="jqmClose" title="关闭窗口"></a></div>
<div id="dia_content"></div>
</div>
<script language="JavaScript" type="text/javascript">
//弹出浮动层 $('#dialog').jqm({modal: true, trigger: 'a.showDialog'});
$('#dialog').jqm({modal: false, trigger: '#window' , opacity:'0.1'});
</script>
<style>#dia_title{height:25px;line-height:25px}.jqmWindow{height:300px;width:500px;}</style>
<script language="JavaScript" type="text/javascript">
function showhtml(id){
	$.get('?s=Admin/Html/Videoid/ids/'+id,null,function(data){
		$("#html_"+id).html('<font color=#ff0000>'+data+'</font>');
		window.setTimeout(function(){
			$("#html_"+id).html('');
		},1000);
	});
}
//ajax请求:选择星级控制
var sendStar = function(videoid,star,obj){
	$.ajax({
		  type: 'get',
		  url: "?s=Admin/Video/Stars/id/"+videoid+"/sid/"+star,
		  data: videoid,
		  success:function(){
			var collect = obj.parentNode.children;
			for(var i=0;i<collect.length;i++)
			{
				if(star<=i)
				{
					collect[i].className = 'star-0';
				}else{
					collect[i].className = 'star-1';
				}
			}
		}
	});
}
//ajax请求:弹出设置连载信息浮动层;
var ToBContinue = function(id){
	var offset = $("#isser"+id).offset();
	var top = offset.top+55;
	var left = offset.left-260;
	var serial = $("#serial_"+id).html();
	var html = '连载至第 <input id="tbc_serial" value="'+serial+'" type="text" size="5" style="text-align:center" title="完结请填写0" maxlength="25"/> 集 <input type="button" class="bginput" onClick="submitVideoState('+id+')" value="确定" style="cursor:pointer" /> <input type="button" class="bginput" onClick="closeTBC();" value="取消" style="cursor:pointer" />';
	$('#msg_tbc').css({left:left,top:top});
	$('#msg_tbc').html(html);
	$('#msg_tbc').show(1,function(){
		$('#msg_tbc').animate({
			"top": "-=50px",
			"opacity": 1
		});
	});	
}
//信息浮动层:(确认后)>改变连载图标并且在影片名称后面提示连载信息');
var submitVideoState = function(videoid){
	var serial = $('#tbc_serial').val();
	$.ajax({
		type : "post",
		url : "?s=Admin/Video/Serial",
		data: "id="+videoid+"&sid="+serial,
		success:function($string){
			closeTBC();
			if(serial=='0'||serial=='') {
				$('#serial_'+videoid).html('');
				$("#isser"+videoid+'>img').attr('src','images/admin/icon_02.gif');
			}else{
				$('#serial_'+videoid).html(serial);
				$("#isser"+videoid+'>img').attr('src','images/admin/icon_01.gif');				
			}
		}		
	});
}
//信息浮动层:(取消后，浮动层消失);
var closeTBC = function(id){
	$('#msg_tbc').animate({
		"top": "-=50px",
		"opacity": 0
	});
}
</script>
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