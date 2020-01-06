package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.EventDAO;
import beans.EventDTO;
import beans.ProductInStoreDTO;
import beans.SearchDAO;
import beans.StoreDTO;

public class StoreViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		SearchDAO dao1 = new SearchDAO();
		SearchDAO dao2 = new SearchDAO();
		EventDAO dao3 = new EventDAO();
		
		ProductInStoreDTO[] p_arr = null;
		StoreDTO[] s_arr = null;
		EventDTO[] e_arr = null;
		
		try {
			p_arr = dao1.selectProductsByStore(st_uid);
			s_arr = dao2.selectStoreByStUid(st_uid);
			e_arr = dao3.select(st_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("productList", p_arr);
		request.setAttribute("storeInfo", s_arr);
		request.setAttribute("eventList", e_arr);
	}

}
