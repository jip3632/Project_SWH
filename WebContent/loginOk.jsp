<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.MemberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%



%>
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
	MemberDTO dto = (MemberDTO)session.getAttribute("mb");
	out.println(dto.getMb_id());
	
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
