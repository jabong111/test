<%@page import="java.util.TimeZone"%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<title>�ð��� ���</title>
</head>

<c:forEach var = "id" items="<%= TimeZone.getAvailableIDs() %>">
	${id}<br />
</c:forEach>

<body>

</body>
</html>