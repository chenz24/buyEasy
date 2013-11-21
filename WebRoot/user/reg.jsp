<%@page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册新用户</title>
<link rel="stylesheet" href="../images/user.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script language="javascript">
	$(function(){
		flag = false;//定义一个全局变量
		$("input:[type='submit']").hover(function(){
			$(this).addClass("submit-hover");
			},function(){
				$(this).removeClass("submit-hover")
		});
				
		$("#docagreeid").click(function(){
			if($(this).attr("checked")!='checked'){
					$("#submitid").css({'opacity':'0.5'}).attr("disabled","disabled").css("cursor","crosshair");
			}else{
				$("#submitid").css({'opacity':'1'}).removeAttr("disabled").css("cursor","pointer");
			}
		});
		//ajax用户验证
		$("#username").blur(function(){
			var val = $(this).val();
			if(val==""){
				$("#ckname").html("请填写用户名！").addClass("error-pop").show();	
			}else{
				$("#ckname").html("正在检测...").removeClass("error-pop").show();	
				$.ajax({
					url:"checkUser.do",
					async:true,//请求同步处理
					data:{"user":val},
					success:function(data){//data获取的是action返回的json数据
						//var obj = eval('(' + data + ')');
						if(data.ok == true){
							$("#ckname").html("用户名可以使用").removeClass("error-pop");
						}else{
							$("#ckname").html("用户名已被占用").addClass("error-pop");	
						}
					}
				});	
			}						
		});
		//验证码验证
		$("#checkCode").blur(function(){
			var code = $(this).val();
			if(code == ""){
				$("#ckcode").html("请填写验证码！").addClass("error-pop").show();	
			}else{
				$("#ckcode").html("正在检测...").removeClass("error-pop").show();
				$.ajax({
					url:"veriCheckCode.do",	
					async:true,
					data:{"checkCode":code},
					success:function(data){
						//var obj = eval('(' + data + ')');
						if(data.ok == true){
							$("#ckcode").html("填写正确").removeClass("error-pop");
						}else{
							$("#ckcode").html("验证码错误").addClass("error-pop");	
						}	
					}
				});
			}
		});
		//ajax邮箱验证
		$("#email").blur(function(){
			var email = $(this).val();
			if(email == ""){
				$("#ckemail").html("请填写email！").addClass("error-pop").show();	
			}else{
				$("#ckemail").html("正在检测...").removeClass("error-pop").show();
				$.ajax({
					url:"checkEmail.do",	
					async:true,
					data:{"email":email},
					success:function(data){
						//var obj = eval('(' + data + ')');
						if(data.ok == false){
							$("#ckemail").html("email可以使用").removeClass("error-pop");
						}else{
							$("#ckemail").html("email已注册过").addClass("error-pop");	
						}	
					}
				});
			}
		});
		//密码校验
		$("#password").blur(function(){
			password = $(this).val();//不用var定义变量就是全局变量
 			if(password.length < 6){
				$("#ckpassword").html("密码不能低于6个字符").addClass("error-pop").show();	
			}else{
				$("#ckpassword").html("填写正确！").removeClass("error-pop").show();
			}
		});
		$("#password1").blur(function(){
			var password1 = $(this).val();
			if(password1 != password){
				$("#ckpassword1").html("密码填写不一致").addClass("error-pop").show();	
			}else{
				$("#ckpassword1").html("填写正确！").removeClass("error-pop").show();
			}
		});
		//提交键上锁
		//if(flag==false){
			
		//}
	})
</script>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="logo"><a href="#">我买书</a></div>
        <div class="rindex"><a href="../index.do">返回首页</a></div>
    </div>
    <!--registerpannel-->
    <div class="register-pannel">
    	<div class="reg-title"><span class="title">用户注册</span><span class="fr">已有账号，返回<a href="login.do">登录</a></span></div>
        <ul class="progress">
            <li class="doing">1.填写注册信息<em></em></li>
            <li class="next">2.验证邮箱<em></em></li>
            <li class="next">3.注册成功</li>
        </ul>
        <div class="input-pannel">
        	<form action="regCheck.do" method="post">
        	<ul>
            	<li>
                <label class="lable-t">Email地址：</label><input type="text" name="user.email" id="email" class="cominput" value="">
                	<div class="pop-tip" id="ckemail"></div>
                </li>            
            	<li>
                <label class="lable-t">昵称：</label><input type="text" name="user.username" id="username" class="cominput" value="">
                    <div class="pop-tip" id="ckname"></div>               
                </li>
            	<li>
                <label class="lable-t">登录密码：</label><input type="password" name="user.password" id="password" class="cominput" value="">
               		<div class="pop-tip" id="ckpassword"></div>
                </li>
            	<li>
                <label class="lable-t">重复密码：</label><input type="password" name="password1" id="password1" class="cominput" value="">
               		<div class="pop-tip" id="ckpassword1"></div>
                </li>
                <li>
                <label class="lable-t">验证码：</label><input type="text" name="checkCode" id="checkCode" class="cominput" value="" style="width:110px">
                <img src="checkCode.do" onclick="this.src='checkCode.do?t='+Math.random()" style="border:1px solid #ccc;height:26px;margin-left:3px;"/>
                	<div class="pop-tip" id="ckcode"></div>
                </li>
                <li style="font-size:12px; padding-top:45px;" id="agreetabs"><input type="checkbox" checked="checked" name="docagree" id="docagreeid" value="1"> 我已阅读并同意<!--《<a href="javascript:;">我买书网交易条款</a>》--></li>
            </ul>
            <div class="agreements">

                                        <div style="float:left"><strong>我买书网交易条款</strong></div>
                                        <div class="reg-agreements">
                    	由我买书网络有限公司在提供域名为womaishu.com（以下简称"我买书网"）的网站服务时与我买书网用户达成的关于使用我买书网的各项规则、条款和条件。本契约在我买书网用户接受注册时生效。您在成为我买书网的用户前，请仔细阅读并接受本协议中所述的所有规则、条款和条件，包括因被提及而纳入的条款和条件，如对条款有任何疑问，可与我买书网客服人员进行咨询。<br>
<b>一、 用户注册</b><br>
1. 用户注册是指用户登陆我买书网，按要求填写相关信息并确认同意履行相关用户协议的过程。用户因进行交易、获取有偿服务等而发生的所有应纳税赋由用户自行承担。<br>
2. 我买书网用户必须是具有完全民事行为能力的自然人，或者是具有合法经营资格的实体组织。无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为我买书网用户或超过其民事权利或行为能力范围从事与我买书网进行交易的，其与我买书网之间的服务协议自始无效，一经发现，我买书网有权立即停止与该用户的交易、注销该用户，并追究其使用我买书网"服务"的一切法律责任。<br><br>

<b>二、用户义务及隐私申明</b><br>
1. 基于本站所提供的网络服务的重要性，在我买书网注册及交易过程中，您应该：<br>
(1)提供详尽、准确的个人资料。<br>
(2)不断更新注册资料，符合及时、详尽、准确的要求。<br> 
2.本站不公开用户的姓名、地址、电话、电子邮箱及其他相关信息， 除以下情况外：<br>
(1) 经用户同意，向第三方披露；<br>
(2) 如用户是符合资格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；<br>
(3) 根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；<br>
(4) 如果用户出现违反中国有关法律或者网站政策的情况，需要向第三方披露；<br>
(5) 为提供用户所要求的产品和服务，而必须和第三方分享用户的个人信息；<br>
(6) 其它我买书网根据法律或者网站政策认为合适的披露。<br><br>

<b>三、价格和缺货</b><br>
1.本站将尽最大努力保证您所购商品与网站上公布的价格一致。如果发生了意外情况，在确认了您的订单后，由于供应商提价，税额变化引起的价格变化，或是由于网站的错误等造成商品价格变化，您有权取消您的订单。
2.产品的价格和可获性都在本站上指明，这类信息将随时更改，我买书网将不再另发通知。<br>
3.您所订购的商品，如果发生缺货，您有权取消定单。<br><br>

<b>四、送货及费用</b><br>
1. 本站将会把产品送到您所指定的送货地址。所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估算而得出的，参考时间不代表等同于到货时间。
2. 送货费用根据您选择的配送方式的不同而异。<br>
3. 请清楚准确地填写您的真实姓名、送货地址及联系方式。因包括但不限于如下情况造成订单延迟或无法配送等，本站将不承担迟延配送的责任：<br> 
(1)、客户提供错误信息或不详细的地址。<br>
(2)、货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果由收货人承担。<br>
(3)、发生不可抗力，例如：自然灾害、交通戒严、突发战争等。<br> <br>
<b>五、退款服务</b><br>
退货或换货商品缺货时产生的现金款项，退回方式视支付方式的不同而不同：<br>
(1)、 网上支付的订单，退款退回至原支付卡。<br>
(2)、 银行转帐或邮局汇款支付的订单，退款退回至下订单账户的账户余额中。<br>
(3)、 IC卡（仅限于浙江省杭州市范围内使用）支付的订单，除质量问题外概不退款。如需退款，款项退回至原支付卡。<br>
<br>
<b>六、邮件和短信通知</b><br>
我买书网保留通过邮件和短信的形式，对本网站注册、购物用户发送订单信息、促销活动等告知服务的权利。如果您在我买书网注册、购物，表明您已默示同意接受此项服务。若您不希望接收我买书网的邮件和短信，请提供您的邮箱号或手机号码联系客服进行退订处理。<br><br>

<b>七、服务条款的修改</b><br>
本站将可能不定期的修改本用户协议的有关条款，一旦条款及服务内容产生变动，本站将会在重要页面上提示修改内容。在我们变更这些条款后，您对我买书网的继续使用，都将构成您对变更的接受。<br><br>

<b>八、服务内容的所有权</b><br>
本站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其它信息。所有这些内容的版权、商标、标签和其它财产都是我买书网络有限公司或其内容提供者的财产，受中国和国际版权法的保护。所以，用户只能在本站授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者和本站授权。用户不得以其他任何形式侵犯本站的知识产权。<br><br>

<b>九、评论、意见、消息和其他内容</b><br>
本站访问者可以张贴评论、意见及其他内容，以及提出建议、主意、意见、问题或其他信息，只要内容不是非法、淫秽、威胁、诽谤、侵犯隐私、侵犯知识产权或以其他形式对第三者构成伤害或侵犯的，也不得包含软件病毒、政治宣传、商业招揽、大宗邮件或任何形式的"垃圾邮件"。您不可以使用虚假的电子邮件地址、冒充任何他人或实体或以其它方式对内容的来源进行误导。我买书网保留清除或编辑这些内容的权利（但非义务），但没义务对所张贴的内容进行经常性的审查。 <br><br>
<b>十、处罚规则</b><br>
1.本站所有的促销活动和设置仅针对普通消费者，任何以赢利为目的，或订购过程中存在作弊及非正当手段获利手段行为的单位及个人均不得享受。<br>
2.本站有权对用户的注册数据及购买行为进行查阅，发现注册数据或购买行为中存在任何问题或怀疑，均有权向用户发出询问及要求改正的通知或者直接作出删除等处理；用户有义务在收到询问或要求改正的通知之日起 7日内回答询问或改正。<br>
3.经国家生效法律文书或行政处罚决定确认用户存在违法行为，或者我买书网有事实依据可以认定用户存在违法或违反服务协议行为的，我买书网有权在网站上以网络发布形式公布用户的违法行为；<br><br>
<b>十一、法律管辖和适用</b><br>
    您和我买书网之间的交易条款将适用中华人民共和国的法律，所有的争端将诉诸于我买书网络有限公司所在地的人民法院。<br><br>
<b>十二、关于解释权</b><br>
本站交易条款的最终解释权保留在我买书网络有限

                                        </div>

                 </div>
                 <input type="submit" id="submitid" class="cos-submit" value="" style="text-align:left; margin-top:10px; margin-left:240px;margin-bottom:30px;">
            </form>
        </div>
        
    </div>
    
    <div class="simple-footer">
    	<div class="copyright">我买书网版权所有 2012-2013</div>
    </div>
</div>
</body>
</html>
