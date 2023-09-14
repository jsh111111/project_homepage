<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        main {
            padding: 1rem;
            background-color: #8bd3f073;
        }

        .table {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 5px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .list a {
            color: #488bca;
            text-decoration: none;
            font-size: 2rem;
            font-family: 'Gasoek One', sans-serif;
            cursor: pointer;
        }

        .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .search-container input {
            flex-grow: 1;
            margin-right: 1rem;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-container button {
            background-color: #8bd3f0;
            color: #488bca;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 1rem;
        }

        .search-container a {
            margin-left: 1rem;
            background-color: #8bd3f0;
            color: #488bca;
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
        <div class="container mt-5">
            <h1 class="list"><a href="notice.jsp">공지사항</a></h1>
            <div class="search-container">
                <input type="text" id="searchInput" placeholder="검색어 입력">
                <label for="searchOption">옵션</label>
                <select id="searchOption">
                    <option value="title">제목</option>
                    <option value="author">작성자</option>
                </select>
                <button id="searchButton" class="btn btn-primary">검색</button>
                <a href="create_board.jsp" class="btn btn-primary create-btn">글쓰기</a>
            </div>
            
            <table class="table">
                <thead>
                    <tr class="table-primary">
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">등록일</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="board_list1.jsp" onclick="increaseViewCount(0)">설문 제목 1</a></td>
                        <td>김길동</td>
                        <td>2023-08-16</td>
                        <td><span id="viewCount0" class="view-count">0</span></td>
                    </tr>
                    <tr>
                        <td><a href="board_list2.jsp" onclick="increaseViewCount(1)">설문 제목 2</a></td>
                        <td>홍길동</td>
                        <td>2023-08-17</td>
                        <td><span id="viewCount0" class="view-count">0</span></td>
                    </tr>
                </tbody>
            </table>
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item active"><a class="page-link" href="board.jsp">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
            </ul>
        </div>
    </main>
    <section class="poll-list">
    </section>
    <jsp:include page="/menu/bottom.jsp" />
    <script>
        const searchInput = document.getElementById('searchInput');
        const searchButton = document.getElementById('searchButton');
        const tableRows = document.querySelectorAll('.table tbody tr');
        const viewCounts = [document.getElementById('viewCount0'), document.getElementById('viewCount1')];

        function handleSearch() {
            const searchTerm = searchInput.value.toLowerCase();
            const searchOption = document.getElementById('searchOption').value;
    
            tableRows.forEach((row, index) => {
                const title = row.querySelector('a').textContent.toLowerCase();
                const author = row.querySelectorAll('td')[1].textContent.toLowerCase();
    
                if ((searchOption === "title" && title.includes(searchTerm)) ||
                    (searchOption === "author" && author.includes(searchTerm))) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    
        // 검색 버튼 클릭 이벤트
        searchButton.addEventListener('click', handleSearch);
    
        // 검색창에서 Enter 키 누를 때 이벤트
        searchInput.addEventListener('keydown', (event) => {
            if (event.key === 'Enter') {
                handleSearch();
            }
        });
        

        let viewCountsData = [0, 0]; // 초기값은 0으로 설정

        // 페이지를 들어갔다 나왔을 때 조회수 증가 함수
        function increaseViewCount(index) {
            viewCountsData[index]++;
            viewCounts[index].textContent = viewCountsData[index];
        }
    </script>
</body>

</html>
