<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
<style type="text/css">
#red {
	color: red;
}
</style>
<style>
main {
	font-family: 'Gasoek One', sans-serif;
	font-size: 25px;
	padding: 1rem;
	background-color: #8bd3f073;
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
	<div class="container mt-3">
		<h2>게시물 삭제</h2>
		<p id='red'>삭제하면 복구할 수 없습니다</p>
		<form action="deleteProc.jsp" method="post">
			<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
			<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
			<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
			<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
			<div class="row">
				<div class="col">
					<input type="password" class="form-control"
						placeholder="Enter password" name="passwd" required>
				</div>
				<div class="col">
					<button class="btn btn-primary">삭제</button>
				</div>
			</div>
		</form>
	</div></main><jsp:include page="/menu/bottom.jsp" />
</body>
</html>