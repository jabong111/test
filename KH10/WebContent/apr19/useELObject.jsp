<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setAttribute("name", "�ֹ���");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL Object</title>
</head>
<body>

��û URI: ${pageContext.request.requestURI} <br>
<%--
	<%= pageContext.getRequest().getRequestURI()$>
	 --%>
	 request�� name �Ӽ� : ${requestScope.name } <br>
<%--
	<%= request.getAttribute("name")%>
	  --%>
	 code �Ķ���� : ${param.code}
	 <%--
	 <%= request.getParameter("code"%>
	  --%>
	 

</body>
</html>