package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class MemberSettingOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		String address = request.getParameter("mb_address");
		String cell = request.getParameter("mb_cell");
		String email = request.getParameter("mb_email");
		String pw = request.getParameter("mb_pw");
		int uid = Integer.parseInt(request.getParameter("mb_uid"));
		int cnt = 0;
		
		try {
			cnt = dao.update(uid, pw, cell, address, email);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				

	}

}
