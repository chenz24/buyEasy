<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="images/style.css" type="text/css" rel="stylesheet" />
<title>${category.catName}</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/artDialog.js"></script>
<link href="js/skins/blue.css" type="text/css" rel="stylesheet" />
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
	//分类显示
	$("#all-cat").hover(
		function(){
			$("#all-sort").show();
		},function(){
			$("#all-sort").hide();
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
	//列表各行变色
	$(".books-list").hover(
		function(){
			$(this).addClass("hoverbg");
		},
		function(){
			$(this).removeClass("hoverbg");
		}
	);
	//ajax验证登陆
	$.post(
		"user/isLogin.do",
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				$("#login_info p").html("您好，" + data.username +"，欢迎光临！<a href='user/logOut.do'>注销</a>");
			}
		}
	)
	
});
//ajax提交
function buy(id){
	$.post(
	"cart/cart!add.do",
	{id:id},
	function(data){
		//alert(data.ok);
		//var obj = eval('(' + data + ')');//jquery版本原因，无需eval
		if(data.ok){
			art.dialog({
				width: 200,
				height: 40,
				time: 2,
				padding: 0,
				title: '提示信息', 
				content: '已经购买过，请到购物车修改数量'
			});	
		}else{
			art.dialog({
				width: 200,
				height: 40,
				time: 2,
				padding: 0,
				title: '提示信息', 
				content: '购买成功'
			});	
		}
	}
	)
}
//改变搜索栏目
function changeCid(cid,name){
	$("#curcat").text(name);
	$("#catid").val(cid);
	$("#cat_list").hide();
}

</script>

<style type="text/css">
.main{margin-top:20px;}
.main_left{width:760px;}
.main_right{width:190px;}
</style>
</head>

<body>
<jsp:include page="header.jsp" flush="true" />
<!--推荐区-->

<!--各分类列表-->
<div class="wrap">
    <div class="main">
    	<!--左边-->
        <div class="main_left">
        	<div class="position">
            	<a href="index.do" title="首页">首页</a>${position}
            </div>
            <div class="subcatagorys">
			        <b>分类：</b> 
                    <ul>
                    <s:iterator value="siblings" status="state">
                    	<li><a title="${catName}" href="list.do?catid=${cid}">${catName}</a> (${count})</li>
                    </s:iterator>
                    </ul> 
                    <span class="bottom_line"></span>
            </div>
            <!--上下分页-->
            <div class="pagebar">
            	${simplePage}
            </div>
            <!--筛选-->
            <div class="filter">
            	<div class="l1">
                    <div class="for-price">
                                    <form href="search.do" name="listform" method="get" onsubmit="return checkprice();">
                                    <p id="s-for-price" class="s-abs">
                                            价格： <input id="pricemin" class="inp" type="text" value="${query.price1}" name="query.price1"> - <input id="pricemax" class="inp" type="text" value="${query.price2}" name="query.price2"><br>
                                        <span style="width:136px; display:none; margin-top:5px;"><input type="submit" value="" class="s-keybtn rr"></span>
                                    </p>
                                  
                    </div>
                    <div class="for-price">
                              
                                <p id="s-for-jg" class="s-abs">
                                    折扣：<input type="text" id="rebatemin" value="${query.discount1}" name="query.discount1" class="inp"> - <input type="text" id="rebatemax" value="${query.discount2}" name="query.discount2" class="inp"><br>
                                    <span style="width:130px; display:none; margin-top:5px;"><input type="submit" value="" class="s-keybtn rr"></span>
                                </p>
                                
                    </div>
                    <div class="s-for-keyword">
                                    关键词：<input type="text" value="${query.title}" id="keyname" name="query.title" class="s-keyword">
                                    <input type="submit" value="" class="s-keybtn">
                                </form>
                    </div>
                </div>
                <div class="rr num">
                                                <a href="#" class="on">20</a>
                                                <a href="#">40</a>
                                                <a href="#">80</a>
                </div>
            </div>
            <!--condition filter-->
            <div class="condition-filter">
                <ul>
                    <li><a href="#" title="点击按销量从高到低排序">销量</a></li>
                    <li class="price"><a href="#" title="点击按价格从低到高排序">价格</a></li>
                    <li><a href="#" title="点击按上架时间降序">最新上架</a></li>
                </ul>
                <div class="check-filter">
                    <span>筛选:</span>
                    <input type="checkbox" class="checkbox" href="#" name="cuxiao" id="cuxiao">
                        <label for="cuxiao">促销</label>
                        <input type="checkbox" class="checkbox" href="#" name="xianhuo" id="xianhuo">
                            <label for="xianhuo">只显示现货</label>
                </div>
                <div class="thumb-mode rr"><a title="切换到大图" href="#"><i class="list-icon"></i>切换到大图</a></div>
                                                            <!--<div class="thumb-list rr"><a title="切换到列表" href="#"><i class="list-icon"></i>切换到列表</a></div>-->
            </div>
            <!--/condition filter-->
            <!--booklist-->
            <div class="list">
				<!--booklist-->
<s:iterator value="books" status="state">                
                <div class="books-list">
                    <h3 class="summary"><a href="detail.do?id=${gid}" target="_blank" class="l">${title}</a> &nbsp;</h3>
                    <div class="photo"><a href="detail.do?id=${gid}" target="_blank"><img src="${thumb}" width="150" height="150" alt="${title}" ></a></div>
                    <ul class="books-info">
                        <li>作者：<a href="search.do?query.author=<s:property value="author" />" target="_blank">${author}</a></li>
                        <li></li>
                        <li>出版社：<a target="_blank" href="search.do?query.publisher=${publisher}">${publisher}</a></li>
                        <li>出版时间：<s:property value="publish_time" /></li>
                    </ul>
                    <p class="mt5 text2">
                        ${description}
                    </p>
                                                                
                    <div class="attribute">
                        <p class="ll">
                            <b>￥${price*discount/100}</b>
                            <del>￥${price}</del>
                            <i>${discount}折</i>
                        </p>
                    <div class="buy rr">
                         <a href="javascript:void(0);" class="getCart buy-but" title="点击购买" onclick="buy(${gid})"></a>
                         <a href="javascript:void(0);" class="collect-but getMark">收藏</a>
                    </div>
                   </div>
                </div>
</s:iterator>                                
                <!--booklist-->
            </div>
            <!--/list-->
            <!--分页列表-->
            <div class="page">
            	<ul>
                    <li class="page-mun"><s:property value="pager" escape="false"/></li>
                 </ul>
            </div>
            <!--/分页列表-->
        </div>
        <!--右边-->
        <div class="main_right">
        	<!--排行1-->
            <div class="side_box hot_list">
            	<div class="box_title"><h4>热门商品</h4></div>
                <ul>
                <s:iterator value="recommends" status="state"> 
                	<li>
                        <p class="pic"><a href="detail.do?id=${gid}"><img alt="${title}" src="${thumb}"></a></p>
                        <p><a title="${title}" target="_blank" href="detail.do?id=${gid}">${title}</a></p>
                        <p class="price"><b>￥${price*discount/100}</b> <i>${discount}折</i></p>
                    </li>
                </s:iterator>
                </ul>
            </div>    
            <!--排行2-->
            
            <!--排行3-->
        </div>    
    </div>
</div>

<!--footer-->
<%@include file="footer.jsp" %>
</body>
</html>
