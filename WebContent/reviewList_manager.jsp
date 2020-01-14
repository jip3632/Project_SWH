<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="beans.*"%>

<%  
	ReviewDTO [] rarr = (ReviewDTO [])request.getAttribute("rlist");
	MemberDTO [] marr = (MemberDTO [])request.getAttribute("mlist");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
	int curPage = Integer.parseInt(request.getParameter("page"));
	int totalPage = (Integer)request.getAttribute("totalPage");
	int writePages = (Integer)request.getAttribute("writePages");
	String writerName="";
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

<title>${slist[0].st_name } 후기 목록</title>

</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2>${slist[0].st_name } 후기 목록</h2>
	</header>
		<table>
			<tr>
				<th style="text-align:center;">no</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center;">작성자</th>
				<th style="text-align:center;">view</th>
			</tr>		
<%
		if(rarr == null || rarr.length == 0){
			out.println("후기 글이 없습니다.");
		} else{
			for(int i = 0; i < rarr.length; i++){
				out.println("<tr>");
				out.println("<td>" + rarr[i].getRe_uid() + "</td>");
				out.println("<td><a href='reviewViewM.slime?re_uid=" + rarr[i].getRe_uid() + "'>" + rarr[i].getRe_subject() + "</a></td>");
				for(int j = 0; j < marr.length; j++){
					if(marr[j].getMb_uid() == rarr[i].getWr_uid()){
						writerName = marr[j].getMb_id();
					}
				}
				out.println("<td>" + writerName + "</td>");
				out.println("<td>" + rarr[i].getRe_views() + "</td>");
/* 				out.println("<td>" + rarr[i].getRe_regdate() + "</td>"); */
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
		<div class="row">
		<c:choose>
			<c:when test="${mb_type == 1 }">
				<div class="off-4-small col-4-small off-8 col-2">
					<button class="button" style="width:100%" onclick="history.back()">이전페이지</button>	
				</div>
				<div class="col-4-small col-2">
					<button class="button primary" style="width:100%" onclick="location.href='reviewWrite.slime?mb_uid=${mb_uid }'">리뷰 작성</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="off-8-small col-4-small off-10 col-2">
					<button class="button" style="width:100%" onclick="history.back()">이전페이지</button>	
				</div>
			</c:otherwise>
		</c:choose>
		</div>
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
