<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "util.CookieBox" %>
<%
    response.addCookie(CookieBox.createCookie("name", "최범균"));
    response.addCookie(
        CookieBox.createCookie("id", "madvirus"));
%>
<html>
<head><title>CookieBox사용예</title></head>
<body>

CookieBox를 사용하여 쿠키 생성

</body>
</html>
