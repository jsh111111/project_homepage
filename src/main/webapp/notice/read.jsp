<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi_notice.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO"/>
<%
int noticeno = Integer.parseInt(request.getParameter("noticeno"));
String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");

dao.upViewcnt(noticeno);//조회수 증가
NoticeDTO dto = dao.read(noticeno);//한개 데이터 조회
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
	url += "&noticeno=<%=noticeno%>";
	
	location.href = url;
}

function del(){
	let url = "deleteForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&noticeno=<%=noticeno%>";
	
	location.href = url;
}

function reply(){
	let url = "replyForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&noticeno=<%=noticeno%>";
	
	location.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-3">
		<h2>조회</h2>
		<ul class="list-group">
			<li class="list-group-item">작성자: <%=dto.getWname() %></li>
			<li class="list-group-item">제목: <%=dto.getTitle() %></li>
			<li class="list-group-item" style="height: 200px;overflow-y:scroll"><%=content%></li>
			<li class="list-group-item">조회수: <%=dto.getCnt() %></li>
			<li class="list-group-item">등록일: <%=dto.getRdate() %></li>
		</ul>
		<br>
		<button type="button" class="btn btn-outline-info" onclick="location='createForm.jsp'">등록</button>
		<button type="button" class="btn btn-outline-info" onclick="update()">수정</button>
		<button type="button" class="btn btn-outline-info" onclick="reply()">답변</button>
		<button type="button" class="btn btn-outline-info" onclick="del()">삭제</button>
		<button type="button" class="btn btn-outline-info" onclick="list()">목록</button>
	</div>
</body>
</html>