<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>SWH ${storeInfo[0].st_name }</title>

<link href="CSS/main.css" rel="stylesheet" type="text/css">

</head>
<body>

<jsp:include page="nav.jsp"></jsp:include>

<div id="wrapper">
	
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		
		<section id="intro" class="main">
			<div class="spotlight">
				<div class="content">
					<header class="majer">
						<h3>매장: ${storeInfo[0].st_name }</h3>
					</header>
					<div>
					주소: ${storeInfo[0].st_address }
					</div>
					<div>
					연락처: ${storeInfo[0].st_contact }
					</div>
					<div>
					영업시간: ${storeInfo[0].st_hours }
					</div>
				</div>
				<span class="image">
					<img src="upload/offstore/${storeInfo[0].st_img }" alt="${storeInfo[0].st_img }"/>
				</span>
			</div>
		</section>
		
		<section class="main">
			<header class="major"><h2>진행중인 이벤트</h2></header>
			<div class="table-wrapper">
				<table>
					<thead>
						<tr>
							<th style="width:60%; text-align:center;">이벤트 내용</th>
							<th style="text-align:center;">이벤트 종료일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${fn:length(eventList) == 0}">
							<tr>
								<th colspan="2">진행중인 이벤트가 없습니다.</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="event" items="${eventList }">
								<tr>
									<td style="width:60%; text-align:center;">${event.ev_content }</td>
									<td style="text-align:center;">~${event.ev_end_date }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</section>

		<section class="main">
			
			<header class="major"><h2>판매중인 슬라임</h2></header>
			<div id="slimeList" class="features">
			<c:set var="currentMk" value="0"/>
			
			<c:forEach var="mk" items="${productList }">
				<c:if test="${mk.mk_uid != currentMk }">
				<c:set var="currentMk" value="${mk.mk_uid }"/>
					<div class="row mkInfo">
						<span class="image left"><img src="upload/market/${mk.mk_logo }" alt="" /></span>					
						<div class="mkName"><h3>${mk.mk_name }</h3></div>					
						<div class="mkInsta">${mk.mk_insta }</div>					
					</div>
					<ul class="pdList features alt">
					<c:forEach var="pd" items="${productList }">
						<c:if test="${pd.mk_uid == currentMk }">
						<li class="pdInfo" onclick="location.href='productView.slime?pd_uid=${pd.pd_uid }'">
							<div class="row gtr-uniform">
								<span class="image left"><img src="upload/product/${pd.pd_img }" alt="" /></span>
								<div class="col-8 pdName">${pd.pd_name }</div>
								<div class="col-8 pdQuantity">재고 : ${pd.inv_quantity }</div>
								<div class="col-8 pdVolume">용량 : ${pd.inv_volume }</div>
								<div class="col-8 pdPrice">가격 : ${pd.inv_price }</div>
							</div>
						</li>
						</c:if>
					</c:forEach><!-- forEach end -->
					</ul>
				</c:if>
			</c:forEach><!-- forEach end -->
			</div>
		</section>
		
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>