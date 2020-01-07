<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>   
<%
	int cnt = (int) request.getAttribute("result");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>

<% if(cnt == 0){ %>
<script>
	alert("삭제실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "eventList.slime?st_uid=<%= st_uid%>&page=1";
</script>
<% } %>