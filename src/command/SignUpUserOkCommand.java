package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDAO;

public class SignUpUserOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		
		//입력한 값을 받아오기
		String name = request.getParameter("user_name");
		String phone = request.getParameter("phone_number");
		String address = request.getParameter("roadFullAddr");
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String email = request.getParameter("user_email");
		
		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		try {			
			cnt = dao.insertNewUser(id, pw, name, address, phone, email);
			System.out.println(cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);

	}

}
