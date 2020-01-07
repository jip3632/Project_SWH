package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class EventViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDAO dao = new EventDAO();
		EventDTO [] arr = null;
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		// 페이징
		int page = 1;
		String param = request.getParameter("page");
		if(param != null) page = Integer.parseInt(param);
		
		
		try {
			arr = dao.selectByUid(uid);  //
			request.setAttribute("list", arr);
			request.setAttribute("page", page); // 페이징
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}

	}

}
