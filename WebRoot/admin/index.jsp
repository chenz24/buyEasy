<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<TITLE>管理中心-${applicationScope.sitename}</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel='stylesheet' type='text/css' href='css/admin_index.css'> 
<link rel='stylesheet' type='text/css' href='css/admin_top.css'>
<link rel='stylesheet' type='text/css' href='css/admin_style.css'> 
<link rel='stylesheet' type='text/css' href='css/dialog.css'>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript" src="js/dialog.js"></script>

<script language="JavaScript">if(self!=top){top.location=self.location;}</script> 
<script>
	function Mapshow(){	
    art.dialog({id:'map',iframe:'?s=Admin/Index/menuMap', title:'后台地图', width:'650', height:'500', lock:true});
   }
</script>
 <script language="javascript">
$(document).ready(function(){
	$("#delcache").click(function(){
		$ajaxurl = $(this).attr('href');
		$.get($ajaxurl,null,function(data){
			$("#cache").show();
			$("#cache").html(' <font color=#ff0000>'+data+'</font>');
			window.setTimeout(function(){
				$("#cache").hide();
			},2000);
		});
		return false;
	});
	$("#cache").click(function(){
		$("#cache").hide();
		return false;
	});
});

function left(url){
	$("#leftfra").attr("src",url);
	//leftfra.show(url);
}

function ConClass(id){
	var i;
    var str=$('#d'+id).text()+' >';
	for(i=1;i<=9;i++){
		if (id==i) {
		$('#d'+i).addClass('thisclass');
		}else{
		$('#d'+i).removeClass('thisclass');	
		}
	}
	$('#current').html(str);
    //alert($('#d'+i));
}
</script>

</head>
<body  scroll='no'  >


<div class="topnav">
  <div class="sitenav">
    <div class=welcome>您好：<span class="username">admin</span>，欢迎使用“我买书”电子商务平台</div>
    <div class=sitelink><a href="javascript:Mapshow();">功能地图</a> |<a href="" target="_parent">后台首页</a> | <a href="../index.do" target="_blank">网站主页</a> | <a id="cache"></a></div>
  </div>
  <div class="leftnav">
    <ul>
      <li class="navleft"></li>
      <li id="d1" style="margin-left: -1px" class="thisclass"  onClick="ConClass(1);"><a href="config.do" target="main" onClick="left('left.do?action=setting');">系统设置</a></li>
      <li id="d2" onClick="ConClass(2);"><a href="categoryList.do" target="main" onClick="left('left.do?action=content');">商品管理</a></li>
      <li id="d3" onClick="ConClass(3);"><a href="orderList.do" target="main" onClick="left('left.do?action=order');">订单管理</a></li>
      <li id="d4" onClick="ConClass(4);"><a href="welcome.jsp" target="main" onClick="left('left.do?action=article');">文章管理</a></li>
      <li id="d5" onClick="ConClass(5);"><a href="userList.do" target="main" onClick="left('left.do?action=user');">用户管理</a></li>
      <li id="d6" onClick="ConClass(6);"><a href="welcome.jsp" target="main" onClick="left('left.do?action=admin');">权限管理</a></li>
      <li id="d7" onClick="ConClass(7);"><a href="welcome.jsp" target="main" onClick="left('left.do?action=tool');">扩展工具</a></li>
      <li id="d8" style="margin-right: -1px"><a href="?s=admin/login/logout" target="_parent">注销登录</a></li>
      <li class="navright"></li>
    </ul>
  </div>
</div>



<div id="Maincontent" style="margin: auto;">
  <div id="leftMenu">
  <iframe src="left.jsp?action=setting" id="leftfra" name="leftfra" frameborder="0" scrolling="no"  style="border:none" width="100%" height="100%" ></iframe>
  </div>
  
  
  <div id="mainNav">
  <div class="cur_position"><div class="cur">当前位置：<span id='current'></span></div></div>

  <div class="mframe" style="position:relative; overflow:hidden">
     <iframe name="main" id="main" src="welcome.jsp" frameborder="false" scrolling="auto" style="border:none; margin-bottom:10px;"  width="100%" height="auto" ></iframe>
  </div>

 </div>
</div>
<script type="text/javascript"> 
//clientHeight-0; 空白值 iframe自适应高度
function windowW(){
	if($(window).width()<980){
			$('#Maincontent').css('width',980+'px');
            $('.topnav').css('width',980+'px');
			$('body').attr('scroll','');
			$('body').css('overflow','');
	}
}
windowW();
$(window).resize(function(){
	if($(window).width()<980){
		windowW();
	}else{
        $('.topnav').css('width','');
		$('#Maincontent').css('width',100+'%');
		$('body').attr('scroll','no');
		$('body').css('overflow','hidden');

	}
});
window.onresize = function(){
	var heights = document.documentElement.clientHeight-150;document.getElementById('main').height = heights;
	var openClose = $("#main").height()+39;
}
window.onresize();
</script>

</body>

</html>
