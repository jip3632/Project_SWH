package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class EventWriteCommand implements Command {	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		EventDAO dao = new EventDAO();
		
		// 입력한 값 받아오기
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		int uid = Integer.parseInt(request.getParameter("st_uid"));
		
		// parameter 유효성 검증
		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.insert(subject, content, startdate, enddate, uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
	}

}
