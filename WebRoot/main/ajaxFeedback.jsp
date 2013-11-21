<%@page contentType="text/html;charset=utf8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
                    	<div id="comm-list" class="comm-list">
                        	<ul>
<s:iterator value="feedbacks">                            
                            	<li>
                                	<div class="comm-title"><span>${subject}</span><span class="comm-author">(${username},2012-07-08)</span></div>
                                    <div class="comm-content">${content}</div>
                                </li>
</s:iterator>                                
                            </ul>
                        </div>
                        <div class="page" id="page">${pager}</div>
                        <div class="post-area">
                        	<form action="" method="">
                            <div class="subject"><span>标题：</span><input type="text" name="subject" id="subject"/></div>
                        	<div><textarea style="" id="content"></textarea></div>
                            <div class="btn"><input type="button" value="发表评论" onclick="feedbackPost();"/></div>
                            </form>
                        </div>
