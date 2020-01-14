package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheckCommand {

	public String sessionCheck(HttpServletRequest request, HttpServletResponse response, String viewPage) {
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			return "/login.slime";
		} else {
			return viewPage;
		}
		
	}

}
