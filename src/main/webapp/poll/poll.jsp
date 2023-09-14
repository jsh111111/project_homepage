<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>poll</title>
<style>
#section1:target {
	background-color: rgb(40, 98, 100);
	color: beige;
}

#section2:target {
	background-color: rgb(77, 77, 69);
	color: rgb(248, 248, 237);
}

#section3:target {
	background-color: burlywood;
}

/* 하단 네비게이션 바 스타일 */
.fixed-bottom {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: #000;
	color: #fff;
	padding: 3px;
	z-index: 1000;
}

.fixed-bottom ul {
	display: flex;
	justify-content: space-around;
	padding: 0;
	list-style: none;
}

.fixed-bottom .nav-item {
	margin: 10px;
}

.fixed-bottom .nav-link {
	color: #fff !important;
	font-size: 20px;
	text-decoration: none !important;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="mt-5" data-bs-spy="scroll" data-bs-target=".navbar"
		data-bs-offset="50">

		<!-- 하단 네비게이션 바 추가 -->
		<nav class="navbar navbar-expand-sm fixed-bottom">
			<div>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#section1">설문
							목록</a></li>
					<li class="nav-item"><a class="nav-link" href="#section2">설문
							정보</a></li>
					<li class="nav-item"><a class="nav-link" href="#section3">설문
							등록</a></li>
				</ul>
			</div>
		</nav>

		<div id="section1" class="container-fluid pt-2 pb-2">
			<jsp:include page="/poll/list.jsp" />
		</div>

		<div id="section2" class="container-fluid pt-2 pb-2">
			<jsp:include page="/poll/pollitem.jsp" />
		</div>

		<div id="section3" class="container-fluid pt-2 pb-5 mb-5">
			<jsp:include page="/poll/pollcreate.jsp" />
			<p />
		</div>

	</div>

</body>
</html>
