<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>매장 관리</title>
</head>
<body>

<article>
	<%-- TODO 매장사진, 매장명, 주소, 연락처, 이메일, 영업시간 표시 
	SL_offstore 테이블에서 
	st_img, st_name, st_address, st_contact, st_email, st_hours 
	가져오기 --%>
	
	<%-- 매장정보 변경 버튼 --%>
	<button onclick="location.href = 'storeSetting.slime'">매장 정보 변경</button>
	<%-- 제품관리 버튼 --%>
	<button onclick="location.href = 'productList.slime'">제품 관리</button>
	<%-- 이벤트 관리 버튼--%>
	<button onclick="location.href = 'eventList.slime'">이벤트 관리</button>
	<%-- 후기 관리 버튼--%>
	<button onclick="location.href = 'reviewList.slime'">후기 관리</button>
</article>
</body>
</html>