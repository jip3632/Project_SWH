package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.FileDAO;
import beans.FileDTO;
import beans.SearchDAO;
import beans.StoreDTO;

public class ManagerPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		StoreDTO[] sarr = null;
		FileDAO fdao = new FileDAO();
		FileDTO[] farr = null;
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		try {
			sarr = sdao.selectStore(mb_uid);
			request.setAttribute("result", sarr);
			if(sarr != null && sarr.length == 1) {
				farr = fdao.selectStoreImageByStUid(mb_uid);
				request.setAttribute("image", farr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
