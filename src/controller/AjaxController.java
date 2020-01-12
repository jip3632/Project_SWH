package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AddProductCommand;
import command.AjaxAddProductCommand;
import command.AjaxIdCheckCommand;
import command.AjaxProductCommand;
import command.AjaxStoreCommand;
import command.ProductListCommand;
import command.SignUpListCommand;
import command.StoreListCommand;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println(com);
		switch(com) {
		case "/store.ajax":
			new StoreListCommand().execute(request, response);
			new AjaxStoreCommand().execute(request, response);
			break;
		case "/mainProduct.ajax":
			new ProductListCommand().execute(request, response);
			new AjaxProductCommand().execute(request, response);
			break;
		case "/addProduct.ajax":
			//TODO
			// sl_market과 sl_product조인한 객체  SELECT ALL
			// sl_inventory, sl_market, sl_product 조인한 객체 SELECT WHERE st_uid = ?
			new AddProductCommand().execute(request, response);
			new AjaxAddProductCommand().execute(request, response);
			break;
		case "/signUpUser.ajax":
			new SignUpListCommand().execute(request, response);
			new AjaxIdCheckCommand().execute(request, response);
			break;
		case "/signUpManager.ajax":
			new SignUpListCommand().execute(request, response);
			new AjaxIdCheckCommand().execute(request, response);
		}
	}
}
