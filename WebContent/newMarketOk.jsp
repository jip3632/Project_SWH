<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% int st_uid = (int)request.getAttribute("st_uid"); %>
<c:choose>
<c:when test="${result == 0}">
<script>
	alert("등록 실패!");
	location.href = "productList.slime?st_uid=<%=st_uid%>";
</script>
</c:when>
<c:otherwise>
<script>
	alert("마켓 등록 성공");
	location.href = "productList.slime?st_uid=<%=st_uid%>";
</script>
</c:otherwise>
</c:choose>