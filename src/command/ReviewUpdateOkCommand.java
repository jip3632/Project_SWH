package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		
		//입력한 값을 받아오기
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int st_uid = Integer.parseInt(request.getParameter("store"));
		
		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(subject != null && subject.trim().length() > 0){			
			try {			
				cnt = dao.update(re_uid, subject, content, st_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		request.setAttribute("result", cnt);
		request.setAttribute("re_uid", re_uid);
		request.setAttribute("mb_uid", mb_uid);
	} // end execute()
} // end Command