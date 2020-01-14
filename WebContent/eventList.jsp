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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>

<title>이벤트 목록</title>

</head>
<body>
	<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2>이벤트 목록</h2>
	</header>
		<table>
			<tr>
				<th style="text-align:center;">번호</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center;">시작일</th>
				<th style="text-align:center;">종료일</th>
			</tr>		
<%
		if(arr == null || arr.length == 0){
			out.println("이벤트 글이 없습니다.");
		} else{
			for(int i = 0; i < arr.length; i++){
				out.println("<tr>");
				out.println("<td>" + arr[i].getEv_uid() + "</td>");
				out.println("<td><a href='eventView.slime?uid=" + arr[i].getEv_uid() + "'>" + arr[i].getEv_subject() + "</a></td>");
				out.println("<td>" + arr[i].getEv_start_date() + "</td>");
				out.println("<td>" + arr[i].getEv_end_date() + "</td>");
				out.println("</tr>");
			}
 		}
%>		
		</table>
		<br>
		<button class="button primary" onclick="location.href='eventWrite.slime?st_uid=<%= st_uid %>'">새글작성</button>

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
