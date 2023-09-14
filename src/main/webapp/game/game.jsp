<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지뢰찾기</title>
<style>
main {
            padding: 1rem;
            background-color: #8bd3f073;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

table {
	border-collapse: collapse;
}

td {
	border: 1px solid #bbb;
	text-align: center;
	line-height: 20px;
	width: 20px;
	height: 20px;
	background: #888;
}

td.opened {
	background: white;
}

td.flag {
	background: red;
}

td.question {
	background: orange;
}
</style>
<script>
const $form = document.querySelector("#form");
const $timer = document.querySelector("#timer");
const $tbody = document.querySelector("#table tbody");
const $result = document.querySelector("#result");
let row; // 줄
let cell; // 칸
let mine; //지뢰
const CODE = {
    NORMAL: -1, // 닫힌 칸(지뢰 없음)
    QUESTION: -2, //?
    FLAG: -3, //!
    QUESTION_MINE: -4, //?(지뢰있음)
    FLAG_MINE: -5, //!(지뢰있음)
    MINE: -6, //지뢰
    OPENED: 0, // 0 이상이면 모두 열린 칸
};
let data; //4 * 4 표에 반영될 데이터 (CODE 값)
let openCount = 0;
let startTime;
let interval;

function onSubmit(event) {
    event.preventDefault();
    row = parseInt(event.target.row.value);
    cell = parseInt(event.target.cell.value);
    mine = parseInt(event.target.mine.value);
    openCount = 0;
    clearInterval(interval);
    $tbody.innerHTML = "";
    drawTable(); //표 그리기
    startTime = new Date();
    interval = setInterval(() => {
        // 현재 시간의 초를 1초마다 업데이트해서 화면에 보여준다.
        const time = Math.floor((new Date() - startTime) / 1000);
        $timer.textContent = `${time}초`;
    }, 1000);
}
$form.addEventListener("submit", onSubmit);

//표 그리기
function drawTable() {
    data = plantMine(); //표의 값(닫힌값:-1, 지뢰값:-6)을 가져온다.
    data.forEach((row) => {
        //row수 만큼 tr생성
        const $tr = document.createElement("tr");
        row.forEach((cell) => {
            //cell수 만큼 td생성
            const $td = document.createElement("td");
            if (cell === CODE.MINE) {
                $td.textContent = "X"; // 개발 편의를 위해
            }
            $tr.append($td);
        });
        $tbody.append($tr);
        //버블링 이벤트 설정
        $tbody.addEventListener("click", onLeftClick);
        $tbody.addEventListener("contextmenu", onRightClick);
    });
}

//닫힌칸:-1, 지뢰칸: -6
function plantMine() {
    //행 * 열 개수의 배열생성 -> 0부터 채워진다.
    const candidate = Array(row * cell)
        .fill()
        .map((arr, i) => {
            return i;
        });
    const shuffle = [];
    //candidate 배열에서 무작위로 섞은 10개의 요소값을 shuffle배열에 담는다.(지뢰값만들기위해)
    while (candidate.length > row * cell - mine) {
        const chosen = candidate.splice(
            Math.floor(Math.random() * candidate.length),
            1
        )[0];
        shuffle.push(chosen);
    }

    //전체 행 * 열 개수 만큼 data에 CODE.NORMAL(-1,닫힌 칸)값 생성.
    const data = [];
    for (let i = 0; i < row; i++) {
        const rowData = [];
        data.push(rowData);
        for (let j = 0; j < cell; j++) {
            rowData.push(CODE.NORMAL);
        }
    }

    //-1를 가지고 있는 data배열에 무작위로 shuffle배열을 이용해서 CODE.MINE(-6, 지뢰)값 생성
    for (let k = 0; k < shuffle.length; k++) {
        const ver = Math.floor(shuffle[k] / cell);
        const hor = shuffle[k] % cell;
        data[ver][hor] = CODE.MINE;
    }
    return data;
}

// 표 클릭 했을때 처리
function onLeftClick(event) {
    const target = event.target; // td
    const rowIndex = target.parentNode.rowIndex; //행의 위치(인덱스)
    const cellIndex = target.cellIndex; //열의 위치(인덱스)
    const cellData = data[rowIndex][cellIndex];
    if (cellData === CODE.NORMAL) {
        // 닫힌 칸이면 => 처리 로직 분기된다
        openAround(rowIndex, cellIndex);
    } else if (cellData === CODE.MINE) {
        // 지뢰 칸이면 => 게임 종료
        target.textContent = "펑";
        target.className = "opened";
        clearInterval(interval);

        $tbody.removeEventListener("contextmenu", onRightClick);
        $tbody.removeEventListener("click", onLeftClick);
    }
}

//닫힌 칸 , 분기 처리 (주변지뢰갯수 0과 0아닐경우), 재귀함수 호출
function openAround(rI, cI) {
    setTimeout(() => {
        const count = open(rI, cI); //주변 지뢰개수, 화면에 출력
        if (count === 0) {
            //주변 지뢰개수 0이면  주변8개의 칸을 오픈한다.
            openAround(rI - 1, cI - 1);
            openAround(rI - 1, cI);
            openAround(rI - 1, cI + 1);
            openAround(rI, cI - 1);
            openAround(rI, cI + 1);
            openAround(rI + 1, cI - 1);
            openAround(rI + 1, cI);
            openAround(rI + 1, cI + 1);
        }
    }, 0);
}

function open(rowIndex, cellIndex) {
    //(undefined >= 10) => false 리턴
    if (data[rowIndex]?.[cellIndex] >= CODE.OPENED) return;
    const target = $tbody.children[rowIndex]?.children[cellIndex]; //rowIndex <= 0, rowIndex >=9  오류방지
    if (!target) {
        return;
    }
    const count = countMine(rowIndex, cellIndex); //지뢰개수
    target.textContent = count || ""; //화면에 주변 지뢰 개수 출력
    target.className = "opened";
    data[rowIndex][cellIndex] = count;
    openCount++; //칸의 오픈 누적
    console.log(openCount);
    //지뢰없는 칸이 모드 오픈 되었을경우 승리
    if (openCount === row * cell - mine) {
        const time = (new Date() - startTime) / 1000;
        clearInterval(interval); //1초마다 업데이트 해서 화면 출력하는 부분 해지
        $tbody.removeEventListener("contextmenu", onRightClick);
        $tbody.removeEventListener("click", onLeftClick);
        setTimeout(() => {
            alert(`승리했습니다! ${time}초가 걸렸습니다.`);
        }, 500);
    }
    return count;
}

function countMine(rowIndex, cellIndex) {
    //주변(8개)의 지뢰 갯수 확인
    const mines = [CODE.MINE, CODE.QUESTION_MINE, CODE.FLAG_MINE];
    let i = 0;
    mines.includes(data[rowIndex - 1]?.[cellIndex - 1]) && i++;
    mines.includes(data[rowIndex - 1]?.[cellIndex]) && i++;
    mines.includes(data[rowIndex - 1]?.[cellIndex + 1]) && i++;
    mines.includes(data[rowIndex][cellIndex - 1]) && i++;
    mines.includes(data[rowIndex][cellIndex + 1]) && i++;
    mines.includes(data[rowIndex + 1]?.[cellIndex - 1]) && i++;
    mines.includes(data[rowIndex + 1]?.[cellIndex]) && i++;
    mines.includes(data[rowIndex + 1]?.[cellIndex + 1]) && i++;
    return i;
}

//우클릭 했을 경우
function onRightClick(event) {
    event.preventDefault(); //우클릭하면 메뉴창이 뜨는 기본동작을 없앤다.
    const target = event.target;
    const rowIndex = target.parentNode.rowIndex;
    const cellIndex = target.cellIndex;
    const cellData = data[rowIndex][cellIndex];
    if (cellData === CODE.MINE) {
        // 지뢰면
        data[rowIndex][cellIndex] = CODE.QUESTION_MINE; // 물음표 지뢰로
        target.className = "question";
        target.textContent = "?";
    } else if (cellData === CODE.QUESTION_MINE) {
        // 물음표 지뢰면
        data[rowIndex][cellIndex] = CODE.FLAG_MINE; // 깃발 지뢰로
        target.className = "flag";
        target.textContent = "!";
    } else if (cellData === CODE.FLAG_MINE) {
        // 깃발 지뢰면
        data[rowIndex][cellIndex] = CODE.MINE; // 닫힌 지뢰로
        target.className = "";
        target.textContent = "";
    } else if (cellData === CODE.NORMAL) {
        // 닫힌 칸이면
        data[rowIndex][cellIndex] = CODE.QUESTION; // 물음표로
        target.className = "question";
        target.textContent = "?";
    } else if (cellData === CODE.QUESTION) {
        // 물음표면
        data[rowIndex][cellIndex] = CODE.FLAG; // 깃발으로
        target.className = "flag";
        target.textContent = "!";
    } else if (cellData === CODE.FLAG) {
        // 깃발이면
        data[rowIndex][cellIndex] = CODE.NORMAL; // 닫힌 칸으로
        target.className = "";
        target.textContent = "";
    }
} 
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<main>
	<form id="form" method="post">
		<input placeholder="가로 줄" id="row" name="row" size="10" />
		<!-- name 추가 -->
		<input placeholder="세로 줄" id="cell" name="cell" size="10" />
		<!-- name 추가 -->
		<input placeholder="지뢰" id="mine" name="mine" size="10" />
		<!-- name 추가 -->
		<button type="submit">생성</button>
		<!-- type 및 버튼 수정 -->
	</form>
	<div id="timer">0초</div>
	<table id="table">
		<tbody></tbody>
	</table>
	<div id="result"></div>
	</main>
	</div><jsp:include page="/menu/bottom.jsp" />
</body>
</html>
