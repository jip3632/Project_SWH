package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;

public class AddProductOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		int cnt = 0;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		int pd_uid = Integer.parseInt(request.getParameter("pd_uid"));
		int inv_volume = Integer.parseInt(request.getParameter("inv_volume"));
		int inv_price = Integer.parseInt(request.getParameter("inv_price"));
		int inv_quantity = Integer.parseInt(request.getParameter("inv_quantity"));
		try {
			cnt = sdao.insertIfNotExistUpdateIfExist(st_uid, pd_uid, inv_volume, inv_price, inv_quantity);
			request.setAttribute("result", cnt);
			request.setAttribute("st_uid", st_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

	}

}
