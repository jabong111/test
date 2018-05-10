package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sm.logon.BoardDataBean;
import sm.logon.BoardDBBean;

public class UpdateFormAction implements CommandAction {
	
	public String requestPro (HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int num =  Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		return "/mvc_board/updateForm.jsp";
	}

}
