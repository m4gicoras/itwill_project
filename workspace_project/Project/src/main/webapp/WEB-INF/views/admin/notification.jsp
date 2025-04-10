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

        .content {
            flex: 1;
            padding: 30px 40px;
        }

        .notification-box {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            max-width: 900px;
            margin: 0 auto;
        }

        .notification-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-left, .form-right {
            display: flex;
            flex-direction: column;
        }

        .form-left input[type="text"] {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .form-left button {
            background-color: #2f54eb;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            margin-bottom: 15px;
            cursor: pointer;
        }

        .form-left textarea {
            height: 180px;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 10px;
            resize: none;
        }

        .receiver-list {
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 10px;
            height: 180px;
            overflow-y: auto;
            margin-bottom: 10px;
        }

        .receiver-list div {
            background-color: #f0f0f0;
            padding: 5px 10px;
            border-radius: 12px;
            margin-bottom: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .form-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .form-footer button {
            background-color: #2f54eb;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .char-count {
            color: #888;
            font-size: 12px;
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

<div class="content">
    <div class="notification-box">
        <div class="notification-title">메시지 보내기</div>
        <div class="form-grid">
            <div class="form-left">
                <input type="text" id="companyInput" placeholder="기업명">
                <button type="button" onclick="handleAddClick()">추가하기</button>

                <div id="tagContainer" class="receiver-list"></div>

                <button type="button" class="reset-btn" onclick="resetTags()">reset</button>
            </div>

            <div class="form-right">
                <textarea maxlength="500" placeholder="내용을 입력하세요."></textarea>
                <div class="form-footer">
                    <span class="char-count">0 / 500</span>
                    <button type="submit">메시지 보내기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function handleAddClick() {
        const input = document.getElementById('companyInput');
        const name = input.value.trim();
        if (!name) return;

        const fakeId = Date.now(); // 나중엔 DB에서 받은 user_id 쓰면 됨
        addCompany(fakeId, name);
        input.value = '';
    }

  </script>
</body>
</html>
