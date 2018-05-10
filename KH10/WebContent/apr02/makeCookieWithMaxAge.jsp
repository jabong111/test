<%@ page contentType="text/html; charset=UTF-8" %>

<%
	Cookie cookie = new Cookie("oneh", "1time");
	cookie.setMaxAge(60 * 1); 
	response.addCookie(cookie);
%>
<html>
<head><title>쿠키유효시간설정</title></head>
<body>

유효시간이 1분인 oneh 쿠키 생성.

</body>
</html>
