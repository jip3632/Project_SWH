package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductInStoreDTO;
import beans.SearchDAO;

public class ProductViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO dao = new SearchDAO();
		ProductInStoreDTO [] arr = null;
		
		int pd_uid = Integer.parseInt(request.getParameter("pd_uid"));

		try {
			arr = dao.showProductsByStore(pd_uid);
			request.setAttribute("product_list_by_store", arr);
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
