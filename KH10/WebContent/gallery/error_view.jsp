<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page isErrorPage = "true" %>

<html>
<head>

<title>에러발생</title>
</head>
<body>
에러가 발생하였습니다 ! ! <br><br>
에러 메세지 : <%= exception.getMessage() %>
<% exception.printStackTrace(); %>
<p>

<%
	Throwable rootCause = null;
	if(exception instanceof ServletException) {
		rootCause = ((ServletException)exception).getRootCause();
	} else {
		rootCause = exception.getCause();
	}
	if(rootCause != null) {
		rootCause.printStackTrace();
		do{
%>
예외 추적: <%= rootCause.getMessage() %><br>
<% 
            rootCause = rootCause.getCause();
        } while(rootCause != null);
    }
%>

</body>
</html>

