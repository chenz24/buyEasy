<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加/编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='./css/admin_style.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/jquery.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/admin_all.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<script language="javascript">
var editor;
KindEditor.ready(function(K) {
  editor = K.create('textarea[name="book.passage"]', {
	  cssPath : '../kindeditor/plugins/code/prettify.css',
	  uploadJson : 'upload_json.jsp',
	  fileManagerJson : 'file_manager_json.jsp',
	  allowFileManager : true
  });
  editor2 = K.create('textarea[name="book.catalog"]', {
	  cssPath : '../kindeditor/plugins/code/prettify.css',
	  uploadJson : 'upload_json.jsp',
	  fileManagerJson : 'file_manager_json.jsp',
	  allowFileManager : true
  });
});
$(function(){
	$("#picurl").change(function(){
		$("#litpic").attr("src",$("#picurl").val());
		})
	})
	KindEditor.ready(function(K) {
			var editor = K.editor({
				allowFileManager : true
			});
			K('#uploadpic').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						imageUrl : K('#picurl').val(),
						clickFn : function(url, title, width, height, border, align) {
							K('#picurl').val(url);
							$('#litpic').attr('src',url);
							editor.hideDialog();
						}
					});
				});
			});
		});

//表单检测
function verify(){
	if($("#title").val()==""){
		alert("标题不能为空");
		return false;	
	}
	if($("#catid").val()=="0"){
		alert("分类不能为空");
		return false;	
	}
	if($("#price").val()=="0.0"){
		alert("请填写价格");
		return false;	
	}
	if($("#discount").val()=="0"){
		alert("请填写折扣");
		return false;	
	}
	if($("#picurl").val()==""){
		alert("请输入图片网址");
		return false;	
	}
}	
</script>
<style>
.litpic{float:left;width:175px;height:155px;border:1px solid #c6dcf2;margin:3px 10px;}
.litpic img{width:175px;height:155px}
</style>
</head>
<body> 
<form name="update" action="${action}" method="post" id="ezform"  onsubmit="return verify();">
<input type="hidden" name="book.gid" value="<s:property value="book.gid" />" />
<table cellpadding="0" cellspacing="0" class="boxadd">
<tr class="tabs_title">
    <td><span id="tabs" class="fl"><a class="on" href="javascript:void(0)" name="1,2" hideFocus='true'>${formTitle}</a><a class="tab2" href="javascript:void(0)" name="2,2" hideFocus='true'>其它设置</a></span><span class="fr"><a href="bookList.do" class="no">返回数据管理</a></span>
    </td>
</tr>
<tr><td>
<div id="showtab_1" style="border-top:1px solid #C6DCF2;">
<ul>
<li class="l"><label>标 题：</label><input name="book.title" id="title" type="text" class="input" maxlength="255" value="<s:property value="book.title" />"></li>
<li class="r"><label>跳转网址：</label><input name="book.url" type="text" maxlenth="100" value="<s:property value="book.url" />" class="input"></li>
</ul>
<div style="float:left;width:800px;">
<ul>
<li class="r"><label>分 类：</label>
<s:select list="categorys" theme="simple" name="book.catid" id="catud" listKey="key" listValue="value" headerKey="0" headerValue="请选择栏目"></s:select>
</li>
<li class="r"><label>属性：</label><select name="book.attr"><option value="0">普通</option> <option value="1" <s:if test="book.attr==1"> selected</s:if>>推荐</option> </select></li>
</ul>
<ul>
<li class="l"><label>关键词：</label><input name="book.keywords" type="text" class="input" maxlength="255" value="<s:property value="book.keywords" />" title="半角逗号分隔"> 多个关键词用,号分开</li>
</ul>
<ul>
<li class="r"><label>价 格：</label><input name="book.price" id="price" type="text" size="10"  value="<s:property value="book.price" />" ></li>
<li class="r"><label>折 扣：</label><input name="book.discount" id="discount" type="text" size="10" value="<s:property value="book.discount" />" ></li>
<li class="r"><label>库 存：</label><input name="book.stocks" type="text" size="10" value="<s:property value="book.stocks" />" ></li>
</ul>
<ul>
<li class="r"><label>评论数：</label><input name="book.posts" type="text" size="10" value="<s:property value="book.posts" />"  title=""></li>
<li class="r"><label>点击数：</label><input name="book.clicks" type="text" size="10" value="<s:property value="book.clicks" />"  title=""></li>
<li class="r"><label>购买数：</label><input name="book.sales_num" type="text" size="10" value="<s:property value="book.sales_num" />"  title=""></li>
</ul>
<ul>
<li class="l"><label>缩略图：</label><input name="book.thumb" id="picurl" type="text" class="input" maxlength="255" value="<s:property value="book.thumb" />"> <input type="button" name="uploadpic" class="bginput" id="uploadpic" value=" 上 传 "/></li>
</ul>
</div>
<div class="litpic">
<img src="${book.thumb}" id="litpic"/>
</div>

<ul style="height:105px;line-height:105px;padding:5px 0px">
<li style="padding-left:22px;float:left;"><label>编辑推荐：</label></li>
<li style="float:left"><textarea name='book.description' style="width:780px;height:100px" title="文章简介"><s:property value="book.description" /></textarea></li>
</ul>
<ul style="height:325px;line-height:325px;padding:5px 0px">
<li style="padding-left:22px;float:left;"><label>内容提要：</label></li>
<li style="float:left">
<textarea name="book.passage" id="content" style="width:800px;height:320px;visibility:hidden;"><s:property value="book.passage" /></textarea>
</li>
</ul>
</div>
<div id="showtab_2" style="display:none;border-top:1px solid #C6DCF2;text-align:left">
<ul>
    <li class="r"><label>状态：</label><select name="book.status"><option value="1" >已审核</option><option value="0" <s:if test="book.status==0" > selected </s:if>>未审核</option></select></li>
    <li class="r"><label>作者：</label><input name="book.author" type="text" size="15" value="<s:property value="book.author" />"  maxlength="15"></li>
</ul>
<ul>
    <li class="r"><label>出版社:</label><input name="book.publisher" type="text" size="15" value="<s:property value="book.publisher" />"  maxlength="15"></li>
    <li class="r"><label>出版时间：</label><input name="publish_time" type="text" size="15" value="${publish_time}"  maxlength="15" onClick="WdatePicker()"  class="Wdate"></li>
</ul>
<ul>
    <li class="r"><label>字数：</label><input name="book.word_num" type="text" size="15" value="<s:property value="book.word_num" />"  maxlength="15"></li>
    <li class="r"><label>版本：</label><input name="book.edition" type="text" size="15" value="<s:property value="book.edition" />"  maxlength="15"></li>
</ul>
<ul>
    <li class="r"><label>isbn号：</label><input name="book.isbn" type="text" size="15" value="<s:property value="book.isbn" />"  maxlength="15"></li>
    <li class="r"><label>页数：</label><input name="book.pages" type="text" size="15" value="<s:property value="book.pages" />"  maxlength="15"></li>
</ul>
<ul>
<li class="r"><label>开本：</label><input name="book.book_size" type="text" size="15" value="<s:property value="book.book_size" />"  maxlength="15"></li>
<li class="r"><label>印刷时间：</label><input name="print_time" type="text" size="15" value="<s:property value="print_time" />"  maxlength="15" onClick="WdatePicker()"  class="Wdate"></li>
</ul>
<ul>
<li class="l" title="勾选则使用系统当前时间"><label>添加时间：</label><input name="inputtime" type="text" size="20" maxlength="35" value="" onClick="WdatePicker()"  class="Wdate">
 <input name="checktime" type="checkbox" class="noborder" value="1" checked></li></ul>
<ul>
<!--<li class="l">
<label>更新时间：</label>
<input name="updatetime" type="text" maxlength="35" value="" onClick="WdatePicker()"  class="Wdate">
</li>-->
</ul>
<ul style="height:105px;line-height:105px;padding:5px 0px">
<li style="padding-left:22px;float:left;"><label>作者简介：</label></li>
<li style="float:left"><textarea name='book.author_intro' style="width:800px;height:100px" title="作者简介"><s:property value="book.author_intro" /></textarea></li>
</ul>
<ul style="height:325px;line-height:325px;padding:5px 0px">
<li class="r"><label>目录：</label></li>
<li style="float:left">
<textarea name="book.catalog" id="catalog" style="width:800px;height:320px;visibility:hidden;"><s:property value="book.catalog" /></textarea>
</li>
</ul>
</div>
<ul>
<li style="margin-left:70px;text-align:left;padding-top:5px">
<input class="bginput" type="submit" name="submit" value=" 提 交 " > <input class="bginput" type="reset" name="Input" value=" 重 置 " ></li>
</ul>
</td></tr>
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