<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (Integer) request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("등록 실패!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("매장 등록 성공, 관리자의 승인을 기다려 주세요!");
		location.href = "mainProduct.slime";
	</script>
	
<% } %>