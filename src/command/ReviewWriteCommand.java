package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO [] marr = null;
		SearchDAO sdao = new SearchDAO();
		StoreDTO [] sarr = null;
		
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		
		try {
			
			marr = mdao.selectByUid(mb_uid);
			sarr = sdao.selectAllStores();
			
			request.setAttribute("mlist", marr);
			request.setAttribute("slist", sarr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}