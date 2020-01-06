package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class EventListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDAO dao = new EventDAO();
		EventDTO [] arr = null;
		int uid = Integer.parseInt(request.getParameter("st_uid"));
		
		try {
			arr = dao.select(uid);
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}