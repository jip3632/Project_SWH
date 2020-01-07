package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class EventUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDAO dao = new EventDAO();
		EventDTO [] arr = null;
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			arr = dao.selectByUid(uid); 
			request.setAttribute("update", arr);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	} //end execute()
} // end Command
