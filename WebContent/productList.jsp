<%@page import="beans.ProductInStoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ProductInStoreDTO[] arr = (ProductInStoreDTO[]) request.getAttribute("productList"); %>
<%--
	for문 각 마켓
	<ul>
		for문 각 제품별
		<li>
		
		</li>
		
		<li><a href="productSetting.slime">수정버튼</a></li>
		<li><a href="productDelete.slime">삭제버튼</a></li>
	
	</ul>
	-----------------------option 1-----------------------
	int index = 0;
	for(int i = 0; i < set.size(); i=index){
		out.println("<ul>");
		
		for(int j = index ; j < length; j++){
			index++
			if (
		}
		
		out.println("</ul>");
	}
	---------------------option 2--------------------------
	HashSet <int> set = new HashSet<int>();
	
	for(int i = 0; i < arr.length; i++){
		if(!set.exist(arr[i].getMk_uid)){
			set.add(arr[i].getMk_uid); //mk_uid
		}
	}
	
	for(int i = 0; i < set.size(); i++){
		int mk_uid = set.value(i);
		for(int j = 0; j < arr.length; j++){
			if(arr[i].getMk_uid == mk_uid){
				
			}
		}
	}
	///실험
	
 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>제품관리</title>
</head>
<body>

<article>
	<h3>제품 관리</h3>
	<button onclick="">제품등록</button>
	<%-- 마켓마다 div로 묶음 --%>
	<%-- 각 마켓마다 제품 div로 묶음 --%>
	<%-- 각 제품안에 제품정보(제품 사진, 제품명, 용량, 가격, 재고) + 제품정보수정 버튼 + 제품 삭제 버튼 --%>
	
</article>
</body>
</html>