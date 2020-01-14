<%@page import="beans.FileDTO"%>
<%@page import="beans.ProductInStoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ProductInStoreDTO[] arr = (ProductInStoreDTO[]) request.getAttribute("productList"); 
	FileDTO[] farr = (FileDTO[]) request.getAttribute("image");
	int st_uid = Integer.parseInt(request.getParameter("st_uid"));
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
<link href="CSS/main.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<title>재고관리</title>
<style>
	.spotlight .image{
		margin-left: 0;
		margin: auto;
	}
	.spotlight .image img{
		width: 10em;
	}
</style>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body class="is-preload">
<jsp:include page="/nav.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="main">
		<section id="intro" class="main special">
			<header class="major">
				<h2>재고 관리</h2>
			</header>
			<button type="button" class="button primary fit" onclick="location.href = 'addProduct.slime?st_uid=<%=st_uid%>'">재고등록</button>
		</section>
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
						out.println("<section class='main special'>");
						out.println("<header><h3>매장:<b>" + arr[i].getMk_name() + "</b></h3></header>");
						out.println("<ul class='features'>");
						
						for(int j = index; j < arr.length; j++){
							if(mk_uid != arr[j].getMk_uid()){
								index = j;
								break;
							} else{
								out.println("<li>");
								out.println("<div class='spotlight'><span class='image'><img alt='이미지' src='upload/product/"+ farr[j].getFile() +"'></span></div>");
								out.println("<h4><b>" + arr[j].getPd_name() + "</b></h4>");
								out.println("<h5>용량:" + arr[j].getInv_volume() + "ml</h5>");
								out.println("<h5>가격:" + arr[j].getInv_price() + "원</h5>");
								out.println("<h5>재고:" + arr[j].getInv_quantity() + "개</h5>");
								out.println("<a class='button primary' href='productSetting.slime?inv_uid=" + arr[j].getInv_uid() + "&st_uid=" + request.getParameter("st_uid") + "'>설정" + "</a>");
								out.println("<a class='button' onclick=\"chkDelete('" + arr[j].getPd_name() + "', '" + arr[j].getInv_uid() + "', '" + arr[j].getSt_uid() + "')\">삭제" + "</a>");
								out.println("</li>");
								if(j == arr.length - 1) index = arr.length;
							}
						}
						out.println("</ul>");
						out.println("</section>");
					}
				%>
			
	</div>
	<jsp:include page="/footer.jsp"></jsp:include>
</div>
<script src="JS/main.js"></script>
<script>
	function chkDelete(pd_name, inv_uid, st_uid){
		var r = confirm("'" + pd_name + "'을 삭제하시겠습니까?");
		if(r){
			location.href = "productDelete.slime?inv_uid=" + inv_uid + "&st_uid=" + st_uid;
		} else{
			
		}
	}

</script>
</body>
</html>