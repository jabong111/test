<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>수정하기</title>
</head>
<body>

<form action = "update.jsp" method = "post">
<input type = "hidden" name = "articleId" value = "${article.id}"/>
<input type = "hidden" name = "p" value = "${param.p }"/>
제목 : <input type = "text" name = "title" size ="20" value ="${article.title }" /> <br />
글 암호 : <input type = "password" name = "password" /><br />
글 내용 : <br/>
<textarea name = "content" rows="5" cols="40">${article.content}</textarea>
<br />
<input type = "submit" value = "수정"/>


</form>

</body>
</html>