package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductMarketDTO;
import beans.SearchDAO;

public class ProductListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO dao = new SearchDAO();
		ProductMarketDTO [] arr = null;
		String word = request.getParameter("word");
		try {
			arr = dao.selectProductsByName(word);
			request.setAttribute("product_list", arr);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
