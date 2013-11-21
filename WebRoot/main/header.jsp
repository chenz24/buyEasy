<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="topnav">
	<div class="wrap">
    	<div id="login_info"><p>您好！欢迎光临[<a href="/user/reg.do">注册</a>][<a href="/user/login.do">登陆</a>]</p></div>
        <div class="operate_nav">
        	<ul>
            	<li><a href="#" title="sorry,本功能开发中">我的订单</a></li>
            	<li><a href="#" title="sorry,本功能开发中">我的账户</a></li>
            	<li><a href="#" title="sorry,本功能开发中">我的消息</a></li>
            	<li><a href="/cart/shoppingCart.do">购物车</a></li>
            	<li><a href="#" title="sorry,本功能开发中">帮助中心</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="header">
    <div class="wrap">
        <div class="logo"><a href="/index.do"><img src="/images/logo.png" alt="我买书网" /></a></div>
        <div class="search_content">
            <div class="search_pannel">
                <div class="search_box">
                    <form action="search.do" method="get">
                    <input type="hidden" value="" name="catid" id="catid"/>
                        <input type="text" name="query.title" id="keyword"/>
                        <div class="select_cat" id="select_cat">
                        <span class="current_cat" id="curcat">全部分类</span>
                            <div id="cat_list">
                                <ul>
                                    <li><a href="javascript:void(0)" onclick="changeCid(0,'全部分类');">全部分类</a></li>
<s:iterator value="topcats">                                     
                                    <li><a href="javascript:void(0)" onclick="changeCid(${cid},'${catName}');">${catName}</a></li>
</s:iterator>                                                                        
                                </ul>
                            </div>    
                        </div>
                        <input type="submit" value="" class="submit" id="submit"/>
                    </form>
                </div>
            </div>
            <div class="hotwords">
                    <span>热门：</span><a href="/search.do?query.title=舌尖上的中国">舌尖上的中国</a><a href="search.do?query.author=张德芬">张德芬</a><a href="search.do?query.title=盗墓笔记">盗墓笔记</a><a href="search.do?query.title=世界如此险恶">世界如此险恶,你要内心强大</a>
            </div>
        </div>
    </div>
    <!--menu-->
    <div class="menu">
    	<div class="wrap">
        	<div class="all_cat" id="all-cat">
            	<a href="#" title="全部分类" class="alink"></a>
            	<div class="all_sort" id="all-sort">
                	<div class="sortbox_top"></div>
                    <div class="sortbox_c">
                    	<h3><a href="#">图书</a></h3>
                        <ul class="sort_list">
                            <s:iterator value="catTree"status="state"var="g"><s:if test="#g.layer==0"><li><a href="list.do?catid=${cid}">${g.catName}</a><span class="countnum">(${g.count})</span><span class="array"></span><div class="allsort-popup"><div class="subsort_list"id="subcate-list02"><s:iterator value="catTree"var="p"><s:if test="#p.parentId==#g.cid"><dl><dt><a href="list.do?catid=${cid}"class="navi_title"title="${catName}">${catName}</a></dt><dd><s:iterator value="catTree"var="s"><s:if test="#s.parentId==#p.cid"><a href="list.do?catid=${cid}"class="navi_title"title="${catName}">${catName}</a></s:if></s:iterator></dd></dl></s:if></s:iterator></div></div></li></s:if></s:iterator>
                        </ul>
                    </div>
                    <div class="sortbox_bottom"></div>
                </div>
            </div>
            <!--菜单-->
            <div class="menulist">
            	<ul>
                	<li class="on"><a href="/index.do"><em>首页</em></a></li>
                	<li><a href="/list.do?catid=1"><em>人文社会</em></a></li>
                	<li><a href="/list.do?catid=2"><em>文学</em></a></li>
                	<li><a href="/list.do?catid=10"><em>生活</em></a></li>
                	<li><a href="/list.do?catid=3"><em>经济法律</em></a></li>
                	<li><a href="/list.do?catid=7"><em>计算机</em></a></li>
                </ul>
            </div>
            <div class="commcat">
            	<a href="/list.do?catid=2">文学</a><a href="/list.do?catid=39">悬疑探秘</a><a href="/list.do?catid=38">世界名著</a><a href="/list.do?catid=48">JAVA编程</a><a href="/list.do?catid=66">时尚瘦身</a><a href="/list.do?catid=61">公务员考试</a><a href="/list.do?catid=63">人生哲学</a><a href="/list.do?catid=44">亲子读物</a>
            </div>
        </div>
    </div>
</div>