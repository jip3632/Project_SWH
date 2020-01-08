package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;
import beans.StoreDTO;

public class ManagerPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		StoreDTO[] arr = null;
		try {
			arr = sdao.selectStore(Integer.parseInt(request.getParameter("mb_uid")));
			
			request.setAttribute("result", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
