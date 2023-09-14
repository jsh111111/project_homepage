<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="com.bbs.BbsDAO" />
<jsp:useBean id="dto" class="com.bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
Map map = new HashMap();
map.put("bbsno", dto.getBbsno());
map.put("passwd", dto.getPasswd());

boolean flag = false;
boolean pflag = dao.passCheck(map);
if (pflag) {
	flag = dao.delete(dto.getBbsno());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제</title>
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=request.getParameter("nowPage")%>";
	url += "&col=<%=request.getParameter("col")%>";
	
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
         if(!pflag){
             out.print("잘못된 비밀번호 입니다.");
           }else if(flag){
             out.print("글 삭제를 성공했습니다.");
           }else{
           out.print("글 삭제를 실패했습니다.");
           }
         
        %>
</div>
<%
if (!pflag) {
%>
<button class="btn btn-primary" onclick="history.back()">다시시도</button>
<%
}
%>
<button class="btn btn-primary" onclick="location.href='createForm.jsp'">다시
        등록</button>
<button type="button" class="btn btn-primary"
        onclick="list()">목록</button>
</div></main>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>