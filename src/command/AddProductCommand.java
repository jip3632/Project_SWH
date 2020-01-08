package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductInStoreDTO;
import beans.ProductMarketDTO;
import beans.SearchDAO;

public class AddProductCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// sl_market과 sl_product조인한 객체  SELECT ALL
		// sl_inventory, sl_market, sl_product 조인한 객체 SELECT WHERE st_uid = ?
		SearchDAO sdao = new SearchDAO();
		ProductInStoreDTO[] parr = null;
		ProductMarketDTO[] pmarr = null;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		try {
			// inv_uid, mk_uid와 pd_uid만 가져옴
			parr = sdao.selectProductsByStore(st_uid);
			request.setAttribute("inventory", parr);
			
			sdao = new SearchDAO();
			pmarr = sdao.selectAllProductsInMarkets();
			request.setAttribute("products", pmarr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
