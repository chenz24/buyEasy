<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>栏目管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='./css/admin_style.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/jquery.js"></script>
<script language="javascript">
function verify(){
	if($("#catname").val()==""){
		alert("栏目名称不能为空");
		return false;	
	}
}
</script>
</head>
<body>
<table width="98%" border="0" cellpadding="4" cellspacing="1" class="table">
<form action="${action}" method="post" name="catform" id="catform" onsubmit="return verify();"> 
<input type="hidden" name="category.cid" value="<s:property value="category.cid" />" />
<tr class="table_title"><td colspan="2">${formTitle}栏目：</td></tr>
<tr class="ji"><td class="rt">所属分类：</td>
<td>
<s:select list="categorys" theme="simple" name="category.parentId" listKey="key" listValue="value" headerKey="0" headerValue="选择父栏目"></s:select>
 * 不选择将成为一级分类</td></tr>
<tr class="tr"><td width="17%" class="rt">模型分类：</td>
<td>
  <select name="category.model" id="mid" style="width:132px">
  <option value="1" >书店模型 | video</option>
  <option value="2" >文章模型 | info</option>
  </select> *(功能暂无)</td>
</tr>
<tr class="ji"><td class="rt" width="25%" >栏目名称：</td><td><input type="text" name="category.catName" id="catname" value="<s:property value="category.catName" />" size="20" maxlength="50" class=""> * </td>
</tr>          
<tr class="tr"><td class="rt">栏目排序：</td><td ><input type="text" name="category.listOrder"  id="listorder" value="" size="20" maxlength="6" class=""> * 越小越前面</td></tr>
<tr class="ji" id="channelseo">
<td class="rt">本栏目使用的模板名：</td>
<td><input type="text" name="tpl" id="ctpl" value="" size="20" maxlength="100" class=""> * </td>
</tr> 
<tr class="tr" id="trcfile">
  <td class="rt">自定义栏目英文别名：</td>
  <td><input type="text" name="cfile" id="cfile" value="" size="20" maxlength="50" class=""> * 唯一性</td>
</tr>
<tr class="ji">
  <td class="rt">栏目SEO标题：</td>
  <td><input type="text" name="category.seotitle" id="seotitle" value="" maxlength="50" size="40"></td>
</tr>
<tr class="tr">
  <td class="rt">栏目SEO关键词：</td>
  <td><input type="text" name="category.keywords" id="keywords" value="" maxlength="255" size="40"></td>
</tr>
<tr class="ji">
  <td class="rt">栏目SEO简介：</td>
  <td><textarea name="category.description" id="description"  style="width:301px; height:40px"></textarea></td>
</tr>
<tr class="tr" id="channelwebsite" style="display:none">
  <td class="rt">外部链接地址：</td>
  <td><input type="text" name="cwebsite" id="cwebsite" value="http://" maxlength="255" style="width:400px"></td>
</tr>
<tr class="ji">
  <td class="rt">是否关闭：</td>
  <td><input type="radio" name="category.hidden" value="0" checked="checked"/>否<input type="radio" name="ishidden" value="1" />是</td>
</tr>
<tr class="tr ct">
  <td colspan="2"><input type="hidden" name="id" id="id" value="0">
    <input class="bginput" type="submit" value="提交" >
    <input class="bginput" type="reset" name="Input" value="重置" >
  </td>
</tr>
</form>
</table>
<script language="javascript">
function changeid(){
	var $pidval = $('#pid').val();
	if($pidval == 0){
		var $tplname = '_channel';
	}else{
		var $tplname = '_list';
	}
	var $midval = $('#mid').val();
	if($midval == 1){
		$('#ctpl').val('video'+$tplname);
		showseo(1);
	}else if($midval == 2){
		$('#ctpl').val('info'+$tplname);
		showseo(1);
	}else{ 
		showseo(9);
	}
};
function showseo($val){
	if($val<3){
		//$('#cfiles').remove();
		$('#channelseo').css({display:''});
		$('#channelwebsite').css({display:"none"});	
	}else{
		//$('#cfile').after("<span id='cfiles'></span>");
		$('#cfile').val($('#cfile').val().length);
		$('#channelseo').css({display:"none"});
		$('#channelwebsite').css({display:''});	
	}
}
$(document).ready(function(){
	$('#pid').change(function(){
		changeid();
	});
	$('#mid').change(function(){
		changeid();
	});
	});
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