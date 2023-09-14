<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* 기본 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-image: url('../images/home4.jpg');
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

nav {
	background-color: #8bd3f073;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0.7rem;
	height: 80px;
}

nav .logo {
	font-size: 3rem;
	font-weight: bold;
	margin-left: 20px;
	font-family: 'Bauhaus 93', cursive;
	color: #488bca;
	cursor: pointer;
}

.nav-links {
	list-style: none;
	display: flex;
	justify-content: center; /* 수평 중앙 정렬 */
	gap: 80px;
	margin: 0;
	padding: 0;
	flex-grow: 1;
}

.nav-links a {
	color: #488bca;
	text-decoration: none;
	font-size: 2rem;
	font-family: 'Gasoek One', sans-serif;
}

.nav-links li {
	position: relative;
}

.sub-menu {
	display: none;
	position: absolute;
	top: 100%;
	left: 50%;
	transform: translateX(-50%);
	background-color: #8bd3f0c0;
	padding: 0;
	border-radius: 5px;
	list-style-type: none;
}

.nav-links li:hover .sub-menu {
	display: block;
}

.sub-menu a {
	display: block;
	padding: 5px 20px;
	color: #488bca;
	text-decoration: none;
	font-size: 1.5rem;
	white-space: nowrap;
}
</style>

</head>
<body>
	<nav>
		<a class="logo" href="../index.jsp">JoSH</a>
		<ul class="nav-links">
			<li><a href="../poll/poll.jsp">설문</a>
				<ul class="sub-menu">
					<li><a href="../poll/poll.jsp#section3">설문 생성</a></li>
				</ul></li>
			<li><a href="../bbs/list.jsp">게시판</a>
				<ul class="sub-menu">
					<li><a href="../bbs/createForm.jsp">게시물 생성</a></li>
				</ul></li>
			<li><a href="../notice/list.jsp">공지사항</a>
				<ul class="sub-menu">
					<li><a href="../notice/createForm.jsp">공지 생성</a></li>
				</ul></li>
			<li><a href="../game/game.jsp">게임</a></li>
		</ul>
	</nav>

</body>
</html>