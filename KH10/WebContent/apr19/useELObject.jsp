<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setAttribute("name", "최범균");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>EL Object</title>
</head>
<body>

요청 URI: ${pageContext.request.requestURI} <br>
<%--
	<%= pageContext.getRequest().getRequestURI()$>
	 --%>
	 request의 name 속성 : ${requestScope.name } <br>
<%--
	<%= request.getAttribute("name")%>
	  --%>
	 code 파라미터 : ${param.code}
	 <%--
	 <%= request.getParameter("code"%>
	  --%>
	 

</body>
</html>