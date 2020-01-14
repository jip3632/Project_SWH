<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	ReviewDTO [] rarr = (ReviewDTO[]) request.getAttribute("rlist");
	MemberDTO [] marr = (MemberDTO[]) request.getAttribute("mlist");
	StoreDTO [] sarr = (StoreDTO[]) request.getAttribute("slist");
	int re_uid = Integer.parseInt(request.getParameter("re_uid"));
	int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
	String subject = rarr[0].getRe_subject();
	String content = rarr[0].getRe_content();
	String regdate = rarr[0].getRe_regdate();
	int st_uid = rarr[0].getSt_uid();
	int wr_uid = rarr[0].getWr_uid();
	int views = rarr[0].getRe_views();
	
	String writerName="";
	for(int j = 0; j < marr.length; j++){
		if(marr[j].getMb_uid() == wr_uid){
			writerName = marr[j].getMb_id();
		}
	}
	
	String storeName="";
	for(int k = 0; k < sarr.length; k++){
		if(sarr[k].getSt_uid() == st_uid){
			storeName = sarr[k].getSt_name();
		}
	}
	
%>

<% if(rarr == null || rarr.length == 0){ %>
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
<%
		return;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title><%= subject %></title>
</head>
<body>
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2> <%= subject %></h2>
	</header>
<div style = "text-align:left;">
<u><strong>작성자</strong></u><br> <%= writerName %><br><br>
<u><strong>작성일</strong></u><br> <%= regdate %><br><br>
<u><strong>매장명</strong></u><br> <%= storeName %><br><br>
<u><strong>조회수</strong></u><br> <%= views %><br><br>
<u><strong>내용</strong></u><br>
<div>
<%= content %>
</div>
<hr>
<br>
</div>
<button class="button primary" onclick="location.href = 'reviewUpdate.slime?re_uid=<%= re_uid %>'">수정하기</button>
<button class="button primary" onclick="chkDelete(<%= re_uid%>)">삭제하기</button>
<br><br>
<button onclick="location.href = 'reviewWrite.slime?mb_uid=<%= mb_uid %>'">신규등록</button>
<button onclick="location.href = 'reviewListU.slime?mb_uid=<%= mb_uid %>&page=1'">목록보기</button>

<br><br>
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
