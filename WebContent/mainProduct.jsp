<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Product Page</title>
</head>
<body>
<div id="container">
	<nav>
		<div>네비게이션 바</div>
	</nav>
	
	<header></header>
	
	<div>
		<div id="search_type">
			<button onclick="location.href='mainStore.slime'">Store</button>
			<button onclick="location.href='mainProduct.slime'">Product</button>
		</div>
		<form action="">
			<input type="search"><input type="submit">
		</form>

	</div>
	<ul id="sotre-list">
		
	</ul>
	
	<footer>
	
	</footer>
</div>
</body>
</html>