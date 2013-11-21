<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" href="../images/cart.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/artDialog.js"></script>
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
	$(".tbody").hover(
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

	//已经删除的商品半透明	
	$(".deleted").css({'opacity':'0.3'});
	$(".deleted .manage").children().eq(0).hide();
	$(".deleted .manage").children().eq(1).show();
});
//ajax删除
function del(id){
	$.post(
		"cart/cart!del.do",
		{id:id},
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				$("#td-" + id).css({'opacity':'0.3'});
				$("#del-" + id).hide();
				$("#rec-" + id).show();
				$("#sum").html("￥" + data.sumAll);	
			}else{
				alert("删除失败");
			}
		}
	)	
}
//ajax恢复
function recover(id){
	$.post(
		"cart/cart!recover.do",
		{id:id},
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				$("#td-" + id).css({'opacity':'1'});
				$("#del-" + id).show();
				$("#rec-" + id).hide();
				$("#sum").html("￥" + data.sumAll);
			}else{
				alert("恢复错误");	
			}	
		}
	)	
}
//变更数量
function change(id){
	var num = $("#amt-" + id).val();
	$.post(
		"cart/cart!modify.do",
		{id:id,num:num},
		function(data){
			//var obj = eval('(' + data + ')');
			if(data.ok){
				art.dialog({
				width: 120,
				height: 30,
				time: 2,
				padding: 0,
				title: '提示信息', 
				content: '数量更改成功'
				});	
				$("#sum").html("￥" + data.sumAll);
			}else{
				alert("变更失败");
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
</head>
<body>

<jsp:include page="../main/header.jsp" flush="true" />

<div class="wrap">
    <div class="cart-title"><span class="title">购物车</span></div>
    <div class="step">
      <ul class="progress">
          <li class="doing">1.我的购物车<em></em></li>
          <li class="next">2.确认订单信息<em></em></li>
          <li class="next">3.成功提交订单</li>
      </ul>
    </div>
    <div class="cart-table">
    <form>
    	<table>
        	<tr class="thead"><th></th><th>商品名</th><th>类型</th><th>市场价</th><th>数量</th><th>折扣</th><th>优惠价</th><th>操作</th></tr>
<s:iterator value="list" status="state">
            <tr class="tbody <s:if test="!isbuy" >deleted</s:if>" id="td-${book.gid}">
                <td class="id"><s:property value="#state.getIndex()+1" /></td>
                <td class="title"><a href="id=?${book.gid}">${book.title}</a></td>
                <td class="type">现货</td><td class="price">￥${book.price}</td>
                <td class="amount"><input type="text" value="${number}" name="amount-${book.gid}" onchange="change(${book.gid})" id="amt-${book.gid}"/></td>
                <td class="discount">${book.discount}</td>
                <td class="pay">${book.price*book.discount/100}</td>
                <td class="manage">
                    <a href="javascript:void(0);" onclick="del(${book.gid})" id="del-${book.gid}">删除</a>
                    <a href="javascript:void(0);" onclick="recover(${book.gid})" style="display:none;" id="rec-${book.gid}">恢复</a>
                </td>
             </tr>
</s:iterator>            
        </table>
   </form>     
        <div class="cart-bottom"><span>共<b><s:property value="list.size" /></b>件商品，总计<em id="sum">￥${sumAll}</em>元</span></div>
        <div class="cart-submit">
            <a href="#" class="gotoshoping" title="继续购物"></a>
            <a href="order.do" class="gotocount" title="去结算"></a>
        </div>
    </div>
</div>

<!--footer-->
<%@include file="../main/footer.jsp" %>


</body>
</html>
