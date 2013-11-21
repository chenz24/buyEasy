<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>address</title>
<link rel="stylesheet" href="../images/user.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script language="javascript" type="text/dialog">
	$(function(){
		$(".addrbtn").click(function(){
			var consignee = $("#consignee").val();
			var address = $("#address").val();
			var zipcode = $("#zipcode").val();
			var mobile = $("#mobile").val();
			var tel = $("#tel").val();
			$.ajax({
				url:"../user/address!ajaxAdd.do",
				data:{"address.consignee":consignee,"address.address":address,"address.zipcode":zipcode,"address:mobile":mobile,"address.tel":tel},
				success:function(data){
					if(data.ok){
						art.dialog({id: 'addrDialog'}).title('提交成功').content('添加成功！').time(2).size(200,45);
						var win=art.dialog.open.origin;
						win.location.reload();
					}else{
						alert("提交失败");		
					}
				}
					
			});
			
		});
	})
</script>
<style>
.address-box{float:left;width:550px;height:auto}
.address-box input{width:150px;}
.add-submit{float:left;width:100%;}
.address-box .addrbtn {
	width: 106px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border: 0;
	color: white;
	font-weight: bold;
	background: url(../images/addaddrea_btn.gif) no-repeat 0 0;
	cursor: pointer;
}
.input-pannel{width:450px;}
</style>
</head>
<body>
<div class="address-box">
	<div class="input-pannel">
    	<form>
        <ul>
        	<li><label class="lable-t">收货的人：</label><input type="text" name="address.consignee" id="consignee" class="cominput" value=""></li>
        	<li><label class="lable-t">地区：</label><input type="text" name="address.province" id="province" class="cominput" value=""></li>
        	<li><label class="lable-t">收货地址：</label><input type="text" name="address.address" id="address" class="cominput" value="" style="width:260px;"></li>
        	<li><label class="lable-t">邮编：</label><input type="text" name="address.zipcode" id="zipcode" class="cominput" value=""></li>
        	<li><label class="lable-t">手机：</label><input type="text" name="address.mobile" id="mobile" class="cominput" value=""></li>
        	<li><label class="lable-t">电话：</label><input type="text" name="address.tel" id="tel" class="cominput" value=""></li>
        </ul>
        <div class="add-submit"><input type="button" value="增加新地址" class="addrbtn" /></div>
        </form>
    </div>
</div>
</body>
</html>
