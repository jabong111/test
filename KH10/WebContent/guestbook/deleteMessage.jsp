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
<title>���� �޼��� ������</title>
</head>
<body>
<% if(!invalidPassword) { %>
�޼����� �����Ͽ����ϴ�.
<% } else { %>
�Է��� ��ȣ�� �ùٸ��� �ʽ��ϴ� ��ȣ�� Ȯ�����ּ���
<% }  %>
<br />
<a href = "list.jsp"></a>
</body>
</html>