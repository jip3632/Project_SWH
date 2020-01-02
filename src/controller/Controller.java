package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commad.Command;


@WebServlet("*.slime")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Command command = null;
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch(com) {
		//매장 관리페이지
		case "/managerPage.slime":
			//TODO
			viewPage = "managerPage.jsp";
			break;
		//매장 정보 변경
		case "/storeSetting.slime":
			//TODO
			System.out.println("abc");
			viewPage = "storeSetting.jsp";
			break;
		//제품 관리
		case "/productList.slime":
			//TODO
			viewPage = "productList.jsp";
			break;
		//제품 등록
		case "/addProduct.slime":
			//TODO
			viewPage = "addProduct.jsp";
			break;
		//제품 정보 수정
		case "/productSetting.slime":
			//TODO
			viewPage = "productSetting.jsp";
			break;
			//TODO
		}
		
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
