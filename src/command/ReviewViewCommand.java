package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO [] rarr = null;
		MemberDAO mdao = new MemberDAO();
		MemberDTO [] marr = null;
		SearchDAO sdao = new SearchDAO();
		StoreDTO [] sarr = null;
		
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));
		
		try {
			rarr = rdao.readByUid(re_uid);
			marr = mdao.selectAllMembers();
			sarr = sdao.selectAllStores();
			
			request.setAttribute("rlist", rarr);
			request.setAttribute("mlist", marr);
			request.setAttribute("slist", sarr);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}

	}

}
