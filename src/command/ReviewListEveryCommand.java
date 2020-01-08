package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReviewListEveryCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO [] rarr = null;
		MemberDAO mdao = new MemberDAO();
		MemberDTO [] marr = null;
		SearchDAO sdao = new SearchDAO();
		StoreDTO [] sarr = null;
		
		// 페이징 관련 세팅 값들
		int page = 1; // 현재 페이지 (디폴트 1 page)
		int writePages = 10; // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
		int pageRows = 10; // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
		int totalPage = 0; // 총 몇 '페이지' 분량인가?
		int cnt = 0; // 글은 총 몇개인가?
		
		// 현재 몇 페이지?
		String param = request.getParameter("page");
		if(param != null && !param.trim().equals("")) {
			try {
				page = Integer.parseInt(param);
			}catch(NumberFormatException e) {
				// 별도의 처리는 안함
			}
		}
		
		try {
			// 글 전체 개수 구하기
			cnt = rdao.countAll();
			
			// 총 몇페이지 분량인가?
			totalPage = (int)Math.ceil(cnt / (double)pageRows);
			
			// 몇번재 row 부터?
			int fromRow = (page - 1) * pageRows;  // MySQL 은 0 부터 시작 !
			
			rdao = new ReviewDAO();
			
			rarr = rdao.selectFromRow(fromRow, pageRows);
			marr = mdao.selectAllMembers();
			sarr = sdao.selectAllStores();
			
			request.setAttribute("rlist", rarr);
			request.setAttribute("mlist", marr);
			request.setAttribute("slist", sarr);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}