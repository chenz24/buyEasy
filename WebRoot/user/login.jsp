<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<link rel="stylesheet" href="../images/user.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script language="javascript">
	$(function(){
		$("input:[type='submit']").hover(function(){
			$(this).addClass("submit-hover");
			},function(){
				$(this).removeClass("submit-hover")
				});
				
		$("#docagreeid").click(function(){
			if($(this).attr("checked")!=true){
					$("#submitid").css({'opacity':'0.5'}).attr("disabled","disabled").css("cursor","crosshair");
				}
				if($(this).attr("checked")==true){
					$("#submitid").css({'opacity':'1'}).attr("disabled","").css("cursor","pointer");
					}
			})
	})
</script>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="logo"><a href="#">我买书网</a></div>
        <div class="rindex"><a href="/index.do">返回首页</a></div>
    </div>
    <!--rloginpannel-->
    <div class="login-pannel">
    	<div class="login-ad">
        	<a href="#"><img src="../images/loginad.jpg" /></a>
        </div>
        <div class="login-box">
        	<div class="box-title"><span>用户登录</span></div>
            <form action="checkLogin.do" method="post">
            <ul>
            	<li><label class="lable-t">邮 箱：</label><input type="text" class="cominput" name="email"/></li>
            	<li><label class="lable-t">密 码：</label><input type="password"  class="cominput" name="password"/></li>
            </ul>
            <div class="login-submit">
            	<input type="submit" class="login-btn" /><a href="#">找回登录密码</a>
            </div>
            </form>
            <div class="regnew">还不是本站用户，点击注册</div>
            <div class="toreg"><a href="reg.do">马上注册新用户</a></div>
        </div>
    </div>
    
    <div class="simple-footer">
    	<div class="copyright">我买书网版权所有 2012-2013</div>
    </div>
</div>
</body>
</html>
