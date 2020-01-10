<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int)request.getAttribute("result");
	int st_uid = (int)request.getAttribute("st_uid");
	if(cnt == 2){
%>
	<script>
		alert("업데이트 성공");
		location.href = "productList.slime?st_uid=<%=st_uid%>";
	</script>	
<%		
	} else if (cnt == 1){
%>
	<script>
		alert("추가 성공");
		location.href = "productList.slime?st_uid=<%=st_uid%>";
	</script>	
<%		
		
	} else{
%>
	<script>
		alert("재고 추가 실패");
		location.href = "productList.slime?st_uid=<%=st_uid%>";
	</script>	
<%
	}
%>