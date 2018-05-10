<%@ page contentType="text/html; charset=utf-8" %>
<%
	String id = request.getParameter("memberid");
	if (id.equals("erd13")) {
		response.sendRedirect("/mar29/index.jsp");
	} else {
		%>

<html>
<head>


<title>로그인에 실패</title>
</head>
<body>
아이디가 erd13가 아닙니다.

</body>
</html>
<%
}
%>