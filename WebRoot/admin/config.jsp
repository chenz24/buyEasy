<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>网站信息设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='./css/admin_style.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="./js/jquery.js"></script>
<style type="text/css">
<!--
.red{color:#f03;}
-->
</style>
</head>
<body>
<table width="98%" border="0" cellpadding="4" cellspacing="1" class="table">
<form action="configUpdate.do"  method="post" id="gxform">
<tr class="table_title"><td colspan="2">网站信息设置</td></tr>
<tr class="ji">
  <td class="left">网站名称</td>
  <td><input type="text" name="configs['sitename']" size="35" maxlength="50" value="<s:property value="configs['sitename']" />"> *</td>
</tr>
<tr class="tr">
  <td class="left">网站域名</td>
  <td ><input type="text" name="configs['domain']" size="35" maxlength="50" value="<s:property value="configs['domain']" />" title="系统所安装的地址,结尾必须加斜杠 '/'"> *
  </td>
</tr>
<tr class="ji">
  <td class="left">安装路径</td>
  <td><input type="text" name="cfg[sitepath]" size="35" maxlength="50" value="<s:property value="configs['domain']" />" title="结尾必须加斜杠 '/', 根目录请填写'/'"> *
  </td>
</tr>
<tr class="tr">
  <td class="left">站长Email</td>
  <td><input type="text" name="configs['email']" size="35" value="<s:property value="configs['email']" />">
  </td>
</tr>
 <tr class="tr">
  <td class="left">站长QQ</td>
  <td><input type="text" name="configs['qq']" size="35" value="<s:property value="configs['qq']" />">
  </td>
</tr>   
 <tr class="ji">
  <td class="left">ICP备案信息</td>
  <td><input type="text" name="configs['icp']" size="35" value="<s:property value="configs['icp']" />"></td>
</tr>
<tr class="tr">
  <td class="left">SEO关键字描述</td>
  <td><input name="configs['keywords']"  type="text" value="<s:property value="configs['keywords']" />" style="width:495px" maxlength="255">
  </td>
</tr>
<tr class="ji">
  <td class="left">SEO网页内容信息描述</td>
  <td><input name="configs['description']" type="text" value="<s:property value="configs['description']" />" style="width:495px" maxlength="255">
  </td>
</tr>          
<tr class="tr">
  <td class="left">版权信息</td>
  <td title="设置本网站相关版权信息">
    <textarea name="configs['copyright']" style="width:500px;height:50px"><s:property value="configs['copyright']" /></textarea> <br>
  </td>
</tr> 
 <tr class="ji">
  <td class="left">第三方统计代码</td>
  <td>
    <textarea name="configs['stat']" style="width:500px; height:50px"><s:property value="configs['stat" /></textarea> <br>
  </td>
</tr> 
<tr class="tr">
  <td class="left">模板主题方案</td>
  <td><select name="con[default_theme]"><option value="default" >default</option><option value="dyy5com" selected>dyy5com</option></select> 
  </td>
</tr>
<!--<tr class="table_title"><td colspan="2">个性参数设置</td></tr>         
<tr class="tr"> 
<td class="left">编辑数据更新时间</td>
<td><select name="con[web_admin_edittime]"><option value=1>开启</option><option value=0 >关闭</option></select> 开启则在后台编辑数据的时候默认勾上更新时间选项</td>
</tr> 
<tr class="ji">
<td class="left">数据管理排序方式</td>
<td><select name="con[web_admin_ordertype]"><option value="addtime">时间</option><option value="id" >ID值</option></select> 后台数据管理的默认排序字段(倒序方式)</td>
</tr>
<tr class="ji">
  <td class="left">后台分页显示条数</td>
  <td><input type="text" name="con[web_admin_pagenum]" size="5" maxlength="5" value="20" style="text-align:center"> 后台数据管理的每页默认显示条数
  </td>
</tr>
<tr class="ji">
  <td class="left">前台翻页信息最大值</td>
  <td><input type="text" name="con[web_home_pagenum]" size="5" maxlength="5" value="5" style="text-align:center"> 前台网站翻页信息左右显示的最大条数
  </td>
</tr>    
<tr class="tr">
  <td class="left">人气随机最大值</td>
  <td><input type="text" name="con[web_admin_hits]" size="5" maxlength="5" value="500" style="text-align:center"> 采集电影时随机生成的最大人气值
  </td>
</tr>
<tr class="tr red">
  <td class="left">人气统计方式</td>
  <td>
  <select  id='hits_way' name="con[web_hits_way]" onchange="javascript:Wayswitch();"><option value=0 >普通方式</option><option  value=1 >高级方式</option></select>
   访问量较大时采用 '高级方式',以缓解数据库压力。<span id='timeset' style='display:none;'>设置延迟更新时长为<input type="text" name="con[web_hits_time]" size="2" maxlength="2" value="5" style="text-align:center">s</span>
  </td>
</tr>
<tr class="tr">
  <td class="left">顶踩随机最大值</td>
  <td><input type="text" name="con[web_admin_updown]" size="5" maxlength="5" value="100" style="text-align:center"> 采集电影时随机生成的顶踩值
  </td>
</tr>
 <tr class="tr">
  <td class="left">评分随机最大值</td>
  <td><input type="text" name="con[web_admin_score]" size="5" maxlength="1" value="9" style="text-align:center"> 采集电影时随机生成的评分值,请输入(1-9)
  </td>
</tr>
<tr class="tr">
  <td class="left">影片相似检测长度差值</td>
  <td><input type="text" name="con[web_collect_num]" size="5" maxlength="1" value="3" style="text-align:center"> 根据该差值计算出来的影片标题如果存在则设为相似影片(推荐设为2，0为不使用该功能，征对不同资源站)
  </td>
</tr>
 <tr class="tr">
  <td class="left">广告保存目录</td>
  <td><input type="text" name="con[web_adsensepath]" size="20" maxlength="30" value="temp/Banner" style="text-align:center"> *广告JS文件保存路径(区分大小写,相对于安装目录)
  </td>
</tr>       
<tr class="ji">
  <td class="left">影片发行语言设置</td>
  <td><input type="text" name="con[web_admin_language]" size="70" maxlength="100" value="国语,粤语,英语,韩语,日语,法语,中文字幕,英文字幕"> 以半角逗号分开
  </td>
</tr>
<tr class="ji">
  <td class="left">影片发行地区设置</td>
  <td><input type="text" name="con[web_admin_area]" size="70" maxlength="100" value="中国,内地,香港,台湾,韩国,日本,美国,英国,法国,意大利,德国,西班牙,泰国"> 以半角逗号分开
  </td>
</tr>       
--><tr class="tr">
  <td colspan="2">
  	<input type="hidden" name="setting_sub" value="true">
    <input class="bginput" type="submit" name="submit" value="提交">
    <input class="bginput" type="reset" name="Input" value="重置" >
  </td>
</tr>
</form>
</table>
<script type="text/javascript">
<!--
function  Wayswitch(){
	var way=$('#hits_way').val();
	if(way=='0'){
	  $('#timeset').hide();
	}else{
	  $('#timeset').show();
	}
}
-->
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