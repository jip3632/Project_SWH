<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%
	MemberDTO [] marr = (MemberDTO [])request.getAttribute("mlist");
	StoreDTO [] sarr = (StoreDTO [])request.getAttribute("slist");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title>후기 글 작성하기</title>
</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms.frm;
	var subject = frm.subject.value.trim();

	if(subject == "") {
		alert("제목은 반드시 입력해야 합니다.");
		frm.subject.focus();
		return false;
	}
	
	return true;
}
</script>

<body class="is-preload">
<div id="wrapper">
	<nav id="nav" class="alt">
		<div>네비게이션 바</div>
	</nav>
	<div id="main">
	<section id="content" class="main">
<h2>후기 글 작성하기</h2>
<form name="frm" action="reviewWriteOk.slime" method="post" onsubmit="return chkSubmit()">
작성자 : <%= marr[0].getMb_id() %> <br>
<input type="hidden" name="writerName" value="<%= marr[0].getMb_uid() %>"/>
제목 :
<input type="text" name="subject"/><br>
내용 : <br>
<textarea name="content"></textarea>
<br>
매장 : <br>
<select name="store">
<% for(int i = 0; i < sarr.length; i++) { %>
  <option value="<%=sarr[i].getSt_uid() %>"><%=sarr[i].getSt_name() %></option>
<% } %>
</select>
<br>
<input type="submit" value="등록"/>
</form>
<br>
<button onclick="history.back()">이전으로</button>
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