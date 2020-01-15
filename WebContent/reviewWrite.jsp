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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="ckeditor/ckeditor.js"></script>
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
	<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
	<jsp:include page="/nav_swp.jsp"></jsp:include>
	<section id="content" class="main special">
	<header class="major">
		<h2>후기 글 작성하기</h2>
	</header>
<form name="frm" action="reviewWriteOk.slime" method="post" onsubmit="return chkSubmit()">
<div style="text-align:left;">
<u><strong>작성자</strong></u><br> <%= marr[0].getMb_id() %> <br><br>
<input type="hidden" name="writerName" value="<%= marr[0].getMb_uid() %>"/>
<u><strong>제목</strong></u><br>
<input type="text" name="subject"/><br>
<u><strong>내용</strong></u><br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,  // HTML 태그 자동삭제 방지 설정
		filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload.slime'
	});
</script>
<br>
<u><strong>매장</strong></u><br>
<select name="store">
<% for(int i = 0; i < sarr.length; i++) { %>
  <option value="<%=sarr[i].getSt_uid() %>"><%=sarr[i].getSt_name() %></option>
<% } %>
</select>
<br>
</div>
<button type="submit" class="button primary">등록</button>
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