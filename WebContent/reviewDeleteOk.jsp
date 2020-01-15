<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>   
<%
	int cnt = (Integer)request.getAttribute("result");
	int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
%>

<% if(cnt == 0){ %>
<script>
	alert("삭제실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "reviewListU.slime?mb_uid=<%=mb_uid%>&page=1";
</script>
<% } %>