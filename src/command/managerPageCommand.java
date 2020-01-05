package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;
import beans.StoreDTO;

public class managerPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		StoreDTO[] arr = null;
		try {
			
			//arr = sdao.selectStore(Integer.parseInt(request.getParameter("mb_uid")));
			
			//실험용 세팅 (이후 윗줄로 변경해서 mb_uid값 받아와서 실행)
			arr = sdao.selectStore(101);
			
			request.setAttribute("result", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
