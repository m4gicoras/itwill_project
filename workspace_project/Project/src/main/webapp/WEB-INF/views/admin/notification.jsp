<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <!-- Tailwind 기반 디자인 적용 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f4f6f8;
            padding: 20px;
            display: flex;
        }

        .sidebar {
            width: 220px;
            background-color: #ffffff;
            border-right: 1px solid #e0e0e0;
            padding: 30px 20px;
            height: 100vh;
        }

        .logo {
            font-family: 'Great Vibes', cursive;
            font-size: 28px;
            font-weight: 400;
            text-align: center;
            margin-bottom: 40px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 15px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 8px;
            color: #333;
            transition: background-color 0.2s ease;
        }

        .sidebar a:hover {
            background-color: #e6f1ff;
        }

        .sidebar a.active {
            background-color: #e6f1ff;
            color: #2f54eb;
            font-weight: bold;
        }

        .sidebar i {
            margin-right: 8px;
        }
    </style>


</head>
<body>
<div class="sidebar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/admin/main">Sellity</a>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/product"><i></i> 물품 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/member"><i></i> 회원 관리</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/admin/notification"><i></i> 알림 전송</a></li>
        <li><a href="#"><i></i> 설정</a></li>
    </ul>
</div>

</body>
</html>
