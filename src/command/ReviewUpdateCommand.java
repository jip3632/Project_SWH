package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewUpdateCommand implements Command {

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
			rarr = rdao.selectByUid(re_uid);
			marr = mdao.selectAllMembers();
			sarr = sdao.selectAllStores();
			
			request.setAttribute("rlist", rarr);
			request.setAttribute("mlist", marr);
			request.setAttribute("slist", sarr);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
	} //end execute()
} // end Command
