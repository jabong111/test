<%@page import="java.io.IOException"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import = "java.io.FileReader" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소스보기</title>
</head>
<body>
<%
	FileReader reader = null;
	try {
			String path = request.getParameter("path");
			reader = new FileReader(getServletContext().getRealPath(path));
%>
<pre>
소스코드 = <%= path %>
<c:out value = "<%= reader %>" escapeXml = "true" />
</pre>
<%
	} catch (IOException ex) {
		%>
	에러: <%= ex.getMessage() %>
		<%
		} finally {
		if(reader != null)
		try {
				reader.close();
		} catch(IOException ex) {}
		}
		%>
</body>
</html>