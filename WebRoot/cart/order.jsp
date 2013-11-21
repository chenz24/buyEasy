<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单</title>
<link rel="stylesheet" href="../images/cart.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/artDialog.js"></script>
<script src="../js/iframeTools.js"></script>
<link href="../js/skins/blue.css" type="text/css" rel="stylesheet" />
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
		"../user/isLogin.do",
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				$("#login_info p").html("您好，" + data.username +"，欢迎光临！<a href='user/logOut.do'>注销</a>");
			}
		}
	);

	//地址编辑
	$("#new-addr").click(function(){
		art.dialog.load('address.jsp',{title: '增加新地址',zIndex : 9999,lock:true,id:'addrDialog'});
	})
	
});
//改变搜索栏目
function changeCid(cid,name){
	$("#curcat").text(name);
	$("#catid").val(cid);
	$("#cat_list").hide();
}
//表单验证
function verify(){
	if ($(":radio:checked").length == 0){
			alert("还没有选择地址");
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp" flush="true" />

<div class="wrap">
    <div class="cart-title"><span class="title">购物车</span></div>
    <div class="step">
      <ul class="progress">
          <li class="step1 next">1.我的购物车<em></em></li>
          <li class="doing">2.确认订单信息<em></em></li>
          <li class="next">3.成功提交订单</li>
      </ul>
    </div>
    <div class="order-box">
    <form action="orderAdd.do" method="post">
    <input type="hidden" value="${sumAll}" name="order.total_price" />
    	<div class="grey-box">
        	<div class="grey-title"><span>收货人地址</span></div>
            <div class="grey-list">
            	<ul>
                	<s:iterator value="addrs" status="state">
                	<li><input type="radio" name="addrJson" id="addr-${aid}" value='{"receive_name":"${consignee}","full_address":"${address}","zipcode":"${zipcode}","tel":"${tel}","mobile":"${mobile}"}'/>${consignee}，山东，济南市，历下区，${address}，${zipcode} ，${mobile}，  <a href="#">修改</a></li>
                    </s:iterator>
                    <li><input type="radio" name="addrJson" id="new-addr"/>使用新地址</li>
                </ul>
            </div>
        </div>
        <div class="white-box">
        	<div class="white-title"><span>送货方式</span></div>
            <div class="t-head"><span class="ship-type">送货方式</span><span class="ship-fee">运费</span></div>
            <div class="t-body">
            	<ul>
                	<li>
                    	<div class="t-title"><input type="radio" name="ship" />送货上门</div>
                    	<div class="t-fee">5元</div>
                    </li>
                	<li>
                    	<div class="t-title"><input type="radio" name="ship" />大陆地区邮政EMS</div>
                    	<div class="t-fee">购物总额（定价之和）＜50元，收取20元；　购物总额（定价之和）＞＝50元＜200元，收取60%；</div>
                    </li>
                </ul>
            </div>
        </div>
        <!--付款方式-->
        <div class="grey-box">
        	<div class="grey-title"><span>付款方式</span></div>
            <div class="grey-list">
            	<ul>
                	<li><input type="radio" name="pay" id=""/><strong>网上支付</strong>请您在下单后3个工作日内完成网上支付，所购商品将在款项到达博库网账户后发出。</li>
                	<li><input type="radio" name="pay" id=""/><strong>货到付款</strong>不支持书券<a href="#">修改</a></li>
                    <li><input type="radio" name="pay" id=""/><strong>银行汇款</strong>您需要先去银行转帐，所购商品将在款项到达博库网帐户后发出，到款时间一般为1-5个工作日。</li>
                </ul>
            </div>
        </div>
        <!--货物列表-->
        <div class="cart-table">
    	<table>
        	<tr class="thead"><th></th><th>商品名</th><th>类型</th><th>市场价</th><th>数量</th><th>折扣</th><th>优惠价</th><th>节省</th></tr>
<s:iterator value="list" status="state">
            <tr class="tbody <s:if test="!isbuy" >deleted</s:if>" id="td-${book.gid}">
                <td class="id"><s:property value="#state.getIndex()+1" /></td>
                <td class="title"><a href="id=?${book.gid}">${book.title}</a></td>
                <td class="type">现货</td><td class="price">￥${book.price}</td>
                <td class="amount">${number}</td>
                <td class="discount">${book.discount}</td>
                <td class="pay">${book.price*book.discount/100}</td>
                <td class="manage"> <fmt:formatNumber value="${(1-book.discount/100)*book.price}" pattern="0.00"/></td>
             </tr>
</s:iterator>            
        </table>
        <div class="cart-bottom"><span>共<b><s:property value="list.size" /></b>件商品，总计<em id="sum">￥${sumAll}</em>元</span></div>
        <div class="cart-submit">
            <input type="submit" class="gotocount" value="" onclick="verify();"/>
        </div>
    </div>
    </form>    
    </div>
</div>

<!--footer-->
<%@include file="../main/footer.jsp" %>
</body>
</html>
