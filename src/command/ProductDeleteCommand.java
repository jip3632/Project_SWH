package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;

public class ProductDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		int cnt  = 0;
		int inv_uid = Integer.parseInt(request.getParameter("inv_uid"));
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		
		try {
			cnt = sdao.deleteInventoryByInvUid(inv_uid);
			request.setAttribute("result", cnt);
			request.setAttribute("st_uid", st_uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		

	}

}
