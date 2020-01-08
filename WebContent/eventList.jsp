<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%  
	EventDTO [] arr = (EventDTO [])request.getAttribute("list");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
	int page = Integer.parseInt(request.getParameter("page"));
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
	int writePages = Integer.parseInt(request.getParameter("writePages"));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

<title>이벤트 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
		<hr>
		<h2>이벤트 목록</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>종료일</th>
			</tr>		
<%
		if(arr == null || arr.length == 0){
			out.println("이벤트 글이 없습니다.");
		} else{
			for(int i = 0; i < arr.length; i++){
				out.println("<tr>");
				out.println("<td>" + arr[i].getEv_uid() + "</td>");
				out.println("<td><a href='eventView.slime?uid=" + arr[i].getEv_uid() + "'>" + arr[i].getEv_subject() + "</a></td>");
				out.println("<td>" + arr[i].getEv_end_date() + "</td>");
				out.println("</tr>");
			}
 		}
%>		
		</table>
		<br>
		<button onclick="location.href='eventWrite.slime?st_uid=<%= st_uid %>'">신규등록</button>

<%-- 페이징 --%>
<jsp:include page="pagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>

</body>
</html>
