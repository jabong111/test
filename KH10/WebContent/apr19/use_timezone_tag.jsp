<%@page import="java.util.Date"%>
<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<title>timezone 태그사용</title>
</head>
<body>

<c:set var = "now" value = "<%= new Date() %>" />
<fmt:formatDate value="${now}" type = "both" 
dateStyle="full" timeStyle="full" />

<br>
<fmt:timeZone value="America/Argentina/Buenos_Aries">
<fmt:formatDate value="${now}" type = "both"
dateStyle="full" timeStyle="full"/>
</fmt:timeZone>

</body>
</html>