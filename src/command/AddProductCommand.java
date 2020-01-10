package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MarketDTO;
import beans.ProductDTO;
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
		ProductDTO[] productArr = null;
		MarketDTO[] marketArr = null;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		try {
			// inv_uid, mk_uid와 pd_uid만 가져옴
			parr = sdao.selectProductsByStore(st_uid);
			request.setAttribute("inventory", parr);
			
			sdao = new SearchDAO();
			pmarr = sdao.selectAllProductsInMarkets();
			request.setAttribute("products", pmarr);
			
			sdao = new SearchDAO();
			productArr = sdao.selectAllProducts();
			request.setAttribute("product", productArr);
			System.out.println(productArr.length);
			
			sdao = new SearchDAO();
			marketArr = sdao.selectAllMarkets();
			request.setAttribute("market", marketArr);
			System.out.println("market" + marketArr.length);
			
			request.setAttribute("st_uid", st_uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
