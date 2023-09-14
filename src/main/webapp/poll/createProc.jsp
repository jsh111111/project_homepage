<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi_poll.jsp"%>
<jsp:useBean id="service" class="com.poll.PollService" />
<jsp:useBean id="dto" class="com.poll.PollDTO" />
<jsp:setProperty name="dto" property="*" />
<jsp:useBean id="idto" class="com.poll.PollitemDTO" />
<jsp:setProperty name="idto" property="*" />
<%

boolean flag = service.create(dto, idto);
String msg = "설문 등록 실패";
if (flag) {
	msg = "설문 등록 성공";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    alert('<%=msg%>');
	location.href = 'poll.jsp#section1';
</script>
</head>
<body>

</body>
</html>