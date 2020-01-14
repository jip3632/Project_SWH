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
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
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

<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
   	<div id="main">
	<section id="content" class="main">
<h2>이벤트 글 작성하기</h2>
<form name="frm" action="eventWriteOk.slime" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="st_uid" value='<%= st_uid %>'/>
<input type="hidden" name="enddate"/>
제목:
<input type="text" name="subject"/><br>
내용:<br>
<textarea name="content"></textarea>
<br>
<br>
이벤트 종료 날짜 : 
<input type="text" name="endday" id="day">
<br>
이벤트 종료 시간 : 
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
<br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='eventList.slime?st_uid=<%= st_uid %>&page=1'">목록으로</button>
	</section>
   	</div>
   <jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>