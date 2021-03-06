package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class HelloHandler implements CommandHandler {

	public String process(HttpServletRequest request, HttpServletResponse response)
	throws Throwable {
		request.setAttribute("hello", "안녕하세요");
		return "/may01_mvc/hello.jsp";
	}

}
