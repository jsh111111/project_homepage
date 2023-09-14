<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<jsp:useBean id="dto" class="com.bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
Map map = new HashMap();
map.put("grpno", dto.getGrpno());
map.put("ansnum", dto.getAnsnum());
 
dao.upAnsnum(map);
boolean flag = dao.createReply(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답변처리</title>
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=request.getParameter("nowPage")%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href = url;
}
</script>
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
        <div class="container p-5 my-2 border">
                <%
                if (flag) {
                        out.print("글 답변 성공입니다.");
                } else {
                        out.print("글 답변 실패입니다.");
                }
                %>
        </div>
        <button class="btn btn-primary" onclick="location.href='createForm.jsp'">다시
                등록</button>
        <button type="button" class="btn btn-primary"
                onclick="list()">목록</button>
</div></main>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>