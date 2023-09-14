<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp"%>
<jsp:useBean id="service" class="com.poll.PollService" />
<%
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));

if (col.equals("total")) {
	word = "";
}

int nowPage = 1;
if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int recordPerPage = 5;
int sno = ((nowPage - 1) * recordPerPage);
//int eno = 5;
Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", recordPerPage);

Vector<PollDTO> list = service.getList(map);
//Iterator<PollDTO> iter = list.iterator();
int total = service.total(col, word);
String url = "poll.jsp";

String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<title>설문 목록</title>
<style>
.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.table {
    background-color: rgba(255, 255, 255, 0.7);
    border-radius: 10px;
    padding: 1rem;
    margin: 1rem auto;
}

.search-container input {
    flex-grow: 1;
    margin-left: 1rem;
    padding: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 90%;
}

.search-container button {
    background-color: #8bd3f0;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    cursor: pointer;
}
</style>
<script type="text/javascript">
    function read(num) {
        let url = "poll.jsp";
        url += "?num=" + num;
        location.href = url + "#section2";
    }
</script>
</head>
<body>
    <div class="container mt-3">
        <h2>설문 목록</h2>
<!--         <div class="search-container"> -->
            <form action="poll.jsp#select1" class="">
                <div class="row">
                    <div class="col-sm-3">
                        <select class="form-select" name="col">
                            <option value="question" <%=col.equals("question") ? "selected" : ""%>>제목</option>
                            <option value="sdate" <%=col.equals("sdate") ? "selected" : ""%>>시작일</option>
                            <option value="edate" <%=col.equals("edate") ? "selected" : ""%>>종료일</option>
                            <option value="total" <%=col.equals("total") ? "selected" : ""%>>전체</option>
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <input type="search" class="form-control" placeholder="검색어 입력" name="word" id="searchInput">
                    </div>
                    <div class="col-sm-3">
                        <button id="searchButton" class="btn btn-primary">검색</button>
                    </div>
                </div>
            </form>
<!--         </div> -->
        <table class="table">
            <thead>
                <tr class="table-primary">
                    <th>번호</th>
                    <th>제목</th>
                    <th>시작일 ~ 종료일</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (list.size() == 0) {
                %>
                <tr>
                    <td colspan="4">등록된 설문이 없습니다.</td>
                </tr>
                <%
                } else {
                for (int i = 0; i < list.size(); i++) {
                    PollDTO dto = list.get(i);
                    LocalDate now = LocalDate.now();
                    LocalDate edate_ = LocalDate.parse(dto.getEdate());
                    
                    
                %>
                <tr>
                    <td><%=dto.getNum()%></td>
                    <td><a href="javascript:read('<%=dto.getNum()%>')" action="poll.jsp#select2" > <%=dto.getQuestion()%></a></td>
                    <td><%=dto.getSdate()%> ~ <%=dto.getEdate()%></td>

                    <%
                    if (now.isAfter(edate_)) {
                    %>
                    <td><span class="badge bg-danger">종료</span></td>
                    <%
                    } else {
                    %>
                    <td><span class="badge bg-success">진행 중</span></td>
                    <%
                    }
                    %>

                </tr>
                <%
                } //for
                } //if
                %>
            </tbody>
        </table>
        <%=paging%>
    </div>
</body>
</html>
