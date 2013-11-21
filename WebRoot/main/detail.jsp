<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="images/style.css" type="text/css" rel="stylesheet" />
<title>${book.title}</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.tools.min.js"></script>
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
	//滑动门	
	$("ul.tablist").tabs("#tab_content > div");
	//buyarea变色
	$(".buy-area").hover(
		function(){
			$(this).addClass("buyhover");
			},
		function(){
			$(this).removeClass("buyhover");
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
	);
	feedback(1);//载入留言
});

//ajax提交
function buy(id){
	$.post(
	"cart/cart!add.do",
	{id:id},
	function(data){
		//var obj = eval('(' + data + ')');
		if(data.ok){
			art.dialog({
				width: 200,
				height: 40,
				time: 2,
				padding: 0,
				zIndex:999,
				title: '提示信息', 
				content: '已经购买过，请到购物车修改数量'
			});	
		}else{
			art.dialog({
				width: 200,
				height: 40,
				time: 2,
				padding: 0,
				zIndex:999,
				title: '提示信息', 
				content: '购买成功'
			});	
		}
	}
	)
}
//ajax评论
function feedbackPost(){
	var subject = $("#subject").val();
	var content = $("#content").val();
	var gid = ${book.gid};
	if(subject=='' || content==''){
		alert('标题或内容不能为空');
		return false;
	}
	$.post(
		"feedback!ajaxAdd.do",
		{subject:subject,content:content,gid:gid},
		function(data){
			//var obj = eval('(' + data + ')');	
			alert(data.ok);
			if(data.ok==1){
				alert('发布成功');
				feedback(0);	
			}else if(data.ok==2){
				alert('请先登录！');	
			}else{
				alert('系统出现错误');	
			}
		}
	)
}
//ajax载入评论
function feedback(page){
	var gid = ${book.gid};
	$.ajax({
		url:"feedbackAjax.do",
		data:{gid:gid,p:page},
		beforeSend:function(){
			$("#comment").html("<div class='loading'><img src='images/loading.gif' /></div>");	
		},
		success:function(data,status){
			if(status!="success"){
				alert('载入失败');	
			}else{
				$("#comment").html(data);	
			}
		}
	});	
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
.main_left{width:205px;margin-left:5px;}
.main_right{width:740px;}
</style>
</head>

<body>

<jsp:include page="header.jsp" flush="true" />
<!--推荐区-->

<!--各分类列表-->
<div class="wrap">
    <!--position-->
    <div class="position2">
           <span>您现在的位置：</span> ${position}
    </div>
    <div class="main">
    	<!--左边-->
        <div class="main_left">            
            <!--排行-->
            <div class="side_box rbar">
            	<div class="box_title"><h4>以下商品同时被关注</h4></div>
                <ul class="bestsale-pannel">
                <s:iterator value="recommends" status="state">  
                	<li>
						<div class="bestsale-t  none" style="display: block; "><em>${state.index + 1}、</em><a href="detail.do?id=${gid}" target="_blank">${title}</a><span><ins>￥${price}</ins></span></div>
					</li>
                </s:iterator> 
                    <!--<li>
						<div class="bestsale-t  none" style="display: block; "><em>1、</em><a href="http://detail.bookuu.com/1651364.html" target="_blank">庄子的享受</a><i class="arrow-up"></i></div>
						<div class="show-pic" style="display: none; "><div class="title"><em>1、</em><a href="http://detail.bookuu.com/1651364.html" target="_blank">庄子的享受</a><i class="arrow-up"></i></div>
							<div class="item">
								<div class="pic">
									<a href="http://detail.bookuu.com/1651364.html" target="_blank"><img src="http://images.bookuu.com/book_s/C/00891/97875336541601651364-fm-s.jpg"></a>
								</div>

							</div>
							<div class="desc">
								<div class="pf">定价：<del>￥36</del></div>
								<div class="clear" style="margin:4px 0;">我买价：<ins>￥23.7</ins></div>
								<div class="clear">折扣：66折</div>
							</div>
						</div>
					</li>-->
                    
                </ul>
            </div>
            
        </div>
        <!--右边-->
        <div class="main_right">
        	
            <!--products-detail-info-->
            <div class="products-detail-info">
            <!--title-->
            	<div class="detail-title"><h1>${book.title}</h1></div>
                <div class="item">
                    <div class="pic"><a href="${book.thumb}" class="cloud-zoom" rel="adjustX:12"><img src="${book.thumb}" id="middleimgid" alt="${book.title}"></a>
                    <div class="rticon"></div>
                    </div>
                    <!--<a href="#" rel="showbigpicture" class="fen-big" title="点击放大图片"></a>-->
                </div>
            <!--右-->
                <div class="desc">
                    <ul class="info-li">
                        <li class="hd-line" style="display: none; width: 100%;">
                        <div class="hd-div xsq-p-icon"><em></em><ins></ins>
                        <p id="1813047"></p>
                        </div>
                        </li>
                    
                        <li class="one-line">我买价：<ins id="money_xsj" class="">￥${book.price*book.discount/100}</ins>
                        元</li>
                    
                        <li class="one-line">定 价：<del>￥${book.price}</del> 折扣：<i id="zhekou">${book.discount}折</i><span id="jiesheng" style="color: #999">立即节省：￥
                        <fmt:formatNumber value="${(1-book.discount/100)*book.price}" pattern="0.00"/> 
                        元</span></li>
                        <li>评价： <span id="starin2"> </span> <font color="#248ac1">已有<ins id="commentnums">0</ins>人评价</font></li>
                        <li>库存：<i id="kucun">有货</i></li>
                        <li class="one-line" style="padding: 5px 0;">
                        <hr style="border: 0; border-top: #efefef 1px solid;">
                        </li>
                        <li>作者：<a href="search.do?query.author=${book.author}" target="_blank" title="${book.author}">${book.author}</a></li>
                        <li>出版社：<a href="search.do?query.publisher=${book.publisher}" target="_blank" title="${book.publisher}">${book.publisher}</a></li>
                        <li>ISBN：${book.isbn}</li>
                        <li>开本：${book.book_size}开       页数:${book.pages}页</li>
                        <li>2010-08-01 第1版2010-08-01 第1次印刷</li>
                    </ul>
                    <p class="blank20"></p>
                    <div class="buy-area">
                    <form>
                    <ul class="buy-content">
                        <li>我要买：<input type="text" class="cominput" size="2" value="1" title="购买数量"> 件</li>
                        <li class="f-btn">
                        <a href="javascript:void(0);" id="btn-buy" class="layout-com-btn buton-01" rel="nofollow" onclick="buy(${book.gid})"></a>
                        <a href="javascript:void(0);" id="btn-fav" class="layout-com-btn buton-02" title="加入收藏夹" rel="nofollow"></a> 
                        <span>收藏人气：<ins id="renqi">36</ins></span></li>
                    </ul>
                    </form>
                    <div class="clearfloat"></div>
                    </div>
                </div>
            <!--/右-->
            </div>
            <!--/products-detail-info-->
            <!--content information-->
            <div class="book_info">
            	<div class="tabs">
                	<ul class="tablist">
                    	<li><a href="javascript:void(0);">商品详情</a></li>
                        <li><a href="javascript:void(0);">商品评论</a></li>
                    </ul>
                </div>
                <div class="tab_content" id="tab_content">
                	<div class="detail">
                    	<!--detail-->
                        <dl class="rc_tabcon_dl" id="goodsdetail" style="display: block; ">
                            <dt>编辑推荐语</dt>
                            <dd>
                            <div id="bjtj" style="word-wrap: break-word; word-break: break-all;">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp; ${book.description}</p>
                            </div>
                            </dd>
	
                            <dt>内容提要</dt>
                            <dd>
                            <div id="nrty" style="word-wrap: break-word; word-break: break-all;">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp; ${book.passage} </p>
                            </div>
                            </dd>
	
                            <dt>作者简介</dt>
                            <dd>
                            <div id="zzjj" style="word-wrap: break-word; word-break: break-all;">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;${book.author_intro}</p>
                            </div>
                            </dd>
	
                            <dt>目录</dt>
                            <dd>
                            <div id="ml" style="word-wrap: break-word; word-break: break-all;">
                           	 <pre>${book.catalog}</pre>
                            </div>
                            </dd>
                        </dl>
                        <!--detail-->
                    </div>
                    <div class="comment" id="comment">
                    </div>
                </div>
            </div>
            <!--/information-->
        </div>    
    </div>
</div>

<!--footer-->
<%@include file="footer.jsp" %>
<script language="javascript">
$(function(){
    // remove layerX and layerY
    var all = $.event.props,
        len = all.length,
        res = [];
    while (len--) {
      var el = all[len];
      if (el != 'layerX' && el != 'layerY') res.push(el);
    }
    $.event.props = res;
}());
</script>
</body>
</html>