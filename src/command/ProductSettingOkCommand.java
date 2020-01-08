package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;

public class ProductSettingOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		int cnt = 0;
		int inv_uid = Integer.parseInt(request.getParameter("inv_uid"));
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		int inv_volume = 0;
		int inv_price = 0;
		int inv_quantity = 0;
		String volume = request.getParameter("inv_volume");
		String price = request.getParameter("inv_price");
		String quantity = request.getParameter("inv_quantity");
		
		try {
			inv_volume = Integer.parseInt(volume);
			inv_price = Integer.parseInt(price);
			inv_quantity = Integer.parseInt(quantity);
			cnt = sdao.updateInventoryByInvUid(inv_uid, inv_volume, inv_price, inv_quantity);
			request.setAttribute("result", cnt);
			
			request.setAttribute("st_uid", st_uid);
			System.out.println(st_uid);
		}catch(NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
		

	}

}
