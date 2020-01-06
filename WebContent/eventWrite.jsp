<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.StoreDTO"%>
<%
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>이벤트 글 작성 페이지</title>
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

<script>
    $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년' 
	});

    $(function(){
        $("#day").datepicker();
    });
</script>

<body>
<h2>이벤트 글 작성</h2>
<form name="frm" action="eventWriteOk.slime?st_uid=<%= st_uid %>" method="post" onsubmit="return chkSubmit()">
제목:
<input type="text" name="subject"/><br>
내용:<br>
<textarea name="content"></textarea>
<br>
<br>
이벤트 종료 날짜 : <input type="text" name="enddate" id="day">

<br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='eventList.slime?st_uid=<%= st_uid %>'">목록으로</button>
</body>
</html>