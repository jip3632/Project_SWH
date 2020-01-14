<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>

<% 
	ReviewDTO [] rarr = (ReviewDTO [])request.getAttribute("rlist");
	StoreDTO [] sarr = (StoreDTO [])request.getAttribute("slist");
	int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
	int curPage = Integer.parseInt(request.getParameter("page"));
	int totalPage = (Integer)request.getAttribute("totalPage");
	int writePages = (Integer)request.getAttribute("writePages");
	String storeName = "";
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

<title>나의 후기 목록</title>

</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	   	<section id="content" class="main special">
	<header class="major">
		<h2>나의 후기 목록</h2>
	</header>
		<table>
			<tr>
				<th style="text-align:center;">no</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center;">매장</th>
				<th style="text-align:center;">조회수</th>
			</tr>		
<%
		if(rarr == null || rarr.length == 0){
			out.println("후기 글이 없습니다.");
		} else{
			for(int i = 0; i < rarr.length; i++){
				out.println("<tr>");
				out.println("<td>" + rarr[i].getRe_uid() + "</td>");
				out.println("<td><a href='reviewViewU.slime?re_uid=" + rarr[i].getRe_uid() + "&mb_uid=" + mb_uid + "'>" + rarr[i].getRe_subject() + "</a></td>");
				
				for(int k = 0; k < sarr.length; k++){
					if(sarr[k].getSt_uid() == rarr[i].getSt_uid()){
						storeName = sarr[k].getSt_name();
					}
				}
				out.println("<td>" + storeName + "</td>");
				out.println("<td>" + rarr[i].getRe_views() + "</td>");
				/* out.println("<td>" + rarr[i].getRe_regdate() + "</td>"); */
				out.println("</tr>");
			}
 		}
%>		
		</table>
		<br>
		<button class="button primary" onclick="location.href='reviewWrite.slime?mb_uid=<%=mb_uid%>'">신규등록</button>

<%-- 페이징 --%>
<jsp:include page="paginationU.jsp">
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
