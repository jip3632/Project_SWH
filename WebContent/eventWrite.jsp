<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title>이벤트 글 작성하기</title>
</head>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms.frm;
	var subject = frm.subject.value.trim();
	
	var endday = frm.endday.value.trim();
	var endtime = frm.endtime.value;
	
	frm.enddate.value = endday + " " + endtime;
	
	var startday = frm.startday.value.trim();
	var starttime = frm.starttime.value;
	
	frm.startdate.value = startday + " " + starttime;

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
    dateFormat: 'yy-mm',
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
  $("#datepicker1, #datepicker2").datepicker();
});
</script>

<body>
<div id="wrapper">
<jsp:include page="/header.jsp"></jsp:include>
   	<div id="main">
	<section id="content" class="main special">
	<header class="major">
		<h2>이벤트 글 작성하기</h2>
	</header>
<form name="frm" action="eventWriteOk.slime" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="st_uid" value='<%= st_uid %>'/>
<input type="hidden" name="enddate"/>
<input type="hidden" name="startdate"/>
<div style="text-align:left;">
<u><strong>제목</strong></u><br>
<input type="text" name="subject"/><br>
<u><strong>내용</strong></u><br>
<textarea name="content"></textarea>
<br>
<u><strong>이벤트 시작 날짜</strong></u><br>
<input type="text" name="startday" id="datepicker1">
<br>
<u><strong>이벤트 시작 시간</strong></u><br>
<select name="starttime">
  <option value="00:00" selected>00:00</option>
  <option value="01:00">01:00</option>
  <option value="02:00">02:00</option>
  <option value="03:00">03:00</option>
  <option value="04:00">04:00</option>
  <option value="05:00">05:00</option>
  <option value="06:00">06:00</option>
  <option value="07:00">07:00</option>
  <option value="08:00">08:00</option>
  <option value="09:00">09:00</option>
  <option value="10:00">10:00</option>
  <option value="11:00">11:00</option>
  <option value="12:00">12:00</option>
  <option value="13:00">13:00</option>
  <option value="14:00">14:00</option>
  <option value="15:00">15:00</option>
  <option value="16:00">16:00</option>
  <option value="17:00">17:00</option>
  <option value="18:00">18:00</option>
  <option value="19:00">19:00</option>
  <option value="20:00">20:00</option>
  <option value="21:00">21:00</option>
  <option value="22:00">22:00</option>
  <option value="23:00">23:00</option>
</select>
<br>
<u><strong>이벤트 종료 날짜</strong></u><br>
<input type="text" name="endday" id="datepicker2">
<br>
<u><strong>이벤트 종료 시간</strong></u><br>
<select name="endtime">
  <option value="00:00" selected>00:00</option>
  <option value="01:00">01:00</option>
  <option value="02:00">02:00</option>
  <option value="03:00">03:00</option>
  <option value="04:00">04:00</option>
  <option value="05:00">05:00</option>
  <option value="06:00">06:00</option>
  <option value="07:00">07:00</option>
  <option value="08:00">08:00</option>
  <option value="09:00">09:00</option>
  <option value="10:00">10:00</option>
  <option value="11:00">11:00</option>
  <option value="12:00">12:00</option>
  <option value="13:00">13:00</option>
  <option value="14:00">14:00</option>
  <option value="15:00">15:00</option>
  <option value="16:00">16:00</option>
  <option value="17:00">17:00</option>
  <option value="18:00">18:00</option>
  <option value="19:00">19:00</option>
  <option value="20:00">20:00</option>
  <option value="21:00">21:00</option>
  <option value="22:00">22:00</option>
  <option value="23:00">23:00</option>
</select>
</div>
<br>
<button type="submit" class="button primary">등록</button>
</form>
<br>
<button type="button" onclick="location.href='eventList.slime?st_uid=<%= st_uid %>&page=1'">목록으로</button>
	</section>
   	</div>
   <jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>