package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDAO;
import beans.MemberDTO;

public class SignUpListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO [] arr = null;
		String id = request.getParameter("user_id");
		try {
			arr = dao.searchById(id);
			request.setAttribute("list", arr);
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
