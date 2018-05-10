<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "sm.logon.CommentDBBean" %>
<%@ page import ="java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "cmt" scope = "page" class = "sm.logon.CommentDataBean">
	<jsp:setProperty name = "cmt" property = "*"/>
	</jsp:useBean>
	<%
		CommentDBBean comt = CommentDBBean.getInstance();
		cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
		cmt.setIp(request.getRemoteAddr());
		comt.insertCommet(cmt);
		
		String content_num = request.getParameter("content_num");
		String p_num = request.getParameter("p_num");
		String url1 = "content1.jsp?num="+content_num+"&pageNum="+p_num;
		response.sendRedirect(url1);
	%>

