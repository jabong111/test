package dao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.xml.ws.http.HTTPException;

public class MessageDaoProviderInit extends HttpServlet {

	public void init(ServletConfig config) throws HTTPException {
		String dbms = config.getInitParameter("dbms");
		if(dbms != null) {
			MessageDaoProvider.getInstance().setDbms(dbms);
			
		}
	}

}
