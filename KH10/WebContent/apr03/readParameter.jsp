<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage = "/apr03/error/viewErrorMessage.jsp" %>

<html>
<head>

<title>파라미터 출력</title>
</head>
<body>
name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>

</body>
</html>