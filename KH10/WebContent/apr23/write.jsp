<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "article.WriteArticleService"  %>
<%@ page import = "article.Article" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "writingRequest"
class = "article.WritingRequest" />
<jsp:setProperty name = "writingRequest" property = "*" />
<%
	Article postedArticle = WriteArticleService.getInstance().write(writingRequest);
	request.setAttribute("postedArticle", postedArticle);
%>


<html>
<head>
<title>게시글 작성</title>
</head>
<body>
게시글을 등록하였습니다
<br />
<a href = "<c:url value = 'list.jsp'/>">목록보기</a>
<a href = "<c:url value = 'read.jsp?articleId=${postedArticle.id}'/>">게시글 읽기</a>

</body>
</html>