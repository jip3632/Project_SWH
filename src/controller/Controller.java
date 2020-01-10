package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;


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
			new ManagerPageCommand().execute(request, response);
			viewPage = "managerPage.jsp";
			break;
		//메인 상점 검색
		case "/mainStore.slime":
			viewPage = "mainStore.jsp";
			break;
		//상점 선택 결과
		case "/storeView.slime":
			new StoreViewCommand().execute(request, response);
			viewPage = "storeView.jsp";
			break;
		//메인 제품 검색
		case "/mainProduct.slime":
			viewPage = "mainProduct.jsp";
			break;
		//제품 선택 결과
		case "/productView.slime":
			new ProductViewCommand().execute(request, response);
			viewPage = "productView.jsp";
			break;		
		//매장 정보 변경
		case "/storeSetting.slime":
			new ManagerPageCommand().execute(request, response); //매장관리페이지와 동일한 데이터를 가져오기때문에 Command재사용
			viewPage = "storeSetting.jsp";
			break;
		//매자 정보 변경 확인
		case "/storeSettingOk.slime":
			new StoreSettingOkCommand().execute(request, response);
			viewPage = "storeSettingOk.jsp";
			break;
		//제품 관리
		case "/productList.slime":
			new StoreViewCommand().execute(request, response);
			new ProductImageCommand().execute(request, response);
			viewPage = "productList.jsp";
			break;
		//제품 등록
		case "/addProduct.slime":
			new AddProductCommand().execute(request, response);
			viewPage = "addProduct.jsp";
			break;
		//제품 정보 수정
		case "/addProductOk.slime":
			//TODO
			viewPage = "addProductOk.jsp";
			break;
		case "/productSetting.slime":
			new ProductSettingCommand().execute(request, response);
			viewPage = "productSetting.jsp";
			break;
		case "/productSettingOk.slime":
			new ProductSettingOkCommand().execute(request, response);
			viewPage = "productSettingOk.jsp";
			break;
		//이벤트 목록
		case "/eventList.slime":
			new EventListCommand().execute(request, response);
			viewPage = "eventList.jsp";
			break;
		//이벤트 작성
		case "/eventWrite.slime":
			viewPage = "eventWrite.jsp";
			break;
		//이벤트 작성 확인
		case "/eventWriteOk.slime":
			new EventWriteCommand().execute(request, response);
			viewPage = "eventWriteOk.jsp";
			break;
		//이벤트 글 보기
		case "/eventView.slime":
			new EventViewCommand().execute(request, response);
			viewPage = "eventView.jsp";
			break;
		//이벤트 글 수정
		case "/eventUpdate.slime":
			new EventUpdateCommand().execute(request, response);
			viewPage = "eventUpdate.jsp";
			break;
		//이벤트 글 수정 확인
		case "/eventUpdateOk.slime":
			new EventUpdateOkCommand().execute(request, response);
			viewPage = "eventUpdateOk.jsp";
			break;
		//이벤트 글 삭제
		case "/eventDeleteOk.slime":
			new EventDeleteCommand().execute(request, response);
			viewPage = "eventDeleteOk.jsp";
			break;
		//후기 목록(매장)
		case "/reviewListM.slime":
			new ReviewListManagerCommand().execute(request, response);
			viewPage = "reviewList_manager.jsp";
			break;
		//후기 목록(회원)
		case "/reviewListU.slime":
			new ReviewListUserCommand().execute(request, response);
			viewPage = "reviewList_user.jsp";
			break;
		//후기 목록(전체)
		case "/reviewListE.slime":
			new ReviewListEveryCommand().execute(request, response);
			viewPage = "reviewList_everyone.jsp";
			break;
		//후기 작성하기
		case "/reviewWrite.slime":
			new ReviewWriteCommand().execute(request, response);
			viewPage = "reviewWrite.jsp";
			break;
		//후기 작성하기 확인
		case "/reviewWriteOk.slime":
			new ReviewWriteOkCommand().execute(request, response);
			viewPage = "reviewWriteOk.jsp";
			break;
		//후기 글 보기
		case "/reviewView.slime":
			new ReviewViewCommand().execute(request, response);
			viewPage = "reviewView.jsp";
			break;
		//후기 글 보기(회원)
		case "/reviewView2.slime":
			new ReviewViewCommand().execute(request, response);
			viewPage = "reviewView2.jsp";
			break;
		//후기 글 보기(회원)
		case "/reviewView3.slime":
			new ReviewViewCommand().execute(request, response);
			viewPage = "reviewView3.jsp";
			break;
		//후기 글 수정
		case "/reviewUpdate.slime":
			new ReviewUpdateCommand().execute(request, response);
			viewPage = "reviewUpdate.jsp";
			break;
		//후기 글 수정 확인
		case "/reviewUpdateOk.slime":
			new ReviewUpdateOkCommand().execute(request, response);
			viewPage = "reviewUpdateOk.jsp";
			break;
		//후기 글 삭제
		case "/reviewDeleteOk.slime":
			new ReviewDeleteCommand().execute(request, response);
			viewPage = "reviewDeleteOk.jsp";
			break;
		//로그인 페이지
		case "/login.slime":
			viewPage = "login.jsp";
			break;
		// 로그인 OK
		case "/loginOk.slime":
			new LoginOkCommand().execute(request, response);
			viewPage = "loginOk.jsp";
			break;
		//회원 마이페이지
		case "/userPage.slime":
			new UserPageCommand().execute(request, response);
			viewPage = "userPage.jsp";
			break;
		//회원 정보 변경
		case "/memberSetting.slime":
			new MemberSettingCommand().execute(request, response);
			viewPage = "memberSetting.jsp";
			break;
		//회원 정보 변경 확인
		case "/memberSettingOk.slime":
			new MemberSettingOkCommand().execute(request, response);
			viewPage = "memberSettingOk.jsp";
			break;
		//회원 정보 변경 확인
		case "/help.slime":
			viewPage = "help.jsp";
			break;
		//ID/PW찾기
		case "/findAccount.slime":
			viewPage = "findAccount.jsp";
			break;
		//ID/PW결과
		case "/findAccountResult.slime":
			new FindAccountCommand().execute(request, response);
			viewPage = "findAccountResult.jsp";
			break;
		}

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
