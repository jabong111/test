<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page errorPage = "errorView.jsp" %>
<%@ page import = "dao.Message" %>
<%@ page import = "dao.WriteMessageService" %>

<%
request.setCharacterEncoding("euc-kr");
	
 %>
 
 <jsp:useBean id = "message" class = "dao.Message">
 <jsp:setProperty name = "message" property="*" />
 </jsp:useBean>
 
 <%
 	System.out.println(message.getGuestName());
 	System.out.println(message.getPassword());
 	System.out.println(message.getMessage());
 	WriteMessageService writeService = WriteMessageService.getInstance();
 	writeService.write(message);
 	System.out.println("writeMessage.jsp");
 	
 %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 메세지 남김</title>
</head>
<body>
방명록 메세지를 남겼습니다.
<br/>
<a href = "list.jsp">[목록 보기]]</a>

</body>
</html>