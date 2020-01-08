<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<% // dao 사용한 트랜젝션
	ProductInStoreDTO [] arr = (ProductInStoreDTO [] )request.getAttribute("product_list_by_store");
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
	
	<ul id="product_list_by_store">
<%--
		for(int i = 0; i < arr.length; i++){
			out.println("<li>");
			out.println("<div class='st_img'>" + "<img src='" + list[i].st_img + "'></img>" + "</div>");
			out.println("<td><a href='view.do?uid=" + arr[i].getUid() + "'>" + arr[i].getSubject() + "</a></td>");
			out.println("<td>" + arr[i].getName() + "</td>");
			out.println("<td>" + arr[i].getViewcnt() + "</td>");
			out.println("<td>" + arr[i].getRegDate() + "</td>");
			out.println("</li>");
		}
	
--%>
			
	</ul>	
	
	<footer>
	
	</footer>
</div>
</body>
</html>