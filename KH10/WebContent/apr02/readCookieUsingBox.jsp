<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "util.CookieBox" %>
<%
	CookieBox cookieBox = new CookieBox(request);
%>

<html>
<head>
<title> cookie ���</title></head>
<body>
	name ��Ű = <%= cookieBox.getValue("name") %> <br>
	<% if(cookieBox.exists("id")) { %>
	id ��Ű = <%= cookieBox.getValue("id") %> <br>
	<% } %>


</body></html>
