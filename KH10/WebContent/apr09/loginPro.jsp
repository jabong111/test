<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "sm.logon.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id, passwd);
	
	System.out.println(check);
	if(check ==1) {
		session.setAttribute("memId", id);
		response.sendRedirect("main.jsp");
	} else if (check ==0) { %>
	<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	</script>
	<% }else{ %>
	<script>
	alert("아이디가 맞지 않습니다");
	history.go(-1);
	</script>
	<%} %>
	