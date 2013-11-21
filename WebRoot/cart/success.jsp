<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单</title>
<link rel="stylesheet" href="../images/cart.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
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
	//ajax提交
	
});
//改变搜索栏目
function changeCid(cid,name){
	$("#curcat").text(name);
	$("#catid").val(cid);
	$("#cat_list").hide();
}

</script>
</head>
<body>
<jsp:include page="../main/header.jsp" flush="true" />

<div class="wrap">
    <div class="cart-title"><span class="title">购物车</span></div>
    <div class="step">
      <ul class="progress">
          <li class="next">1.我的购物车<em></em></li>
          <li class="step1 next">2.确认订单信息<em></em></li>
          <li class="step3 doing">3.成功提交订单</li>
      </ul>
    </div>
    <div class="order-box">
    	<div class="order-success">
        	<span class="sucpic"></span>
            <span class="sucinfo">订单：<em>E5103272</em>已提交 ，您需要支付<em>￥${sumAll}</em>元！</span>
        </div>
        <div class="pay-box">
        	<div class="alipay">
            	<div class="paybtn"><a href="#"><img src="../images/zfb_icon.png" /></a></div>
                <div class="banks"><img src="../images/banks.png" /></div>
            </div>
            <div class="fastpay">
            	<div class="paybtn"><a href="#"><img src="../images/kq.gif" /></a></div>
                <div class="banks"><img src="../images/banks.png" /></div>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<%@include file="../main/footer.jsp" %>
</body>
</html>
