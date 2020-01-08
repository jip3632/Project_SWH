<%@page import="beans.FileDTO"%>
<%@page import="beans.ProductInStoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ProductInStoreDTO[] arr = (ProductInStoreDTO[]) request.getAttribute("productList"); 
	FileDTO[] farr = (FileDTO[]) request.getAttribute("image");
%>
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
	
 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>제품관리</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>

<article>
	<h3>제품 관리</h3>
	<button type="button" onclick="location.href = 'addProduct.slime'">제품등록</button>
	<div id="markets">
		<%--
		<div>
			<h3>mk_name</h3>
			<ul>
				<li>
					<img alt="이미지" src="">
					<h4>pd_name</h4>
					<div>용량</div>
					<div>가격</div>
					<div>재고</div>
					
					<a href="productSetting.slime?inv_uid=<%=inv_uid%>">설정</a>
					<a href="productDelete.slime?inv_uid=<%=inv_uid%>">삭제</a>
				</li>
			</ul>
		</div>
		 --%>
			<%
			int index = 0;
				for(int i = 0; i < arr.length; i = index){
					int mk_uid = arr[i].getMk_uid(); //마켓 고유번호
					out.println("<div>");
					out.println("<h3>" + arr[i].getMk_name() + "</h3>");
					out.println("<ul>");
					
					for(int j = index; j < arr.length; j++){
						if(mk_uid != arr[j].getMk_uid()){
							index = j;
							break;
						} else{
							out.println("<li>");
							out.println("<img alt='이미지' src='upload/product/"+ farr[j].getFile() +"'>");
							out.println("<h4>" + arr[j].getPd_name() + "</h4>");
							out.println("<div>용량:" + arr[j].getInv_volume() + "ml</div>");
							out.println("<div>가격:" + arr[j].getInv_price() + "원</div>");
							out.println("<div>재고:" + arr[j].getInv_quantity() + "개</div>");
							out.println("<a href='productSetting.slime?inv_uid=" + arr[j].getInv_uid() + "&st_uid=" + request.getParameter("st_uid") + "'>설정" + "</a>");
							out.println("<a href='productDelete.slime?inv_uid=" + arr[j].getInv_uid() + "'>삭제" + "</a>");
							out.println("</li>");
							if(j == arr.length - 1) index = arr.length;
						}
					}
					out.println("</ul>");
					out.println("</div>");
				}
			%>
	</div>
	
</article>
</body>
</html>