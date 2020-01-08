package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MemberDAO;
import beans.MemberDTO;

public class LoginOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO[] arr = null;
		
		// 사용자가 입력한 아이디와 패스워드
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		try {
			arr = dao.selectByMbId(id); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (arr.length == 0) {
			// 아이디가 없음
			request.setAttribute("result", "아이디가 존재 하지 않습니다.");
			request.setAttribute("existId", false);
		} else {
			// 아이디가 존재
			request.setAttribute("existId", true);
			MemberDTO dto = arr[0];
			
			if (pw.equals(dto.getMb_pw())) {
				HttpSession session = request.getSession(true); // 세션가져오기 없으면 생성
				session.setAttribute("login", 1);
				session.setAttribute("mb_uid", dto.getMb_uid());
				session.setAttribute("mb_type", dto.getMb_type());
				session.setAttribute("mb", dto);
			} else {
				request.setAttribute("result", "비밀번호가 옳지 않습니다.");
			}
		}
	}

}
