<%@ page contentType = "text/html; charset=euc-kr" %>


<html>
<head>

<title>INFO</title>
</head>
<body>
body_sub 에서 name 파라미터 값 : <%= request.getParameter("name") %>
<br/>
name 파라미터 값 목록 :
<ul>
<%
	String[] names = request.getParameterValues("name");
	for (String name : names) {
	%>
	<li> <%= name %> </li>
	<%
	}
	%>
	</ul>

</body>
</html>