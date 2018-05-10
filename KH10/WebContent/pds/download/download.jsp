<%@page import="pds.FileDownloadHelper"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "pds.IncreasDownloadCountService" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "pds.PdsItemNotFoundException" %>
<%@ page import = "pds.FileSaveHelper" %>
<%@ page import = "pds.PdsItem" %>
<%@ page import = "pds.GetPdsItemService" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		PdsItem item = GetPdsItemService.getInstance().getPdsItem(id);
		
		response.reset();
		
		String fileName = new String(item.getFileName().getBytes("utf-8"),
				"iso-8859-1");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attatchment; filename =\"" + fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int)item.getFileSize());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1");
		
		FileDownloadHelper.copy(item.getRealPath(),response.getOutputStream());
		
		response.getOutputStream().close();
		
		IncreasDownloadCountService.getInstance().increasCount(id);
	} catch(PdsItemNotFoundException ex) {
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	}
	//이걸수정할거애ㅑ~~~
%>


