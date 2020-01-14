<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="beans.*" %>
<%
	EventDTO [] arr = (EventDTO[]) request.getAttribute("list");
%>

<% if(arr == null || arr.length == 0){ %>
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
<%
		return;
	}
%>
<%
	int uid = arr[0].getEv_uid();
	String subject = arr[0].getEv_subject();
	String content = arr[0].getEv_content();
	String startdate = arr[0].getEv_start_date();
	String enddate = arr[0].getEv_end_date();
	int st_uid = arr[0].getSt_uid();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title><%= subject %></title>
</head>
<script>
function chkDelete(uid, st_uid){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'eventDeleteOk.slime?uid=' + uid +'&st_uid=' + st_uid;
	}
	
}
</script>
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
<u><strong>이벤트 시작 시각</strong></u><br>
<%= startdate %><br><br>
<u><strong>이벤트 종료 시각</strong></u><br>
<%= enddate %><br><br>
<u><strong>내용</strong></u><br>
<%= content %>
</div>
<hr>
<br>
<c:choose>
<c:when test="${mb_type == 1 }">
<button class="button primary" onclick="location.href = 'eventUpdate.slime?uid=<%= uid%>'">수정하기</button>
<button class="button primary" onclick="chkDelete(<%= uid%>, <%= st_uid%>)">삭제하기</button>
<br><br>
<button onclick="location.href = 'eventWrite.slime?st_uid=<%= st_uid%>'">새글작성</button>
</c:when>
</c:choose>
<button onclick="location.href = 'eventList.slime?st_uid=<%= st_uid%>&page=1'">목록보기</button>

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
