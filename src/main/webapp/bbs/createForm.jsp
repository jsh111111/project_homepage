<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 생성</title>
<meta charset="utf-8">
<style>
main {
    font-family: 'Gasoek One', sans-serif;
    font-size: 25px;
	padding: 1rem;
	background-color: #8bd3f073;
	margin-top: 100px;
}
.container button {
    background-color: #8bd3f0;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<main>
		<div class="container mt-4">
			<h2>게시물 생성</h2>
			<form action="createProc.jsp" method="post">

				<div class="mb-3 mt-3">
					<label for="wname">이름:</label> <input type="text"
						class="form-control" id="wname" placeholder="Enter wname"
						name="wname">
				</div>
				<div class="mb-3 mt-3">
					<label for="title">제목:</label> <input type="text"
						class="form-control" id="title" placeholder="Enter title"
						name="title">
				</div>
				<div class="mb-3 mt-3">
					<label for="content">내용:</label>
					<textarea class="form-control" rows="5" id="content" name="content"></textarea>
				</div>
				<div class="mb-3 mt-3">
					<label for="pw">비밀번호:</label> <input type="password"
						class="form-control" id="passwd" placeholder="Enter passwd"
						name="passwd">
				</div>

				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
	
	<jsp:include page="/menu/bottom.jsp" />
	</main>
</body>
</html>