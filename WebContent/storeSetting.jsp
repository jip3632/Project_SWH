<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매장정보변경</title>
</head>
<body>
<article>
<%-- "매장 정보 변경"표시 --%>
<h3>매장 정보 변경</h3>
<%-- 매장 이름 표시 --%>
<div>"매장 이름"st_name</div>
<form action="storeSettingOk.slime" method="post">
	<%-- 매장 주소 표시/변경--%>
	매장주소<br>
	<input type="text" name="st_address" value="st_address"><br>
	<%-- 매장 연락처 표시/변경--%>
	매장 연락처<br>
	<input type="text" name="st_contact" value="st_contact"><br>
	<%-- 매장 영업시간 표시/변경 (input 2개 start 과 end)--%>
	매장 영업시간<br>
	<input type="text" name="st_start" value="st_start"> ~ 
	<input type="text" name="st_end" value="st_end"><br>
	<%-- 매장 설명 표시/변경--%>
	<textarea rows="10" cols="20" name="st_description">st_description</textarea><br>
	<%-- 제출 Submit --%>
	<input type="submit" value="수정">
</form>
</article>

</body>
</html>