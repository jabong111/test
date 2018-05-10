<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "article.ReadArticleService" %>
<%@ page import = "article.Article" %>
<%@ page import = "article.ArticleNotFoundException" %>
<%
	String viewPage = null;
try {
	int articleId = Integer.parseInt(request.getParameter("articleId"));
	Article article = ReadArticleService.getInstance().getArticle(articleId);
	viewPage = "update_form_view.jsp";
	request.setAttribute("article", article);
} catch (ArticleNotFoundException ex) {
	viewPage = "article_not_found.jsp";
}
%>

<jsp:forward page = "<%=viewPage%>" />
