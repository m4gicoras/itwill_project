<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 메인</title>
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

        .main {
            flex: 1;
            padding: 30px 50px;
        }

        .welcome {
            font-size: 28px;
            color: #355c4d;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }

        .search-bar {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #d0e4fb;
            border-radius: 9999px;
            padding: 14px 20px;
            margin: 0 auto 20px;
            max-width: 1000px;
            gap: 12px;
        }

        .search-bar input,
        .search-bar select {
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            width: 220px;
        }

        .search-bar button {
            background: none;
            border: none;
            font-size: 22px;
            cursor: pointer;
            color: #2f54eb;
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
        <li><a href="${pageContext.request.contextPath}/admin/notification"><i></i> 알림 전송</a></li>
        <li><a href="#"><i></i> 설정</a></li>
    </ul>
</div>
<div class="main">
    <div class="welcome">어서오세요, 관리자님</div>
    <div class="search-bar">
        <input type="text" id="productName" placeholder="상품명 입력">
        <input type="text" id="companyName" placeholder="기업명 입력">
        <select id="sortOrder">
            <option value="latest">최신순</option>
            <option value="oldest">오래된순</option>
            <option value="custom">직접설정</option>
        </select>
        <button onclick="handleSearch()">🔍</button>
    </div>
</div>

<script>
    function handleSearch() {
        const productName = document.getElementById("productName").value.trim();
        const companyName = document.getElementById("companyName").value.trim();
        const sortOrder = document.getElementById("sortOrder").value;

        const contextPath = "<%= request.getContextPath() %>";

        if (productName && !companyName) {
            // 상품명만 있을 때 -> 물품관리 페이지 이동
            window.location.href = contextPath + "/admin/product?productName=" + encodeURIComponent(productName) + "&sortOrder=" + sortOrder;
        } else if (!productName && companyName) {
            // 기업명만 있을 때 -> 회원관리 페이지 이동
            window.location.href = contextPath + "/admin/member?companyName=" + encodeURIComponent(companyName);
        } else if (productName && companyName) {
            // 둘 다 있을 때 -> 물품관리 페이지 이동
            window.location.href = contextPath + "/admin/product?productName=" + encodeURIComponent(productName) + "&companyName=" + encodeURIComponent(companyName) + "&sortOrder=" + sortOrder;
        } else {
            alert("검색어를 입력해주세요!");
        }
    }
</script>


</body>
</html>