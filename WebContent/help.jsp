<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<title>슬라임 가이드 및 웹사이트 소개</title>

<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>


<body>

<script src="JS/help.js"></script>

<jsp:include page="/nav.jsp"></jsp:include>

<div id="wrapper">

	<jsp:include page="/header.jsp"></jsp:include>
	
   	<div id="main">

   		<section class="main special">
			<div class = "row aln-center" style="margin-bottom:10px;">
				<div class="col-5"><button id="btnHowTo" class="button large primary" style="width:100%">How to</button></div>
				<div class="col-5"><button id="btnFeedback" class="button large" style="width:100%">Ask</button></div>
			</div>
		</section>
		
		<section class="main special" id="howTo">
			<header class="major">
				<h2>슬라임이란?</h2>
			</header>
			
			<div class="row">
				<div class="col-12-small col-6">
					<h3>슬라임에 대하여</h3>
				    <ul class="alt">
					  	<li>슬라임은 만지면서 향과 촉감을 즐길 수 있는 수제 장난감입니다.</li>
					  	<li>슬라임은 14세 미만, 피부가 예민하신 분들, 임산부, 노약자에게는 추천드리지 않습니다.</li>
					  	<li>슬라임은 온도에 매우 민감하니 가급적 서늘한 곳에 보관하시면 좋습니다.</li>
					  	<li>슬라임을 만지기 전 손을 깨끗이 씻고 핸드크림을 바르신 후 플레잉하시는 것을 권장드립니다.</li>
					  	<li>슬라임의 수명은 보통 2~3주입니다. 어떻게 케어하느냐에 따라 오래 플레잉하실 수 있으니 슬라임 케어법을 꼭 숙지해주세요.</li>
				  	</ul>
				</div>
				
				<div class="col-12-small col-6">
					<h3>슬라임 케어법</h3>
				    <ul class="alt">
					  	<li>녹았을 때 : 손에 붙지 않는 농도가 될 때까지 액티베이터(Activator)를 한두방울씩 넣어주며 반죽해주세요. 손에 살짝 붙는 정도라면 핸드크림을 바르신 후 플레잉해도 무관합니다.</li>
					  	<li>굳었을 때 : 적절한 농도가 될 때까지 글리세린을 한두방울씩 넣어가며 반죽해주세요.</li>
					  	<li>액티베이터, 글리세린은 거의 모든 매장에 있습니다. 혹은 직접 약국에서 구매하셔서 만드셔도 됩니다.<br>
					   		액티베이터 제조 방법 : 약국에서 붕사를 구매하신 후 붕사가루와 물을 1:50 비율로 섞어주세요.<br>
					   		글리세린 : 약국에서 구매하실 수 있습니다.</li>
				  	</ul>
				</div>
			</div>
			<header class="major">
				<h2>사이트 소개</h2>
			</header>
			<div class="row aln-center">
				<div class="col-12-small col-10">
					<h3><b>Slime Where?house</b></h3>
				    <ul class="alt">
					  	<li>warehouse는 창고라는 뜻입니다.<br>저희 웹사이트가 전국의 모든 오프라인 매장의 슬라임 재고를 보여줌으로써 슬라임 창고의 역할을 하고 있다는 의미입니다.<br>
					   	또한 where은 어디 즉, 장소를 의미하는데 구매하실 슬라임이 있는 오프라인 매장을 찾으실 수 있다는 의미입니다.<br>
					   	ware과 where의 발음이 비슷하여 이를 합치어 저희 웹사이트의 이름이 탄생하게 되었습니다.<br>
					   	앞으로도 slime Where?house를 애용해주세요:)</li>
				  	</ul>
				</div>
				
				<div class="col-12-small col-6">
					<h3>구매자 회원</h3>
				    <ul class="alt">
					  	<li>각 오프라인 매장 별 슬라임 재고를 확인하실 수 있습니다.<br>
					  	오프라인 매장의 후기도 남길 수 있습니다.<br>
					  	마이페이지에서 작성하신 후기 목록을 확인하실 수 있습니다.<br>
					  	슬라임 찜하기 서비스, 오프라인 매장 택배 예약 서비스도 추후 업데이트될 예정입니다.</li>
				  	</ul>
				</div>
				
				<div class="col-12-small col-6">
					<h3>판매자 회원</h3>
				    <ul class="alt">
					  	<li>가입하실 때 사업자 등록증 사진을 메일로 보내주시면 가입 승인이 이루어집니다. 그 이후에 서비스를 이용하실 수 있습니다.<br>
					  	자신의 매장을 쉽게 관리하실 수 있습니다. 슬라임 재고를 한눈에 확인하실 수 있고 판매하시거나 입고되면 재고를 수정해주시면 됩니다.<br>
					  	자신의 매장에 남긴 후기들을 확인하실 수 있습니다. <br>
					  	택배 예약 목록 확인 서비스도 추후 업데이트될 예정입니다.</li>
				  	</ul>
				</div>				
			</div>
   		</section>
   		
   		<section class="main special" id="feedback" style="display:none">
			<header class="major">
				<h2>Feedback / ASK</h2>
			</header>
			
			<form id="frm" method="post" action="#">
				<div class="row aln-center">
					<div class="col-10-small col-8">
						<h4>회원 종류</h4>
						<select name="mb_type" id="mb_type" onchange="askTypeChange(this)">
							<option value="0">비회원</option>
							<option value="1">일반회원</option>
							<option value="2">매장회원</option>
						</select>
						<br>
					</div>
					
					<div class="col-10-small col-8" id="manager" style="display:none">
						<h4>관리자 문의 종류 선택</h4>
						<select name="ask_type">
							<option value="0">사이트 이용 문의</option>
							<option value="1">회원정보 문의</option>
							<option value="2">제품정보 문의</option>
							<option value="3">마켓정보 문의</option>
							<option value="4">매장관리 관련 문의</option>
							<option value="5">피드백</option>
							<option value="6">버그 제보</option>
							<option value="7">기타 문의</option>
						</select>
						<br>
					</div>
					<div class="col-10-small col-8" id="user" style="display:none">
						<h4>일반회원 / 비회원 문의 종류 선택</h4>					
						<select name="ask_type">
							<option value="0">사이트 이용 문의</option>
							<option value="1">회원 정보 문의</option>
							<option value="2">리뷰 문의</option>
							<option value="3">피드백</option>
							<option value="4">버그 제보</option>
							<option value="5">기타 문의</option>
						</select>
						<br>
					</div>
					
					<div class="col-10-small col-8">
						<h4>답장받을 email</h4>
						<input type="text" name="email"><br>
					</div>
					
					<div class="col-10-small col-8">
						<h4>제목</h4>
						<input type="text" name="subject">
						<br>
					</div>
					
					<div class="col-10-small col-8">
						<h4>내용</h4>
						<textarea name="content"></textarea>
						<br>
					</div>
					
					<div class="col-10-small col-8">
						<input type="submit" class="primary" value="보내기">
					</div>
				</div>
			</form>

   		</section>
   	
   	</div>
   	
   	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>