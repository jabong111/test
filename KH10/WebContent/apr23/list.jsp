<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="article.ArticleListModel"%>
<%@page import="article.ListArticleService"%>
<%
	String pageNumberString = request.getParameter("p");
	int pageNumber = 1;
	if (pageNumberString != null && pageNumberString.length() > 0) {
		pageNumber = Integer.parseInt(pageNumberString);
	}
	ListArticleService listSerivce = ListArticleService.getInstance();
	ArticleListModel articleListModel = listSerivce.getArticleList(pageNumber);
	request.setAttribute("listModel", articleListModel);
	
	if (articleListModel.getTotalPageCount() > 0) {
		int beginPageNumber = (articleListModel.getRequestPage() - 1) / 10 * 10 + 1;
		int endPageNumber = beginPageNumber + 9;
		if (endPageNumber > articleListModel.getTotalPageCount()) {
			endPageNumber = articleListModel.getTotalPageCount();
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
	}
%>
<jsp:forward page="list_view.jsp" />