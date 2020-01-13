<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//out.println("------ session.invalidate() 후 ------<br>");	
	// 기존 세션 테이블을 삭제후 새로 생성... 세션 ID 새로 발급
	//session.invalidate();
	///* 테스트
	//String sessionId = session.getId();
	//int sessionInterval = session.getMaxInactiveInterval();
	//String result = (String)request.getAttribute("result");
	
	//int login = (Integer)session.getAttribute("login");
	//int mb_uid = (Integer)session.getAttribute("mb_uid");
	//int mb_type = (Integer)session.getAttribute("mb_type");
	//MemberDTO dto = (MemberDTO)session.getAttribute("mb");
	//out.println(dto.getMb_id());
	
	//out.println("세션 ID : " + sessionId + "<br>");
	//out.println("세션 유효시간 : " + sessionInterval + "<br>");
	
	//if(request.isRequestedSessionIdValid()){
    //	out.println("유효한 세션 있습니다.");
    //	out.println(result);
    //	out.println(login);
    //	out.println(mb_uid);
    //	out.println(mb_type);
    //}else{
    //	out.println("유효한 세션이 없습니다.");
    //}
%>
<%
	if (session.getAttribute("login") != null) {
		// 로그인 성공
		if ((Integer)session.getAttribute("mb_type") == 1) {
		%>
		<script>
			location.href='userPage.slime?mb_uid=${mb_uid }';
			//location.href='mainStore.slime';
		</script>
		<%
		} else if ((Integer)session.getAttribute("mb_type") == 2) {
		%>
		<script>
			location.href='managerPage.slime?mb_uid=${mb_uid }';
			//location.href='mainStore.slime';
		</script>
		<%
		} else if ((Integer)session.getAttribute("my_type") == 0) {
		%>	
		<script>
			alert("가입 대기중입니다.");
			location.href='mainStore.slime';
		</script>
		<%
		}
	} else {
		// 로그인 실패
%>
	<script>
		location.href='login.slime?existId=${existId }';
	</script>
<%	
	}
%>
