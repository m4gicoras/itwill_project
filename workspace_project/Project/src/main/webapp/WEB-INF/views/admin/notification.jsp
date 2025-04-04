<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>알림 전송</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f1f4f6;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        /* 사이드바 */
        .sidebar {
            width: 60px;
            background-color: #ffffff;
            border-right: 1px solid #ddd;
            transition: width 0.3s ease;
            overflow: hidden;
        }

        .sidebar:hover {
            width: 200px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #0066cc;
            text-align: center;
            padding: 18px 0;
        }

        .sidebar:hover .logo {
            text-align: left;
            padding-left: 20px;
        }

        .logo a {
            color: #0066cc;
            text-decoration: none;
            display: block;
        }

        .sidebar li {
            padding: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .sidebar:hover li {
            justify-content: flex-start;
            padding-left: 20px;
        }

        .sidebar li a {
            width: 100%;
            text-decoration: none;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
            border-radius: 6px;
            transition: background-color 0.3s ease, color 0.3s ease, justify-content 0.3s ease;
        }

        .sidebar:hover li a {
            justify-content: flex-start;
        }

        .sidebar li a:hover {
            background-color: #e6f1ff;
            color: #0066cc;
        }

        .sidebar li a i {
            width: 24px;
            text-align: center;
            font-style: normal;
            margin-right: 0;
            font-size: 18px;
        }

        .sidebar:hover li a i {
            margin-right: 10px;
        }

        .sidebar li a .text {
            opacity: 0;
            transition: opacity 0.2s ease;
        }

        .sidebar:hover li a .text {
            opacity: 1;
        }

        /* 메인 콘텐츠 */
        .main {
            flex-grow: 1;
            padding: 40px;
        }

        .title {
            font-size: 28px;
            color: #355c4d;
            margin-bottom: 10px;
        }

        .desc {
            color: #555;
            margin-bottom: 20px;
        }

        ul.links {
            list-style: disc;
            padding-left: 20px;
        }

        ul.links li {
            margin-bottom: 10px;
        }

        ul.links a {
            color: #0066cc;
            text-decoration: none;
        }

        ul.links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <!-- 로고 버튼 -->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/admin/main">S</a>
        </div>

        <!-- 메뉴 -->
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/product"><i>📦</i><span class="text">물품 관리</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/member"><i>👤</i><span class="text">회원 관리</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/notification"><i>📢</i><span class="text">알림 전송</span></a></li>
            <li><a href="#"><i>⚙️</i><span class="text">설정</span></a></li>
        </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <div class="main">
        <div class="title">👩‍💼 알림 페이지</div>
        <div class="desc">여기는 알림페이지 입니다. (수리중)</div>
        <ul class="links">
            <li><a href="${pageContext.request.contextPath}/admin/member">회원 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/product">물품 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/notification">알림 전송</a></li>
        </ul>
    </div>
</div>
</body>
</html>
