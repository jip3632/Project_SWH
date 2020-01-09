<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>  
<%
	ReviewDTO [] rarr = (ReviewDTO [])request.getAttribute("rlist");
	MemberDTO [] marr = (MemberDTO [])request.getAttribute("mlist");
	StoreDTO [] sarr = (StoreDTO [])request.getAttribute("slist");

	int re_uid = rarr[0].getRe_uid();
	String subject = rarr[0].getRe_subject();
	String content = rarr[0].getRe_content();
	int st_uid = rarr[0].getSt_uid();
	int wr_uid = rarr[0].getWr_uid();
	
	String writerName="";
	for(int j = 0; j < marr.length; j++){
		if(marr[j].getMb_uid() == wr_uid){
			writerName = marr[j].getMb_id();
		}
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 <%= subject %></title>
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

<body>
<div id="container">
   <nav>
      <div>네비게이션 바</div>
   </nav>
<h2>수정</h2>
<form name="frm" action="reviewUpdateOk.slime" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="re_uid" value="<%= re_uid %>"/>
작성자 : <%= marr[0].getMb_id() %> <br>
제목 :
<input type="text" name="subject" value="<%= subject %>"/><br>
내용 : <br>
<textarea name="content"><%= content %></textarea>
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
<button onclick="location.href = 'eventList.slime?st_uid=<%= st_uid%>&page=1'">목록보기</button>
   <footer>
   
   </footer>
</div>
</body>
</html>
