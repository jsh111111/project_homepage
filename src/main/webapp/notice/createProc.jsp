<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_notice.jsp"%>
<jsp:useBean id="dao" class="com.notice.NoticeDAO" />
<jsp:useBean id="dto" class="com.notice.NoticeDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	boolean flag = dao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 생성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
       <jsp:include page="/menu/top.jsp" />
        <div class="container">
                <div class="container p-5 my-5 border">
                        <%
                        if (flag) {
                                out.print("글 등록 성공입니다.");
                        } else {
                                out.print("글 등록 실패입니다.");
                        }
                        %>
                </div>
                <button class="btn btn-light" onclick="location.href='createForm.jsp'">다시
                        등록</button>
                <button type="button" class="btn btn-light"
                        onclick="location.href='list.jsp'">목록</button>
        </div>
</body>
</html>