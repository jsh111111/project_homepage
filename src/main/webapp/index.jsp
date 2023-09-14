<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSH</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
        body {
            background-image: url('images/home4.jpg');
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            margin: 0;
            padding: 20px;
        }

        .logo {
            font-family: 'Bauhaus 93', cursive;
            font-size: 5rem;
            color: #8bd3f0;
            margin-top: 20px;
            text-shadow: 5px 2px 4px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }

        .service-card {
            background-color: #8bd3f073;
            border-radius: 10px;
            box-shadow: 10px 5px 15px rgba(0, 0, 0, 0.3);
            padding: 30px;
            margin: 20px;
            margin-bottom: 200px;
            text-decoration: none;
            text-align: center;
        }

        .service-card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
        }

        .service-card img {
            max-width: 70%;
            height: auto;
            margin-bottom: 20px;
        }

        .service-title {
            font-size: 1.5rem;
            color: #000000;
            font-family: 'Gasoek One', sans-serif;
            text-decoration: none;
            text-align: center;
        }

        .service-links {
            display: none;
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .service-card:hover .service-links {
            display: block;
        }

        .service-links a {
            display: block;
            color: white;
            text-align: center;
            margin: 5px;
            text-decoration: none;
        }


        .login-button {
            position: absolute;
            top: 20px;
            right: 120px;
            background-color: #8bd3f0;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }

        .signup-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #8bd3f0;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }

        .modal-header {
            background-color: #8bd3f073;
            color: white;
        }

        .modal-body button {
            background-color: #8bd3f0;
            color: white;
            border: none;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const serviceCards = document.querySelectorAll(".service-card");
            serviceCards.forEach(card => {
                card.addEventListener("mouseenter", () => addHoverEffect(card));
                card.addEventListener("mouseleave", () => removeHoverEffect(card));
                card.addEventListener("click", () => redirectToLink(card));
            });

            const loginButton = document.querySelector(".login-button");
            const signupButton = document.querySelector(".signup-button");
            const loginModal = new bootstrap.Modal(document.getElementById("loginModal"));
            const signupModal = new bootstrap.Modal(document.getElementById("signupModal"));
            const loginSubmitButton = document.getElementById("login-mobal");
            const signupSubmitButton = document.getElementById("signup-mobal");

            loginButton.addEventListener("click", () => {
                loginModal.show();
            });
            loginSubmitButton.addEventListener("click", () => {
                const usernameInput = document.getElementById("username");
                const passwordInput = document.getElementById("password");
                const mainLoginButton = document.querySelector(".login-button");

                const username = usernameInput.value;
                const password = passwordInput.value;

                // 입력된 내용이 없으면 경고창 표시
                if (username.trim() === "") {
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "아이디를 입력하세요.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(usernameInput, popoverOptions);
                    popover.show();
                    return;
                }
        
                if (password.trim() === "") {
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "비밀번호를 입력하세요.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(passwordInput, popoverOptions);
                    popover.show();
                    return;
                }
        
                // 아이디가 'asd'이고 비밀번호가 '123'이면 메인 페이지의 로그인 버튼을 숨김
                if (username === "asd" && password === "123") {
                    // 로그인 버튼과 회원가입 버튼 숨기기
                    //$(".login-button").hide();
                    //$(".signup-button").hide();
                
                    //const loggedInInfo = document.getElementById("loggedInInfo");
                    //loggedInInfo.textContent = `안녕하세요, ${username}님!`;
                    //loggedInInfo.style.color = "green";
                    //loggedInInfo.style.display = "block"; // 아이디 출력 요소 표시
                
                    // 여기에 로그인 성공 후 메인 페이지의 다른 동작을 추가하세요
                } else if (username === "asd" && password !== "123") {
                    // 비밀번호가 틀린 경우 Popover로 메시지 표시
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "비밀번호가 올바르지 않습니다.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(passwordInput, popoverOptions);
                    popover.show();
                } else if (username !== "asd" && password === "123") {
                    // 비밀번호가 틀린 경우 Popover로 메시지 표시
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "아이디가 올바르지 않습니다.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(usernameInput, popoverOptions);
                    popover.show();
                } else {
                    // 아이디와 비밀번호가 모두 올바르지 않은 경우
                    alert("아이디와 비밀번호가 올바르지 않습니다.");
                }
            });
            signupButton.addEventListener("click", () => {
                signupModal.show();
            });
            signupSubmitButton.addEventListener("click", () => {
                const signupUsernameInput = document.getElementById("signupUsername");
                const signupPasswordInput = document.getElementById("signupPassword");
                const signupEmailInput = document.getElementById("signupEmail");
                
                // Popover 메시지 설정
                const signupUsername = signupUsernameInput.value;
                const signupPassword = signupPasswordInput.value;
                const signupEmail = signupEmailInput.value;

                // 입력된 내용이 없으면 경고창 표시
                if (signupUsername.trim() === "") {
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "아이디를 입력하세요.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(signupUsernameInput, popoverOptions);
                    popover.show();
                    return;
                }
        
                if (signupPassword.trim() === "") {
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "비밀번호를 입력하세요.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(signupPasswordInput, popoverOptions);
                    popover.show();
                    return;
                }

                if (signupEmail.trim() === "") {
                    event.preventDefault(); // 폼 전송 방지
        
                    const popoverContent = document.createElement("div");
                    popoverContent.innerHTML = "이메일를 입력하세요.";
                    popoverContent.style.color = "red";
        
                    const popoverOptions = {
                        content: popoverContent,
                        placement: "bottom",
                        trigger: "focus",
                    };
        
                    const popover = new bootstrap.Popover(signupEmailInput, popoverOptions);
                    popover.show();
                    return;
                }
            });
        });


        function addHoverEffect(card) {
            card.style.transform = "scale(1.05)";
            card.style.boxShadow = "0 10px 20px rgba(0, 0, 0, 0.4)";
        }

        function removeHoverEffect(card) {
            card.style.transform = "scale(1)";
            card.style.boxShadow = "0 5px 15px rgba(0, 0, 0, 0.3)";
        }

        function redirectToLink(card) {
            const link = card.querySelector("a");
            if (link) {
                window.location.href = link.href;
            }
        }
    </script>
</head>
<body>

	<div>
        <a href="index.jsp" class="logo">JoSH</a>
    </div>
    <div>
        <button class="login-button btn btn-info">로그인</button>
        <button class="signup-button btn btn-info">회원가입</button>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="service-card">
                            <a href="poll/poll.jsp">
                                <img src="images/vote-home.png" alt="투표">
                                <h3 class="service-title">설문</h3>
                            </a>
                            <div class="service-links">
                                <a href="poll/poll.jsp#section3">설문 생성</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="service-card">
                            <a href="bbs/list.jsp">
                                <img src="images/board-home.png" alt="게시판">
                                <h3 class="service-title">게시판</h3>
                            </a>
                            <div class="service-links">
                                <a href="bbs/createForm.jsp">게시물 생성</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="service-card">
                            <a href="notice/list.jsp">
                                <img src="images/notice-home.png" alt="공지사항">
                                <h3 class="service-title">공지사항</h3>
                            </a>
                            <div class="service-links">
                                <a href="notice/createForm.jsp">공지 생성</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="service-card">
                            <a href="game/game.jsp">
                                <img src="images/game-home.png" alt="게임">
                                <h3 class="service-title">게임</h3>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/menu/bottom.jsp"/>
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">로그인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="username" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="username" placeholder="아이디를 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
                        </div>
                        <button type="submit" class="btn btn-info" id="login-mobal">로그인</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupModalLabel">회원 가입</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="signupUsername" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="signupUsername" placeholder="아이디를 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="signupPassword" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="signupPassword" placeholder="비밀번호를 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="signupEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="signupEmail" placeholder="이메일을 입력하세요">
                        </div>
                        <button type="submit" class="btn btn-info" id="signup-mobal">회원 가입</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>