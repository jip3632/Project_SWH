<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<% // dao 사용한 트랜젝션
	ProductEveryStoreDTO [] arr = (ProductEveryStoreDTO [] )request.getAttribute("product_list_by_store");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Product View</title>
<link href="CSS/main.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/02846aab38.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
	<jsp:include page="/nav.jsp"></jsp:include>

	<div id="wrapper">
		<jsp:include page="/header.jsp"></jsp:include>		
		<div id="main">
				<section id="intro" class="main">
					<div class="spotlight">
						<div class="content">
							<header class="major">
								<%out.println("<h2>" + arr[0].getPd_name() + "</h2>");%>
							</header>
							<%out.println("<p>" + arr[0].getPd_description() + "</p>");%>
						</div>
						<%out.println("<span class='image'><img src='upload/product/" + arr[0].getPd_img() + "'alt=''/></span>"); %>
					</div>
				</section>
				
				<section id="first" class="main special">
					<ul class="features">
						<%
						for(int i=0; i<arr.length; i++){
							out.println("<li>");
							out.println("<div class='spotlight'>");
							out.println("<span class='image'><img src='upload/offstore/" + arr[i].getSt_img() + "'alt='' style='width:7em;'/></span>");
							out.println("</div>");
							out.println("<h3><a href='storeView.slime?st_uid=" + arr[i].getSt_uid() +"'>" + arr[i].getSt_name() +"</a></h3>");
							out.println("<p style='margin:0'>재고: " +arr[i].getInv_quantity() + "개</p>");
							out.println("<p style='margin:0'>용량: "+arr[i].getInv_volume() + "ml</p>");
							out.println("<p style='margin:0'>가격: " + arr[i].getInv_price() + "원</p>");
							out.println("</li>");
						}
						%>
					</ul>
				</section>
			<div id="product_list_by_store">
			
			
			</div>			
		</div>

	
		<jsp:include page="/footer.jsp"></jsp:include>
	</div>
	<script src="JS/main.js"></script>
	
</body>
</html>