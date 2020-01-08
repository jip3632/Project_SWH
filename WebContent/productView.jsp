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
</head>
<body>
<div id="contatiner">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header>
	</header>
	
	<div id="product_list_by_store">
<%
		// 제품 정보 
		out.println("<h3>" + arr[0].getPd_img() + "</h3>");
		out.println("<h3>" + arr[0].getPd_name() + "</h3>");
		
		//제품을 가지고 있는 스토어 정렬
		for(int i = 0; i < arr.length; i++){
			out.println("<div class='block'>");
			out.println("<div><a href='storeView.slime?st_uid=" + arr[i].getSt_uid() + "'>" + arr[i].getSt_name() + "</a></div>");
			out.println("<div class='st_img'>" + arr[i].getSt_img() + "</div>");
			out.println("<p>" + arr[i].getInv_price() + "원</p>");
			out.println("<p>" + arr[i].getInv_volume() + "ml</p>");
			out.println("<p>" + arr[i].getInv_quantity() + "EA</p>");
			out.println("</div>");
		}
	
%>			
	</div>	
	
	<footer>
	
	</footer>
</div>
</body>
</html>