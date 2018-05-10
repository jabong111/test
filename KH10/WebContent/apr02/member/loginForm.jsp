<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>

<title>로그인 폼</title>
</head>
<body>

<form action = "<%= request.getContextPath()%>/apr02/member/login.jsp"
method = "post">
 아이디 <input type = "text" name = "id" size = "10">
 비밀번호 <input type = "password" name = "password" size = "10" >
 <input type = "submit" value = "로그인">
 </form>

</body>
</html>