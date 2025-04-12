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

        .main {
            flex: 1;
            padding: 30px 50px;
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

        .reset-btn {
            margin-right: 12px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            color: #1f4fa2;
            filter: grayscale(20%);
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        thead {
            background-color: #eaf2ff;
        }

        thead th {
            text-align: left;
            padding: 12px 8px;
            font-weight: 600;
            font-size: 14px;
            border-bottom: 1px solid #ddd;
        }

        tbody td {
            padding: 12px 8px;
            font-size: 14px;
            border-bottom: 1px solid #f0f0f0;
        }

        tbody tr:hover {
            background-color: #f0f6ff;
            cursor: pointer;
        }

        .company-name {
            color: #0066cc;
            font-weight: bold;
        }

        .company-name:hover {
            text-decoration: underline;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination span {
            margin: 0 5px;
            cursor: pointer;
        }
    </style>


</head>
<body>
<div class="sidebar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/admin/main">Sellity</a>
    </div>
    <ul>
        <li><a class="active" href="${pageContext.request.contextPath}/admin/product"><i></i> 물품 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/member"><i></i> 회원 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/notification"><i></i> 알림 전송</a></li>
        <li><a href="#"><i></i> 설정</a></li>
    </ul>
</div>
<div class="main">
    <!-- 검색 폼 -->
    <form action="${pageContext.request.contextPath}/admin/product" method="get">
        <div class="search-bar">
            <!-- 🔄 재설정 버튼 (폼 밖에서 동작) -->
            <a href="${pageContext.request.contextPath}/admin/product" class="reset-btn" style="font-size: 22px;">🔄</a>

            <!-- 🔍 검색 폼 -->
            <form method="get" action="${pageContext.request.contextPath}/admin/product" style="display: flex; align-items: center; gap: 12px;">
                <input type="text" name="productName" placeholder="상품명 입력" value="${productName}">
                <input type="text" name="companyName" placeholder="기업명 입력" value="${companyName}">

                <select name="sort">
                    <option value="recent" ${sort == 'recent' ? 'selected' : ''}>최신순</option>
                    <option value="oldest" ${sort == 'oldest' ? 'selected' : ''}>오래된순</option>
                </select>

                <button type="submit">🔍</button>
            </form>
        </div>



    </form>

    <!-- 조건 없을 때 메시지 -->
    <c:if test="${noCondition}">
        <p style="color: red; text-align: center;">조회 조건을 입력해주세요.</p>
    </c:if>

    <!-- 결과 없음 메시지 -->
    <c:if test="${noResult}">
        <p style="color: gray; text-align: center;">일치하는 물품이 없습니다.</p>
    </c:if>

    <!-- 테이블 카드 -->
    <div class="card">
        <table class="member-list">
            <thead>
            <tr>
                <th style="text-align: center;">물품번호</th>
                <th>기업명</th>
                <th>상품명</th>
                <th>수량</th>
                <th>등록일</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td style="text-align: center;">${product.productId}</td>
                    <td class="company-name">㈜ ${product.companyName}</td>
                    <td>${product.productName}</td>
                    <td>${product.productQty}</td>
                    <td><fmt:formatDate value="${product.createdAt}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${product.status == 0}">요청중</c:when>
                            <c:when test="${product.status == 1}">견적 수락됨</c:when>
                            <c:when test="${product.status == 2}">견적 거절됨</c:when>
                            <c:when test="${product.status == 3}">견적 제시됨</c:when>
                            <c:when test="${product.status == 4}">견적 만료됨</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>

        <!-- 페이징 처리 -->
        <div class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a href="?page=${i}&productName=${param.productName}&companyName=${param.companyName}&sort=${param.sort}"
                   style="margin: 0 5px; ${currentPage == i ? 'font-weight:bold;' : ''}">
                    ${i}
                </a>
            </c:forEach>
        </div>
    </div>
</div>


</body>
</html>