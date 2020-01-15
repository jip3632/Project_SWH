<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="CSS/nav.css" rel="stylesheet" type="text/css">
<script src="JS/jquery.min.js"></script>
<script src="JS/browser.min.js"></script>
<script src="JS/breakpoints.min.js"></script>
<script src="JS/nav.js"></script>

<!--
<nav>
	<button onclick="location.href='mainStore.slime'">홈버튼</button>
	<c:choose>
		<c:when test="${login == null }">
			<button onclick="location.href='login.slime'">로그인 버튼</button>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${mb_type == 1 }">
					<button onclick="location.href='userPage.slime?mb_uid=${mb_uid }'">마이페이지</button>
				</c:when>
				<c:when test="${mb_type == 2 }">
					<button onclick="location.href='managerPage.slime?mb_uid=${mb_uid }'">매장관리</button>
				</c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='reviewList_everyone.slime'">리뷰</button>
	<button onclick=''>고객센터</button>
</nav>
-->
<!-- Header -->
<div id="navsmall">
	<div id="header">
		<div class="inner">

			<!-- Nav -->
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>

		</div>
	</div>

<!-- Menu -->
	<nav id="menu">
		<h2 style = "padding: 20px">Menu</h2>
		<ul>
			<li style = "padding: 10px"><a href='mainStore.slime'>Home</a></li>
			<c:choose>
				<c:when test="${login == null }">
					<li style = "padding: 10px"><a href='login.slime'>Login</a></li>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${mb_type == 1 }">
							<li style = "padding: 10px"><a href='userPage.slime?mb_uid=${mb_uid }'>MyPage</a></li>
						</c:when>
						<c:when test="${mb_type == 2 }">
							<li style = "padding: 10px"><a href='managerPage.slime?mb_uid=${mb_uid }'>ManagementPage</a></li>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<li style = "padding: 10px"><a href='reviewListE.slime?page=1'>Review</a></li>
			<li style = "padding: 10px"><a href='help.slime'>Help</a></li>
		</ul>
	</nav>
</div>