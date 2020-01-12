<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (Integer) request.getAttribute("result");
	String id = request.getParameter("user_id");
%>

<% if(cnt == 0){ %>
	<script>
		alert("등록 실패!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록 성공, 회원 가입을 환영합니다!");
		location.href = "SignUpStore.slime?mb_id=<%=id%>";
	</script>
	
<% } %>