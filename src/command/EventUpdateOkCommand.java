package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class EventUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		EventDAO dao = new EventDAO();
		
		//입력한 값을 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String enddate = request.getParameter("enddate");
		
		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(subject != null && subject.trim().length() > 0){			
			try {			
				cnt = dao.update(uid, subject, content, enddate);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		request.setAttribute("result", cnt);
	} // end execute()
} // end Command