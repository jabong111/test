<%@ page  contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>표현언어의 사용예제2</title>
</head>
<body>
<h3> 표현언어의 사용예제2 - 파라미터값 처리</h3>
<p>
<form action = "eLEx2.jsp" method = "post">
	이름 : <input type = "text" name = "name" value = "\{param.name}">
		 <input type = "submit" value = "확인">
	</form>
<p>이름은 : \{param.name}입니다.

</body>
</html>