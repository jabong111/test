<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%@ page errorPage="errorView.jsp" %>
<%@ page import = "dao.DeleteMessageService" %>
<%@ page import = "dao.InvalidMessagePasswordException" %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try {
		DeleteMessageService deletService = DeleteMessageService.getInstance();
		deletService.deleteMessage(messageId, password);
	} catch (InvalidMessagePasswordException ex) {
		invalidPassword = true;
 	}
%>





<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 메세지 삭제함</title>
</head>
<body>
<% if(!invalidPassword) { %>
메세지를 삭제하였습니다.
<% } else { %>
입력한 암호가 올바르지 않습니다 암호를 확인해주세요
<% }  %>
<br />
<a href = "list.jsp"></a>
</body>
</html>