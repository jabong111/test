<%@page import="util.CookieBox"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)) {
		response.addCookie(CookieBox.createCookie("LOGIN", "SUCCESS","/",-1));
		response.addCookie(CookieBox.createCookie("ID", id,"/",-1));
%>

<html>
<head>

<title>로그인 성공</title>
</head>
<body>
로그인엔 성공하였습니다.

</body>
</html>
<%
 } else {
 %>
 <script>
 alert("로그인에 실패하였습니다");
 history.go(-1);
 </script>
 <%
 }
 %>