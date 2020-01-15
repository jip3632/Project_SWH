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
	} else if(cnt == -1){
%>
		<script>alert("매장 정보 수정 실패");</script>
		<script>alert("이미지 파일만 업로드 가능합니다.");</script>
<%
	} else{
%>
		<script>alert("정보 수정 성공");</script>
<%
	}
%>
	<script>
	location.href = "managerPage.slime?mb_uid=<%=request.getAttribute("mb_uid")%>";
	</script>