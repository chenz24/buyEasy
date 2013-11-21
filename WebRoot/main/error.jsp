<%@page contentType="text/html;charset=utf8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String url = request.getHeader("Referer");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../images/style.css" type="text/css" rel="stylesheet" />
<title>出错了...</title>
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
});
</script>

<style type="text/css">
.main{margin-top:20px;}
.main_left{width:760px;}
.main_right{width:190px;}
</style>
</head>

<body>
<div id="topnav">
	<div class="wrap">
    	<div id="login_info"><p>您好！欢迎光临当当网[<a href="#">注册</a>][<a href="#">登陆</a>]</p></div>
        <div class="operate_nav">
        	<ul>
            	<li><a href="#">我的订单</a></li>
            	<li><a href="#">我的账户</a></li>
            	<li><a href="#">我的消息</a></li>
            	<li><a href="#">购物车</a></li>
            	<li><a href="#">帮助中心</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="header">
    <div class="wrap">
        <div class="logo"><a href="#"><img src="../images/logo.png" alt="当当网" /></a></div>
        <div class="search_content">
            <div class="search_pannel">
                <div class="search_box">
                    <form action="" method="">
                        <input type="text" name="keyword" id="keyword"/>
                        <div class="select_cat" id="select_cat">
                        <input type="text" value="全部分类" class="current_cat" disabled="disabled" id="curcat"/>
                            <div id="cat_list">
                                <ul>
                                    <li><a href="">文学</a></li>
                                    <li><a href="">社科</a></li>
                                    <li><a href="">计算机</a></li>
                                    <li><a href="">外国文学</a></li>
                                    <li><a href="">小说</a></li>
                                    <li><a href="">文学</a></li>
                                    <li><a href="">社科</a></li>
                                    <li><a href="">计算机</a></li>
                                    <li><a href="">外国文学</a></li>
                                    <li><a href="">小说</a></li>
                                    <li><a href="">文学</a></li>
                                    <li><a href="">社科</a></li>
                                    <li><a href="">计算机</a></li>
                                    <li><a href="">外国文学</a></li>
                                    <li><a href="">小说</a></li>
                                </ul>
                            </div>    
                        </div>
                        <input type="submit" name="submit" value="" class="submit" id="submit"/>
                    </form>
                </div>
            </div>
            <div class="hotwords">
                    <span>热门：</span><a href="#">关键词1</a><a href="#">关键词2</a><a href="#">关键词3</a><a href="#">关键词4</a>
            </div>
        </div>
    </div>
    <!--menu-->
    <div class="menu">
    	<div class="wrap">
        	<div class="all_cat">
            	<a href="#" title="全部分类" class="alink"></a>
            	<div class="all_sort" style="display:none;">
                	<div class="sortbox_top"></div>
                    <div class="sortbox_c">
                    	<h3><a href="#">图书</a></h3>
                        <ul class="sort_list">
                        	<li>
                            	<a href="#">人文社会</a><span class="countnum">(10290)</span><span class="array"></span>
                            	<div class="allsort-popup">
                                	<div class="subsort_list">
                                        <dl>
                                            <dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_267.html');" class="navi_title" title="哲 学">哲 学</a>
                                            </dt>
                                            <dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_268.html');">中国哲学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_269.html');">西方哲学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_271.html');">哲学总论</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_272.html');">逻辑学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_273.html');">伦理学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_274.html');">美学</a>
                                            </dd>
                                        </dl>
                                    <dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_276.html');" class="navi_title" title="宗教">宗教</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_277.html');">佛教</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_278.html');">道教</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_279.html');">基督教</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_280.html');">伊斯兰教</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_282.html');" class="navi_title" title="心理学">心理学</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_282.html');">心理学</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_283.html');" class="navi_title" title="励志读物">励志读物</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_284.html');">人生哲学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_285.html');">成功与励志</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_286.html');">情商与修养</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_287.html');">思维与谋略</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_288.html');">职场艺术</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_289.html');">为人处世</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_245.html');" class="navi_title" title="中国史">中国史</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_246.html');">先秦史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_247.html');">秦汉魏六国史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_248.html');">隋唐宋元金史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_249.html');">明清史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_250.html');">近代史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_251.html');">现当代史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_253.html');">中国通史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_254.html');">历史典籍</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_237.html');" class="navi_title" title="世界史">世界史</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_238.html');">亚洲史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_239.html');">欧洲史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_240.html');">美洲史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_241.html');">非洲史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_242.html');">大洋洲史</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_243.html');">世界通史</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_257.html');" class="navi_title" title="人物传记">人物传记</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_258.html');">历代帝王</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_259.html');">古代人物传记</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_260.html');">近现代人物传记</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_261.html');">中国领袖首脑</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_262.html');">财经人物</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_263.html');">文学家</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_264.html');">女性人物</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_265.html');">外国人物传记</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_256.html');" class="navi_title" title="文物考古">文物考古</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_256.html');">文物考古</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_291.html');" class="navi_title" title="政治社会">政治社会</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_293.html');">中国政治</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_294.html');">国家领导著作</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_295.html');">党政读物</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_296.html');">世界政治</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_298.html');">军事理论</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_299.html');">中国军事</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_301.html');">军事战略技术</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_302.html');">社会学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_307.html');">社科文集</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_309.html');" class="navi_title" title="人文读物">人文读物</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_309.html');">人文读物</a></dd></dl></div>
                                </div>
                            </li>
                            <li><a href="#">人文社会</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li>
                            	<a href="#">文学</a><span class="countnum">(10290)</span><span class="array"></span>
                            	<div class="allsort-popup"> <div class="subsort_list" id="subcate-list02"><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_2.html');" class="navi_title" title="小说">小说</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_3.html');">古典小说</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_4.html');">经典名著</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_5.html');">外国小说</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_6.html');">青春文学</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_7.html');">推理悬疑</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_10.html');">历史小说</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_8.html');">武侠</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_9.html');">魔幻</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_11.html');">科幻</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_12.html');">职场</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_13.html');">官场</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_14.html');">军事</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_15.html');">言情</a></dd></dl><dl><dt><a onclick="getLink('http://search.bookuu.com/cd[fl]_17.html');" class="navi_title" title="诗歌散文">诗歌散文</a></dt><dd><a onclick="getLink('http://search.bookuu.com/cd[fl]_18.html');">诗词曲赋</a><a onclick="getLink('http://search.bookuu.com/cd[fl]_19.html');">散文诗歌</a></dd></dl></div> </div>
                            </li>
                            <li><a href="#">经济法律</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">少儿</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">艺术</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">建筑</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">计算机</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">科技</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">自然科学</a><span class="countnum">(10290)</span><span class="array"></span></li>
                            <li><a href="#">语言</a><span class="countnum">(10290)</span><span class="array"></span></li>
                        </ul>
                    </div>
                    <div class="sortbox_bottom"></div>
                </div>
            </div>
            <!--菜单-->
            <div class="menulist">
            	<ul>
                	<li class="on"><a href="#"><em>首页</em></a></li>
                	<li><a href="#"><em>图书</em></a></li>
                	<li><a href="#"><em>影音</em></a></li>
                	<li><a href="#"><em>聚划算</em></a></li>
                	<li><a href="#"><em>首页</em></a></li>
                	<li><a href="#"><em>首页</em></a></li>
                	<li><a href="#"><em>首页</em></a></li>
                </ul>
            </div>
            <div class="commcat">
            	<a href="#">文学</a><a href="#">人文社会</a><a href="#">儿童</a><a href="#">科教</a><a href="#">计算机</a><a href="#">文学</a><a href="#">人文社会</a><a href="#">儿童</a><a href="#">科教</a><a href="#">计算机</a>
            </div>
        </div>
    </div>
</div>
<!--推荐区-->

<!--各分类列表-->
<div class="wrap">
    <div class="main">
		<div class="error-info"><span><s:property value="errorInfo" /></span><a href="<%=url%>">返回上一个页面</a></div>            
    </div>
</div>

<!--footer-->
<div class="wrap">
    <div id="footer">
    	<div class="nav"><a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">联系我们</a> | <a href="#">视频发布</a></div>
        <div class="copyright">
        	<p>Copyright © 2010-2012 feiyusp.com All Rights Reserved. <a href="">粤ICP备10204700号-1</a></p>
            <p>法律声明：本站内容均为网友上传，网站举办方负责审核和监督，如存在版权或非法内容，欢迎举报，我们将尽快予以删除</p>
            <p>信息网络传播视听节目许可证号:0110537 网站客服:feiyuwebmaster@163.com QQ:752222591</p>
        </div>
    </div>
</div>
</body>
</html>
