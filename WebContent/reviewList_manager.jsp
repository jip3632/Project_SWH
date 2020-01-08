<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%  
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
	int curPage = Integer.parseInt(request.getParameter("page"));
	int totalPage = (Integer)request.getAttribute("totalPage");
	int writePages = (Integer)request.getAttribute("writePages");
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
		<h2>후기 목록</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>		
<%
		if(arr == null || arr.length == 0){
			out.println("후기 글이 없습니다.");
		} else{
			for(int i = 0; i < arr.length; i++){
				out.println("<tr>");
				out.println("<td>" + arr[i].getRe_uid() + "</td>");
				out.println("<td><a href='reviewView.slime?uid=" + arr[i].getRe_uid() + "'>" + arr[i].getRe_subject() + "</a></td>");
				out.println("<td>" + arr[i].getWr_uid() + "</td>");
				out.println("<td>" + arr[i].getRe_regdate() + "</td>");
				out.println("</tr>");
			}
 		}
%>		
		</table>
		<br>

<%-- 페이징 --%>
<jsp:include page="paginationM.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>

</body>
</html>
