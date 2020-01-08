package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductInStoreDTO;
import beans.SearchDAO;

public class ProductSettingCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		int inv_uid = Integer.parseInt(request.getParameter("inv_uid"));
		ProductInStoreDTO[] arr = null;
		try {
			arr = sdao.selectProductByInvUid(inv_uid);
			request.setAttribute("result", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
