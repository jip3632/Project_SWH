<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer) request.getAttribute("result");
	int re_uid = (Integer) request.getAttribute("re_uid");
	int mb_uid = (Integer) request.getAttribute("mb_uid");
%>

<% if(cnt == 0){ %>
<script>
	alert("수정실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("수정성공");
	location.href = "reviewViewU.slime?re_uid=<%=re_uid%>&mb_uid=<%=mb_uid%>";
</script>
<% } %>