<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%  
	EventDTO [] arr = (EventDTO [])request.getAttribute("list");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
</body>
</html>
