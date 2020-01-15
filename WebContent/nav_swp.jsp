<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="CSS/main.css" rel="stylesheet" type="text/css">
<script src="JS/jquery.min.js"></script>
<script src="JS/browser.min.js"></script>
<script src="JS/breakpoints.min.js"></script>
<script src="JS/nav_swp.js"></script>


<!-- Menu -->
	<nav id="nav" class="">
		<ul>
			<li><a href="mainStore.slime">Home</a></li>
			<c:choose>
				<c:when test="${login == null }">
					<li><a href='login.slime'>Login</a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${mb_type == 1 }">
							<li><a href='userPage.slime?mb_uid=${mb_uid }'>MyPage</a></li>
						</c:when>
						<c:when test="${mb_type == 2 }">
							<li><a href='managerPage.slime?mb_uid=${mb_uid }'>ManagementPage</a></li>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<li><a href="reviewListE.slime?page=1">Review</a></li>
			<li><a href="help.slime">Help</a></li>
		</ul>
	</nav>