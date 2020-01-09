package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		
		//입력한 값을 받아오기
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));
		
		try {
			cnt = dao.deleteByUid(re_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		request.setAttribute("result", cnt);

	}

}
