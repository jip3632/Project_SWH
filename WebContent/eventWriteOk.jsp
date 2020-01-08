<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // controller로부터 결과 받아옴
	int cnt = (Integer)request.getAttribute("result");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>

<% if(cnt == 0){%>
	<script>
		alert("등록실패!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록성공!");
		location.href = "eventList.slime?st_uid=<%= st_uid %>&page=1";
	</script>
<% } %>