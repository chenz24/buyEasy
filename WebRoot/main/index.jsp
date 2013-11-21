<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="images/style.css" type="text/css" rel="stylesheet" />
<title>首页</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
$(function(){
	$("#submit").hover(function(){
			$(this).addClass("hoversub");
		},function(){
			$(this).removeClass("hoversub");
		});	
	
	$("#select_cat").hover(
		function(){
			$("#cat_list").show();
			$("#curcat").addClass("current_cat_hover");
			},function(){
				$("#cat_list").hide();
				$("#curcat").removeClass("current_cat_hover");
				}	
	);
	//左侧弹出分类
	$(".sort_list li").hover(
		function(){
			$(this).addClass("hoverli");
			$(this).children(".allsort-popup").show();
		},
		function(){
			$(this).removeClass("hoverli");
			$(this).children(".allsort-popup").hide();
		}
	);
	//隔行变色
	$(".subsort_list dl").hover(
		function(){
			$(this).addClass("dlhover");
		},
		function(){
			$(this).removeClass("dlhover");
		}
	);
	$(".rank1 li:eq(0)").hide();
	$(".rank1 li:eq(1)").show();
	//ajax验证登陆
	$.post(
		"user/isLogin.do",
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				$("#login_info p").html("您好，" + data.username +"，欢迎光临！<a href='user/logOut.do'>注销</a>");
			}
		}
	);

});
function showpic(ind){
	$("#" + ind + " li.text").mouseover(function(){
		$("#" + ind + " li.text").show();
		$("#" + ind + " li.pic").hide();
		$(this).hide();
		$(this).next().show();
		});

}
function changeCid(cid,name){
	$("#curcat").text(name);
	$("#catid").val(cid);
	$("#cat_list").hide();
}
</script>
<style type="text/css">
.all_cat .all_sort{display:block}
</style>
</head>

<body>
<jsp:include page="header.jsp" flush="true" />

<!--推荐区-->
<div class="wrap">
    <div class="hotscreen">
        <div class="hot_l">
            <div class="focus">
                <!--focus pic-->
<script language='javascript'>
linkarr = new Array();
picarr = new Array();
textarr = new Array();
var swf_width=530;
var swf_height=170;
var files = "";
var links = "";
var texts = "";
//这里设置调用标记
picarr[1]  = "images/focus/1.jpg";
textarr[1] = "幻灯1";
picarr[2]  = "images/focus/2.jpg";
textarr[2] = "幻灯2";
picarr[3]  = "images/focus/3.jpg";
textarr[3] = "幻灯3";
picarr[4]  = "images/focus/4.jpg";
textarr[4] = "幻灯4";
picarr[5]  = "images/focus/5.jpg";
textarr[5] = "幻灯5";

for(i=1;i<picarr.length;i++){
  if(files=="") files = picarr[i];
  else files += "|"+picarr[i];
}
for(i=1;i<linkarr.length;i++){
  if(links=="") links = linkarr[i];
  else links += "|"+linkarr[i];
}
//for(i=1;i<textarr.length;i++){
//  if(texts=="") texts = textarr[i];
//  else texts += "|"+textarr[i];
//}
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="images/bcastr3.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
document.write('<embed src="images/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); document.write('</object>');
</script>	
                <!--/focus-->
            </div>

            <div class="recommend">
                <div class="rectitle">特别推荐</div>
                <div class="c_list">
                <ul>
                <s:iterator value="special" status="state">
                	<li>
                            <p><a href="detail.do?id=${gid}" target="_blank" title="${title}"><img src="${thumb}" /></a></p>
                            <p class="text"><a href="detail.do?id=${gid}" target="_blank" title="${title}">${title}</a></p>
                            <p><span class="ins"><em>￥${price * discount / 100}</em></span><del>${price}</del></p>
                    </li>
                </s:iterator>    
                </ul>
                </div>
            </div>
        </div>
        <div class="hot_r">
            <div class="newsboard">
                <div class="btitle"><span>公告</span></div>
                <ul>
                	<li><a href="#">本站上线测试！！</a></li>
                	<li><a href="#">本站上线测试！！</a></li>
                	<li><a href="#">本站上线测试！！</a></li>
                	<li><a href="#">本站上线测试！！</a></li>
                </ul>
            </div> 
            <div class="ad1">
            	<img src="images/ad.jpg" width="200" height="170"/>
            </div>       
        </div>
    </div>    
</div>
<!--各分类列表-->
<div class="wrap">
    <div class="main">
    	<!--左边-->
        <div class="main_left">
        
        <!--列表一-->
<s:iterator value="topCatgories" status="state" var="t">         
            <div class="c_box">
                <div class="c_title">
                    <span>${t.catName}</span>
                </div>
                <div class="c_catgory">
                   <s:iterator value="soncats[#t.cid]" var="s"><a href="list.do?catid=${s.cid}">${s.catName}</a> | </s:iterator>
                </div>
                <div class="c_list">
                    <ul>
<s:iterator value="books[#t.cid]" var="b">
                        <li>
                            <p><a href="detail.do?id=${b.gid}" target="_blank" title="${b.title}"><img src="${b.thumb}" /></a></p>
                            <p class="text"><a href="detail.do?id=${b.gid}" target="_blank" title="${b.title}">${b.title}</a></p>
                            <p><span class="ins"><em>￥${b.price * b.discount / 100}</em></span><del>${b.price}</del></p>
                        </li>
</s:iterator>
                    </ul>
                </div>
            </div>
</s:iterator>          
        <!--列表二-->
        	
        <!--列表3-->
        </div>
        <!--右边-->
        <div class="main_right">
        	<!--排行1-->
<s:iterator value="topCatgories" var="t" status="state">              
            <div class="right_box">
                <div class="box_title"><span>${t.catName}排行</span></div>
                <div class="rank_list box_content">
                    <ul class="rank1" id="ind${state.index}" onmouseover="showpic('ind${state.index}');">
<s:iterator value="recommend[#t.cid]" var="r" status="rstate">  
<s:if test="#rstate.index==0" >                
                        <li class="text" style="display:none"><em class="rank_num">${rstate.index + 1}</em><a href="detail.do?id=${r.gid}">${r.title}</a></li>
                        <li class="pic" style="display:block">
                        <a href="detail.do?id=${r.gid}"><img src="${r.thumb}"  width="100" height="60"/></a>
                        <a href="detail.do?id=${r.gid}" class="rank_title">${r.title}</a>
                        </li>                      
</s:if>
<s:else>
                        <li class="text"><em class="rank_num">${rstate.index + 1}</em><a href="detail.do?id=${r.gid}">${r.title}</a></li>
                        <li class="pic">
                        <a href="detail.do?id=${r.gid}"><img src="${r.thumb}"  width="100" height="60"/></a>
                        <a href="detail.do?id=${r.gid}" class="rank_title">${r.title}</a>
                        </li>                      
</s:else>                        
</s:iterator>                        
                    </ul>
                </div>
            </div>  
</s:iterator>              
            <!--排行2-->            
            <!--排行3-->
        </div>    
    </div>
</div>

<!--footer-->
<%@ include file="footer.jsp" %>
</body>
</html>
