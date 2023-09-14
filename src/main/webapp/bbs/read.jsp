<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO"/>
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");

dao.upViewcnt(bbsno);//조회수 증가
BbsDTO dto = dao.read(bbsno);//한개 데이터 조회
String content = dto.getContent().replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	
	location.href = url;
}

function update(){
	let url = "updateForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href = url;
}

function del(){
	let url = "deleteForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href = url;
}

function reply(){
	let url = "replyForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";
	
	location.href = url;
}
</script>
<style>
main {
	padding: 1rem;
	background-color: #8bd3f073;
	margin-top: 100px;
}

.container li{
	font-family: 'Gasoek One', sans-serif;
    font-size: 15px;
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
		<h2>조회</h2>
		<ul class="list-group">
			<li class="list-group-item">작성자: <%=dto.getWname() %></li>
			<li class="list-group-item">제목: <%=dto.getTitle() %></li>
			<li class="list-group-item" style="height: 200px;overflow-y:scroll"><%=content%></li>
			<li class="list-group-item">조회수: <%=dto.getViewcnt() %></li>
			<li class="list-group-item">등록일: <%=dto.getWdate() %></li>
		</ul>
		<br>
		<button type="button" class="btn btn-primary" onclick="location='createForm.jsp'">등록</button>
		<button type="button" class="btn btn-primary" onclick="update()">수정</button>
		<button type="button" class="btn btn-primary" onclick="reply()">답변</button>
		<button type="button" class="btn btn-primary" onclick="del()">삭제</button>
		<button type="button" class="btn btn-primary" onclick="list()">목록</button>
	</div></main>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>