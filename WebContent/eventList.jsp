<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<%  
	EventDTO [] arr = (EventDTO [])request.getAttribute("list");
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
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

<title>이벤트 목록</title>

</head>
<body class="is-preload">
<div id="wrapper">
	<nav id="nav" class="alt">
		<div>네비게이션 바</div>
	</nav>
	<div id="main">
	<section id="content" class="main">
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
		<button onclick="location.href='eventWrite.slime?st_uid=<%= st_uid %>'">새글작성</button>

<%-- 페이징 --%>
<jsp:include page="eventPagination.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>

	</section>
   	</div>
   <jsp:include page="/footer.jsp"></jsp:include>
</div>

<!-- Scripts -->
			<script src="JS/jquery.min.js"></script>
			<script src="JS/jquery.scrollex.min.js"></script>
			<script src="JS/jquery.scrolly.min.js"></script>
			<script src="JS/browser.min.js"></script>
			<script src="JS/breakpoints.min.js"></script>
			<script src="JS/util.js"></script>
			<script src="JS/main.js"></script>

</body>
</html>
