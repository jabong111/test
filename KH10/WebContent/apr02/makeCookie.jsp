<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<% 
	Cookie cookie = new Cookie("name",URLEncoder.encode("최범균"));
	response.addCookie(cookie);
%>
<html>
<head>

<title>쿠키생성</title>
</head>
<body>
<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"

</body>
</html>