package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewWriteOkCommand implements Command {	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		
		// 입력한 값 받아오기
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int st_uid = Integer.parseInt(request.getParameter("store"));
		int wr_uid = Integer.parseInt(request.getParameter("writerName"));
		
		// parameter 유효성 검증
		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.insert(subject, content, wr_uid, st_uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("mb_uid", wr_uid);
	}

}
