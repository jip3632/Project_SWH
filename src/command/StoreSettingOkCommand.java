package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SearchDAO;

public class StoreSettingOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchDAO sdao = new SearchDAO();
		String st_address = request.getParameter("st_address");
		String st_contact = request.getParameter("st_contact");
		String st_hours = request.getParameter("st_start") + "-" + request.getParameter("st_end");
		String st_description = request.getParameter("st_description");
		String st_img = request.getParameter("st_img");
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		int cnt = 0;
		
		try {
			cnt = sdao.updateStore(st_address, st_contact, st_hours, st_description, st_img, mb_uid);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				

	}

}
