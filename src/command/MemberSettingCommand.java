package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class MemberSettingCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO[] arr = null;
		MemberDAO dao = new MemberDAO();

		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		
		try {
			arr = dao.selectByUid(mb_uid);
			request.setAttribute("result", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				

	}

}
