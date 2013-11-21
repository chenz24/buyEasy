<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>恭喜您，注册成功！</title>
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
        <div class="logo"><a href="/">我买书网</a></div>
        <div class="rindex"><a href="/index.do">返回首页</a></div>
    </div>
    <!--registerpannel-->
    <div class="register-pannel">
    	<div class="reg-title"><span class="title">用户注册</span><span class="fr">已有账号，返回<a href="/user/login.do">登录</a></span></div>
        <ul class="progress">
            <li class="next">1.填写注册信息<em></em></li>
            <li class="step1 next">2.验证邮箱<em></em></li>
            <li class="step3 doing">3.注册成功</li>
        </ul>
        <div class="input-pannel">
        	<div class="infotitle success"><span>恭喜您，注册成功!</span></div>
            <div class="info"><p style="text-align:center">您今后可使用<b><s:property value="user.username"/></b>登录我买书网。</p></div>
            <div style="clear:both;float:left;width:100%;text-align:center;padding-top:15px;margin-top:30px;margin-bottom:80px">
                    	<a href="login.do" target="_blank" class="goto-reg">立即去购物</a>
           	</div>
        </div>
        
    </div>
    
    <div class="simple-footer">
    	<div class="copyright">我买书网版权所有 2012-2013</div>
    </div>
</div>
</body>
</html>
