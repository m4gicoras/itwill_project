<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    overflow: hidden;
    font-family: 'Noto Sans KR', sans-serif;
}

video {
    position: fixed;
    top: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
    object-fit: cover;
    z-index: -1;
}

#main-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
}

header {
    padding: 1em 2em;
    color: white;
    font-size: 1.5em;
    font-weight: bold;
}

.logo {
    font-family: 'Open Sans', sans-serif;
    font-size: 2em;
    color: #FF6600;
}

#main-content {
    flex: 1;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 5%;
}

#left-info {
    color: white;
    width: 50%;
}

#left-info h1 {
    font-size: 2.8em;
    margin-bottom: 0.4em;
}

#left-info p {
    font-size: 1.2em;
    line-height: 1.7em;
}

/* 우측 로그인 박스 */
#right-login {
    display: flex;
    justify-content: center;
    align-items: center;
    background: rgba(255, 255, 255, 0.85);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
    width: 330px;
    height: auto;
    transition: all 0.3s ease;
    flex-direction: column;
}

#right-login h2 {
    margin: 10px 0 20px;
    font-family: 'Open Sans', sans-serif;
    font-size: 1.7em;
    font-weight: 600;
   	font-style: italic;
    color: #FF6600;
    text-align: center;
}

/* 입력창. 입력시 폰트는 아직 안함 */
#right-login input[type="text"],
#right-login input[type="password"] {
    padding: 10px;
    margin-top: 10px;
    width: 100%;
    font-size: 1em;
    font-weight: 430;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
}

.pw-wrapper {
    position: relative;
    width: 100%;
}

/* 비번창 기준으로 */
.pw-wrapper .pw-toggle {
    position: absolute;
    right: 11px;
    top: 60%;
    transform: translateY(-50%);
    font-size: 1em;
    cursor: pointer;
    opacity: 0.7;
}

.options {
    width: 100%;
    text-align: right;
    margin-top: 11px;
}

.options a {
    text-decoration: none;
    font-size: 0.76em;
    font-weight: 650;
    font-style: italic;
    color: #444;
    opacity: 0.9;
}

/* 입력오류시 보여줄거 */
.pw-wrapper .error {
    position: absolute;
    bottom: -18px;
    left: 2px;
    font-size: 0.8em;
    color: red;
    margin: 0;
}

.checkbox-wrap {
    display: flex;
    justify-content: flex-start;
    gap: 10px;
    font-size: 0.88em;
    margin: 7px 0 11px 0;
}

/* 로그인 회원가입 버튼 */
#right-login button[type="submit"] {
    background-color: #ff6600;
    color: white;
    border: none;
    padding: 11px;
    font-size: 1em;
    border-radius: 6px;
    width: 100%;
    cursor: pointer;
    transition: background 0.2s ease;
}

#right-login button[type="submit"]:hover {
    background-color: #e05500;
}

#right-login .signup-btn {
    background-color: #c2d0da;
    color: black;
    border: none;
    padding: 11px;
    font-size: 1em;
    border-radius: 6px;
    width: 100%;
    cursor: pointer;
    transition: background 0.2s ease;
}

#right-login .signup-btn:hover {
    background-color: #aebec9;
}

.btn-row {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    width: 100%;
    margin: 10px 0 20px 0;
}

.btn-row button {
    flex: 1;
}


/* 소셜 파트 */
#right-login .social-login {
    text-align: center;
}

#right-login .social-login i {
    margin: 0 8px;
    cursor: pointer;
    opacity: 0.85;
    transition: transform 0.2s ease;
}

#right-login .social-login i:hover {
    transform: scale(1.1);
}

.social-login {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
}

.social-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 10px;
    border: none;
    border-radius: 6px;
    font-size: 0.95em;
    font-weight: 500;
    cursor: pointer;
    width: 100%;
    transition: background 0.2s ease;
}

.social-btn.google {
    background-color: #ffffff;
    color: #4285F4;
    border: 1px solid #ddd;
}

.social-btn.google:hover {
    background-color: #f2f2f2;
}

.social-btn.github {
    background-color: #333;
    color: white;
}

.social-btn.github:hover {
    background-color: #222;
}

.social-btn i {
    font-size: 1.2em;
}
/* 소셜 파트 끝 */

</style>

</head>
<body>

<c:url var="videoPath" value="/resources/videos/citybg.mp4" />
<video autoplay muted loop>
    <source src="${videoPath}" type="video/mp4">
    브라우저가 비디오 태그를 지원하지 않습니다.
</video>

<div id="main-container">
	<!-- 상단 메뉴 추가될 수 있어서 헤더로 해둠 -->
    <header>
        <div class="logo">Sellity</div>
    </header>


    <div id="main-content">
        <!-- 왼쪽 설명 -->
        <div id="left-info">
            <h1>WMS플랫폼, 셀리티</h1>
            <p>재고 관리를 스마트하게.<br>비즈니스의 시작은 셀리티와 함께 하세요.</p>
        </div>

        <!-- 오른쪽 로그인폼 -->
        <div id="right-login">
        	<c:url var="loginAction" value="/main" />
			<form action="${loginAction}" method="post">
                <h2>Sign In</h2>
        
                <input type="text" name="username" id="username" placeholder="아이디" value="${savedUsername}" required>
        
                <div class="pw-wrapper">
                    <input type="password" name="password" id="pw" placeholder="비밀번호" required>
                    <i class="fa-solid fa-eye-slash pw-toggle" id="pwToggle" 
                    onclick="togglePw()" title="비밀번호 보기"></i>
                    
	                <c:if test="${not empty error}">
	                    <p class="error"><small>${error}</small></p>
	                </c:if>
                </div> <!-- pw-wrapper -->
        
                <div class="options">
                    <c:url var="findUrl" value="/find" />
					<a href="${findUrl}">id/pw 찾기</a>
                </div>
        
                <div class="checkbox-wrap">
                    <label><input type="checkbox" name="saveId" id="saveId"> 아이디 저장</label>
                    <label><input type="checkbox" name="autoLogin" id="autoLogin"> 자동 로그인</label>
                </div>
        
				<div class="btn-row">
					<button type="submit">로그인</button>
					<c:url var="signupUrl" value="/signup" />
					<button type="button" class="signup-btn" onclick="location.href='${signupUrl}'">회원가입</button>
				</div>
				<hr>

        		<!-- 모양만 만들어둠 -->
				<div class="social-login" style="margin-top: 1.5em;">
				    <button type="button" class="social-btn google">
				        <i class="fab fa-google"></i> Google 로그인
				    </button>
				    <button type="button" class="social-btn github">
				        <i class="fab fa-github"></i> GitHub 로그인
				    </button>
				</div>
              </form>
          </div>
        
    </div> <!-- main-content -->
</div> <!-- main-container -->

<script>
	/* 비번 토글기능 */
	function togglePw() {
	  const pwInput = document.getElementById("pw");
	  const icon = document.getElementById("pwToggle");
	
	  if (pwInput.type === "password") {
	    pwInput.type = "text";
	    icon.classList.remove("fa-eye-slash");
	    icon.classList.add("fa-eye");
	    icon.title = "비밀번호 가리기";
	  } else {
	    pwInput.type = "password";
	    icon.classList.remove("fa-eye");
	    icon.classList.add("fa-eye-slash");
	    icon.title = "비밀번호 보기";
	  }
	}
	
	  // 아이디 저장
	  window.addEventListener("DOMContentLoaded", function () {
	    const usernameInput = document.getElementById("username");
	    const saveIdCheckbox = document.getElementById("saveId");

	    // 저장된 아이디 불러옴
	    const savedId = localStorage.getItem("savedId");
	    if (savedId) {
	      usernameInput.value = savedId;
	      saveIdCheckbox.checked = true;
	    }

	    // 폼 제출시 저장 여부 판단
	    document.querySelector("form").addEventListener("submit", function () {
	      if (saveIdCheckbox.checked) {
	        localStorage.setItem("savedId", usernameInput.value);
	      } else {
	        localStorage.removeItem("savedId");
	      }
	    });
	  });
	  
	  /* 자동로그인(세션, 쿠키)은 아직 안만듦 */
	  
</script>


</body>
</html>
