package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.FileDAO;
import beans.FileDTO;

public class ProductImageCommand implements Command {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FileDAO fdao = new FileDAO();
		FileDTO[] farr = null;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		
		try {
			farr = fdao.selectProductsImageByStore(st_uid);
			request.setAttribute("image", farr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
