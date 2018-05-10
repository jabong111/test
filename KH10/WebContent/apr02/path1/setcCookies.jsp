<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.net.URLEncoder" %>
<%
	Cookie cookie1 = new Cookie("path1",URLEncoder.encode
			("경로:/apr02.path1","euc-kr"));
	cookie1.setPath("/KH10/apr02/path1");
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie ("path2", URLEncoder.encode
			("경로","euc-kr"));
	response.addCookie(cookie2);
	
	Cookie cookie3 = new Cookie("path3",URLEncoder.encode
			("경로:/","euc-kr"));
	cookie3.setPath("/");
	response.addCookie(cookie3);
	
	Cookie cookie4 = new Cookie("path4",URLEncoder.encode
			("경로:/KH10/apr02/path2","euc-kr"));
	cookie4.setPath("/KH10/apr02/path2");
	response.addCookie(cookie4);


%>
<html>
<head>
<title>쿠키 경로 지정</title>
</head>
<body>
다음과 같이 쿠키를 생성했습니다.<br>
	<%= cookie1.getName() %>=<%= cookie1.getValue() %>
	[<%= cookie1.getPath() %>]
	<br>
	<%= cookie2.getName() %>=<%= cookie2.getValue() %>
	[<%= cookie2.getPath() %>]
	<br>
	<%= cookie3.getName() %>=<%= cookie3.getValue() %>
	[<%= cookie3.getPath() %>]
	<br>
	<%= cookie4.getName() %>=<%= cookie4.getValue() %>
	[<%= cookie4.getPath() %>]



</body>
</html>