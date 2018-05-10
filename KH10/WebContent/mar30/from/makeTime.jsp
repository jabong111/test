<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.util.Calendar" %>

<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
	%>

<jsp:forward page = "/mar30/to/viewTime.jsp"/>