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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	.spotlight .image{
		margin-left: 0;
		margin: auto;
	}
	.spotlight .image img{
		width: 10em;
	}
	.clickable:hover {
		cursor:pointer;
		border-radius:10%;
		border:1px solid pink;
	}
</style>
</head>
<body class="is-preload">

<script src="JS/storeView.js"></script>

<jsp:include page="nav.jsp"></jsp:include>

<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="main">
		<jsp:include page="/nav_swp.jsp"></jsp:include>
		<section id="cta" class="main">
			<header class="major special">
				<h2>매장 정보</h2>
			</header>
		</section>
		<section id="intro" class="main">
			<div class="row aln-center">
				<div class="spotlight col-12-small col-10">
					<div class="content">
						<header class="majer">
							<h3>매장: ${storeInfo[0].st_name }</h3>
						</header>
						<div class="clickable" onclick="getMap('${storeInfo[0].st_address }')">
						주소: ${storeInfo[0].st_address }<br>
						<span class="icon">KaKaoMap<i class="fas fa-map-marked-alt"></i></span>
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
				<div class="col-10-small col-5"><button class="button primary" onclick="location.href='reviewListM.slime?st_uid=${storeInfo[0].st_uid }&page=1'" style="width:100%">매장 리뷰 보기</button></div>
			</div>
		</section>
		
		<section class="main special">
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

		
		<c:forEach var="mk" items="${productList }">
			<c:if test="${mk.mk_uid != currentMk }">
			<c:set var="currentMk" value="${mk.mk_uid }"/>
			<section class='main special'>
				<header><h3>마켓 : <b>${mk.mk_name }</b></h3></header>
				
				<ul class="features">
					<c:forEach var="pd" items="${productList }">
					<c:if test="${pd.mk_uid == currentMk }">
					<li class="clickable" onclick="location.href='productView.slime?pd_uid=${pd.pd_uid }'">
						<div class='spotlight'><span class='image'><img src='upload/product/${pd.pd_img}'></span></div>
						<h4><b>${pd.pd_name }</b></h4>
						<h5>용량 : ${pd.inv_volume }ml</h5>
						<h5>가격 : ${pd.inv_price }원</h5>
						<h5>재고 : ${pd.inv_quantity }개</h5>
					</li>
					</c:if>
				</c:forEach><!-- forEach end -->
				</ul>
			</section>
			</c:if>
		</c:forEach>
		
		
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</div>
	<script src="JS/main.js"></script>
</body>
</html>