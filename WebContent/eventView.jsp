<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	EventDTO [] arr = (EventDTO[]) request.getAttribute("view");
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
	String enddate = arr[0].getEv_end_date();
	int st_uid = arr[0].getSt_uid();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
<h2>읽기 <%= subject %></h2>
<br>
제목 : <%= subject %><br>
이벤트 종료 : <%= enddate %><br>
내용: <br>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<button onclick="location.href = 'eventUpdate.slime?uid=<%= uid%>'">수정하기</button>
<button onclick="location.href = 'eventList.slime?st_uid=<%= st_uid%>&page=1'">목록보기</button>
<button onclick="chkDelete(<%= uid%>, <%= st_uid%>)">삭제하기</button>
<button onclick="location.href = 'eventWrite.slime?st_uid=<%= st_uid%>'">신규등록</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
