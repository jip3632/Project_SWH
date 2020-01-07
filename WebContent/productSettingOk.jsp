<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int)request.getAttribute("result");
	int st_uid = (int)request.getAttribute("st_uid");
	if(cnt == 1){
%>
		<script>
			alert("수정 성공");
			location.href = "productList.slime?st_uid=<%=st_uid%>";
		</script>
<%
	}else{
%>
		<script>
			alert("수정 실패");
			history.back();
		</script>
<%
	}
%>