<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>邮件确认</title>
<link rel="stylesheet" href="../images/user.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script language="javascript">
	$(function(){
		$("input:[type='submit']").hover(function(){
			$(this).addClass("submit-hover");
			},function(){
				$(this).removeClass("submit-hover")
				});
				
		//ajax验证邮件验证码
		$("#emailCode").blur(function(){
			var emailcode = $(this).val();
			var uid = $("#uid").val();
			if(emailcode==""){
				$("#ckEmailCode").html("请填写邮箱验证码！").addClass("error-pop").show();
			}else{
				$("#ckEmailCode").html("正在检测！").addClass("error-pop").show();	
				$.ajax({
					url:"verifyEmailCode.do",
					async:true,
					data:{"uid":uid,"emailcode":emailcode},
					success:function(data){
						//var obj = eval('(' + data + ')');
						if(data.ok == true){
							$("#ckEmailCode").html("填写正确！").removeClass("error-pop")
						}else{
							$("#ckEmailCode").html("填写错误，请检查！").addClass("error-pop")
						}
					}
				})
			}
		});
	})
</script>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="logo"><a href="/index.do">我买书网</a></div>
        <div class="rindex"><a href="/">返回首页</a></div>
    </div>
    <!--registerpannel-->
    <div class="register-pannel">
    	<div class="reg-title"><span class="title">用户注册</span><span class="fr">已有账号，返回<a href="/user/login.do">登录</a></span></div>
        <ul class="progress">
            <li class="step1 next">1.填写注册信息<em></em></li>
            <li class="step2 doing">2.验证邮箱<em></em></li>
            <li class="step3 next">3.注册成功</li>
        </ul>
        <div class="input-pannel">
        	<div class="infotitle"><span>感谢您的注册！现在请按以下步骤完成您的注册!</span></div>
            <form action="regOk.do" method="post">
            <div class="info">
            <dl>
            	<dt>第一步：查看您的电子邮箱</dt>
                <dd>我们给您发送了验证邮件，邮件地址为： [<s:property value="user.email" />]
<b><s:property value="user.username"/></b>，请登录您的邮箱收信。
				<br />${user.email_verify_code}
                </dd>
				<dt>第二步：输入邮箱验证码</dt>
                
                <dd style="position:relative">
                	<label class="lable-t" style="width:170px;margin-right:15px;">输入您收到邮件中的验证码</label>
                    <input type="text" name="emailCode" id="emailCode" class="cominput" value="" style="width:180px;margin-right:15px;">
                	<div class="pop-tip" id="ckEmailCode" style="top:0;right:20px;width:155px;margin-left:20px;"></div>
                </dd>
            </dl>
            </div>
            	<input type="hidden" value="<s:property value='user.uid' />" name="uid" id="uid"/>
                 <input type="submit" id="submitid" class="cos-submit" value="" style="text-align:left; margin-top:10px; margin-left:240px;margin-bottom:30px;">
            </form>
        </div>
        
    </div>
    
    <div class="simple-footer">
    	<div class="copyright">我买书版权所有 2012-2013</div>
    </div>
</div>
</body>
</html>
