<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	ReviewDTO [] rarr = (ReviewDTO[]) request.getAttribute("rlist");
	MemberDTO [] marr = (MemberDTO[]) request.getAttribute("mlist");
	StoreDTO [] sarr = (StoreDTO[]) request.getAttribute("slist");
	int re_uid = Integer.parseInt(request.getParameter("re_uid"));
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
<title><%= subject %></title>
</head>
<body>
<div id="container">
   <nav>
      <div>네비게이션 바</div>
   </nav>
<h2>읽기 <%= subject %></h2>
<br>
제목 : <%= subject %><br>
작성자 : <%= writerName %><br>
작성일 : <%= regdate %><br>
매장명 : <%= storeName %><br>
조회수 : <%= views %><br>
내용: <br>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<button onclick="location.href = 'reviewListM.slime?st_uid=<%= st_uid%>&page=1'">목록보기</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <footer>
   
   </footer>
</div>
</body>
</html>
