package command;


import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDAO;
import beans.MemberDTO;

public class FindAccountCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");

		if (type.equals("findId")) {
			findId(request, response);
		} else {
			findPw(request, response);
		}
	}
	
	private void findId(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO[] arr = null;
		
		String email = request.getParameter("email");
		try {
			arr = dao.findMember(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (arr.length != 0) {
			System.out.println(arr[0].getMb_id());
			request.setAttribute("mb_id", arr[0].getMb_id());
		} else {
			request.setAttribute("mb_id", null);
		}
		request.setAttribute("pageType", 1);
	}
	
	private void findPw(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao1 = new MemberDAO();
		MemberDAO dao2 = new MemberDAO();
		MemberDAO dao3 = new MemberDAO();
		MemberDTO[] arr = null;
		
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		try {
			arr = dao1.findMember(email, id);
			System.out.println(arr.length);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (arr.length != 0) {
			String tempPw = makeTempPassword();
			System.out.println(tempPw);
			int cnt = 0;
			try {
				cnt = dao2.giveTempPassword(tempPw, email, id);
				System.out.println(cnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				arr = dao3.findMember(email, id);
				System.out.println(arr.length);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("dto", arr);
			request.setAttribute("result", cnt);
		} else { 
			request.setAttribute("result", null);
		}
		request.setAttribute("pageType", 2);
	}
	
	private String makeTempPassword() {
		String tempPw = "";
		String templet = "1234567890abcdefghijklmnopqrstuvwxynz";
		int length = templet.length() - 1;
		
		Random rand = new Random();
		for (int i = 0; i < 10; i++) {
			int index = rand.nextInt(length);
			tempPw += templet.substring(index, index + 1);
		}
		return tempPw;
	}
}
