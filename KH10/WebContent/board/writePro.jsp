<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "sm.logon.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr"); %>

<<jsp:useBean id="article" scope = "page" class = "sm.logon.BoardDataBean">
<jsp:setProperty name = "article" property = "*"/>
</jsp:useBean>

<%
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
article.setIp(request.getRemoteAddr());

BoardDBBean dbPro = BoardDBBean.getInstance();
dbPro.insertArticle(article);

response.sendRedirect("list.jsp");
%>
