<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int)request.getAttribute("result");
%>

<%
	if(cnt == 0){
%>
		<script>alert("매장 정보 수정 실패");</script>
<%
	} else{
%>
		<script>alert("정보 수정 성공");</script>
<%
	}
%>
	<script>
	location.href = "managerPage.slime?mb_uid=<%=request.getParameter("mb_uid")%>";
	</script>