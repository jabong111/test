<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session = "true" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat fomatter = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<html>
<head>

<title>세션정보</title>
</head>
<body>
세션 ID : <%= session.getId() %> <br>
<%
	time.setTime(session.getCreationTime());
	%>
	세션 생성 시간 : <%= fomatter.format(time) %> <br>
	<%
	time.setTime(session.getLastAccessedTime());
	%>
	최근 접근시간 : <%= fomatter.format(time) %>

</body>
</html>