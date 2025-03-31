<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background: rgba(255, 255, 255, 0.9);
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

    </style>
</head>
<body>

    <!-- 배경 동영상 -->
    <video autoplay muted loop id="bg-video">
        <source src="<c:url value='/resources/forest.mp4'/>" type="video/mp4">
        브라우저가 비디오 태그를 지원하지 않습니다.
    </video>

    <!-- 로그인 영역 -->
    <div class="login-container">
        <form action="<c:url value='/login'/>" method="post">
            <h2>로그인</h2>
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
            <button type="button" onclick="location.href='<c:url value="/signup"/>'">회원가입</button>

        </form>
    </div>

</body>
</html>
