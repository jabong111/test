<%@ page contentType = "text/html; charset=euc-kr" %>
<%
	String code = request.getParameter("code");
	String viewPageURL = null;
	
	if(code.equals("A")) {
		viewPageURL = "/mar30/viewModule/a.jsp";
	} else if (code.equals("B")) {
		viewPageURL = "/mar30/viewModule/b.jsp";
	} else if (code.equals("C")) {
		viewPageURL = "/mar30/viewModule/c.jsp";
	}
%>

<jsp:forward page = "<%= viewPageURL %>" />
