<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>poll 생성</title>
<script>
	let i = 1;
	let num = 0;
	function addItem() {

		if (i > 9)
			return;

		i++;
		let sp = document.createElement('span')
		sp.className = "input-group-text";
		sp.innerText = i;
		let ele = document.createElement('input');
		ele.type = 'text';
		ele.className = "form-control";
		ele.name = "items";
		ele.id = `item${i}`;
		let items = document.getElementById('items-div');
		let dive = document.createElement('div');
		dive.className = "input-group";
		dive.appendChild(sp);
		dive.appendChild(ele);
		items.appendChild(dive);

	}

	function checkp(f) {
		if (f.question.value.length == 0) {
			alert('설문을 입력하세요');
			f.question.focus();
			return false;
		}
		if (f.sdate.value.length == 0) {
			alert('시작날짜를 선택하세요');
			f.sdate.focus();
			return false;
		}
		if (f.edate.value.length == 0) {
			alert('종료날짜를 선택하세요');
			f.edate.focus();
			return false;
		}

		if (document.querySelector('#item1').value.length == 0) {
			alert('첫번째 항목을 입력하세요');
			document.querySelector('#item1').focus();
			return false;
		}

		if (document.querySelector('#items-div').childElementCount < 1) {
			alert('항목을 1개이상 입력하세요');
			return false;
		}

	}
</script>
</head>
<body>
	<div class="container mt-3">
		<h2>설문 작성</h2>
		<form action="createProc.jsp" method="post"
			onsubmit='return checkp(this)'>
			<div class="mb-3 mt-3">
				<label for="question">설문 :</label> <input type="text"
					class="form-control" id="question" placeholder="Enter 설문"
					name="question">
			</div>
			<div class="mb-3">
				<span class="">항목들 :</span>
				<div class="input-group">
					<span class="input-group-text">1</span> <input type="text"
						class="form-control" id="item1" name="items">
					<button type="button" class="btn btn-dark" onclick="addItem()">add</button>
				</div>
				<div id="items-div"></div>
			</div>

			<!-- 시작일, 종료일, 복수 투표 -->
			<div class="input-group mb-3">
				<label class="input-group-text">시작일 :</label> <input type="date"
					name="sdate" id="sdate" class="form=control">
			</div>
			<div class="input-group mb-3">
				<label class="input-group-text">종료일 :</label> <input type="date"
					name="edate" id="edate" class="form=control">
			</div>

			<div class="input-group mb-3">
				<label class="input-group-text">복수 투표 :</label>
				<div class="form-check form-check-inline">
					<input type="radio" name="type" value="1"
						class="form-check-input m-2" id="yes" checked> <label
						class="form-check-label" for="yes">yes</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="radio" name="type" value="0"
						class="form-check-input m-2" id="no"> <label
						class="form-check-label" for="no">no</label>
				</div>
			</div>


			<div class="mb-4">
				<button class="btn btn-primary">등록</button>
				<a class="btn btn-primary" href="#section1">설문 목록</a>
			</div>
		</form>
	</div>

</body>
</html>