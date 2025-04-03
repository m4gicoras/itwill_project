<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인 페이지</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }
        /* 전체 배경 영상 */
        #bg-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
        }
        /* 로그인 영역 */
        .login-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #9ACBD0;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
        }
        .login-container .options {
            margin-top: 10px;
            font-size: 0.9em;
            text-decoration: none;
        }
        .login-container button {
            padding: 10px 20px;
            margin: 10px 5px;
        }
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        .success-message {
            color: green;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <!-- 배경 동영상 -->
    <video autoplay muted loop id="bg-video">
        <source src="${pageContext.request.contextPath}/resources/forest.mp4" type="video/mp4">
        브라우저가 비디오 태그를 지원하지 않습니다.
    </video>

    <!-- 로그인 영역 -->
    <div class="login-container">
        <!-- action URL을 "/main"으로 지정 -->
        <form id="loginForm" action="${pageContext.request.contextPath}/main" method="post">
            <h2>로그인</h2>
            <!-- 메시지를 표시할 영역 -->
            <div id="messageContainer"></div>
            <input type="text" name="username" placeholder="아이디" required /><br/>
            <input type="password" name="password" placeholder="비밀번호" required /><br/>
            <label>
                <input type="checkbox" name="rememberId" /> 아이디 저장
            </label><br/>
            <div class="options">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
            <button type="submit">로그인</button>
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/signup'">회원가입</button>
        </form>
    </div>

    <!-- JavaScript로 AJAX 요청 처리 -->
    <script>
        document.getElementById("loginForm").addEventListener("submit", function(e) {
            e.preventDefault(); // 기본 폼 제출 동작 방지

            const form = e.target;
            const formData = new FormData(form);
            const params = new URLSearchParams(formData);

            fetch(form.action, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: params.toString()
            })
            .then(response => response.json())
            .then(data => {
                // 응답 받은 메시지와 타입에 따라 메시지 컨테이너 업데이트
                const messageContainer = document.getElementById("messageContainer");
                messageContainer.innerText = data.message;
                messageContainer.className = data.messageType;
            })
            .catch(error => {
                console.error("Error:", error);
            });
        });

    </script>
</body>
</html>
