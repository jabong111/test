<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글쓰기</title>
</head>
<body>

<form action="<c:url value = 'write.jsp'/>" method = "post">
제목 : <input type = "text" name = "title" size = "20" /> <br />
작성자 : <input type = "text" name = "writerName" /> <br />
글 암호 : <input type = "password" name = "password" /> <br />
글내용 : <br />
<textarea name = "content" rows="5" cols="40"></textarea>
<br />
<input type = "submit" value = "전송" />

</form>

</body>
</html>