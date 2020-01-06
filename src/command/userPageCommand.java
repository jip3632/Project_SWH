package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class userPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO [] arr = null;
		int uid = Integer.parseInt(request.getParameter("mb_uid"));
		try {
			arr = dao.selectByUid(uid);
			request.setAttribute("result", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
