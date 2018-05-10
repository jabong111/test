
<%@page import="article.ReplyArticleService"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "article.ReadArticleService" %>
<%@ page import = "article.Article" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "replyingRequest" class = "article.ReplyingRequest" />
<<jsp:setProperty name="replyingRequest" property="*"/>
<%
	String viewPage = null;
	try {
		Article postedArticle = ReplyArticleService.getInstance().reply(replyingRequest);
		request.setAttribute("postedArticle", postedArticle);
		viewPage = "reply_success.jsp";
	} catch (Exception ex) {
		viewPage = "reply_error.jsp";
		request.setAttribute("replyException", ex);
	}
%>
<jsp:forward page = "<%=viewPage %>" />
