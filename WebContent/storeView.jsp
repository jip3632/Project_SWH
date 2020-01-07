<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="contatiner">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header>
		<div>${storeInfo[0].st_name }</div>
		<div>${storeInfo[0].st_contact }</div>
		<div>${storeInfo[0].st_hours }</div>
		<div>전화아이콘</div>
	</header>
	
	<article>
		<div id="eventList">
			<div>이벤트 리스트</div>
			<ul>
			<c:forEach var="event" items="${eventList }">
				<li>
					<div>${event.ev_subject }</div>
					<div>${event.ev_content }</div>
					<div>${event.ev_end_date }</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div id="stAddr">
			${storeInfo[0].st_address }
			<div>지도 아이콘</div>
		</div>
		
		<ul id="slimeList">
		<li id="listSubject">판매중인 슬라임</li>
		<c:set var="currentMk" value="0"/>
		<c:forEach var="mk" items="${productList }">
			<c:if test="${mk.mk_uid != currentMk }">
			<c:set var="currentMk" value="${mk.mk_uid }"/>
			<li>
				<div class="mkInfo">
					<div class="mkImg">${mk.mk_logo } 로고</div>					
					<div class="mkName">${mk.mk_name }</div>					
					<div class="mkInsta">${mk.mk_insta }</div>					
				</div>
				<ul class="pdList">
				<c:forEach var="pd" items="${productList }">
					<c:if test="${pd.mk_uid == currentMk }">
					<li class="pdInfo" onclick="location.href='productView.slime?pd_uid=${pd.pd_uid }'">
						<div class="pdImg">${pd.pd_img } 제품이미지</div>
						<div class="pdName">${pd.pd_name }</div>
						<div class="pdQuantity">${pd.inv_quantity }</div>
						<div class="pdVolume">${pd.inv_volume }</div>
						<div class="pdPrice">${pd.inv_price }</div>
					</li>
					</c:if>
				</c:forEach><!-- forEach end -->
				</ul>
			</li>
			</c:if>
		</c:forEach><!-- forEach end -->
		</ul> 
	</article>
	
	<footer>
	
	</footer>
</div>

</body>
</html>