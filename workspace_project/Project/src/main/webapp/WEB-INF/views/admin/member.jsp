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
            padding: 12px 16px;
            margin-bottom: 20px;
            width: 100%;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .search-bar input {
            flex: 1;
            border: none;
            background: white;
            padding: 10px 14px;
            border-radius: 6px;
        }

        .search-bar input:focus {
            outline: none;
        }

        .search-bar button {
            background: none;
            border: none;
            cursor: pointer;
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

        .sort-arrow {
            display: inline-block;
            width: 16px;
            font-size: 12px;
            margin-left: 4px;
            color: #0066cc;
            text-align: left;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination span {
            margin: 0 5px;
            cursor: pointer;
        }

        #popup {
            display: none;
            position: fixed;
            top: 20%; left: 50%; transform: translate(-50%, 0);
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            z-index: 999;
            width: 400px;
        }

        #popup button {
            margin-top: 20px;
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
        }

        #popup button:hover {
            background-color: #004c99;
        }
    </style>

    <script>
        function openPopup(companyName, ceoName, phone, email, regDate) {
            document.getElementById("popup-companyName").textContent = companyName;
            document.getElementById("popup-ceoName").textContent = ceoName;
            document.getElementById("popup-phone").textContent = phone;
            document.getElementById("popup-email").textContent = email;
            document.getElementById("popup-regDate").textContent = regDate;
            document.getElementById("popup").style.display = "block";
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        function resetInput() {
            document.querySelector("input[name='keyword']").value = "";
        }

        let sortDirection = {};
        let currentSortedTh = null;

        function sortTable(colIndex, thElement) {
            const table = document.querySelector(".member-list");
            const tbody = table.tBodies[0];
            const rows = Array.from(tbody.rows);
            sortDirection[colIndex] = !sortDirection[colIndex];
            const direction = sortDirection[colIndex];
            const isNumeric = !isNaN(rows[0].cells[colIndex].innerText);

            rows.sort((a, b) => {
                let valA = a.cells[colIndex].innerText.trim();
                let valB = b.cells[colIndex].innerText.trim();
                if (isNumeric) {
                    valA = parseFloat(valA);
                    valB = parseFloat(valB);
                }
                if (valA < valB) return direction ? -1 : 1;
                if (valA > valB) return direction ? 1 : -1;
                return 0;
            });

            rows.forEach(row => tbody.appendChild(row));

            if (currentSortedTh && currentSortedTh !== thElement) {
                currentSortedTh.querySelector(".sort-arrow").textContent = "";
            }
            const arrowSpan = thElement.querySelector(".sort-arrow");
            arrowSpan.textContent = direction ? "▲" : "▼";
            currentSortedTh = thElement;
        }

        window.onload = function () {
            sortTable(0, document.getElementById("defaultSort"));
        }
    </script>
</head>
<body>
<div class="sidebar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/admin/main">Sellity</a>
    </div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/product"><i></i> 물품 관리</a></li>
        <li><a class="active" href="${pageContext.request.contextPath}/admin/member"><i></i> 회원 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/notification"><i></i> 알림 전송</a></li>
        <li><a href="#"><i></i> 설정</a></li>
    </ul>
</div>
<div class="main">
    <div class="search-bar">
        <button class="reset-btn" onclick="resetInput()">🔄</button>
        <form method="get" action="${pageContext.request.contextPath}/admin/companies" style="display: flex; width: 100%;">
            <input type="text" name="keyword" placeholder="검색어를 입력하세요." />
            <button type="submit" style="font-size: 20px; margin-left: 10px;">🔍</button>
        </form>
    </div>

    <div class="card">
        <table class="member-list">
            <thead>
            <tr>
                <th id="defaultSort" onclick="sortTable(0, this)" style="text-align: center;">
                  회원번호 <span class="sort-arrow"></span>
                </th>

                <th onclick="sortTable(1, this)">기업명 <span class="sort-arrow"></span></th>
                <th onclick="sortTable(2, this)">담당자명 <span class="sort-arrow"></span></th>
                <th onclick="sortTable(3, this)">연락처 <span class="sort-arrow"></span></th>
                <th onclick="sortTable(4, this)">이메일 <span class="sort-arrow"></span></th>
                <th onclick="sortTable(5, this)">등록일 <span class="sort-arrow"></span></th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty companyList}">
                    <c:forEach var="user" items="${companyList}">
                        <tr onclick="openPopup('${user.companyName}', '${user.ceoName}', '${user.phone}', '${user.email}', '${user.regDate}')">

                            <td style="text-align: center;">${user.userId}</td>
                            <td class="company-name">㈜ ${user.companyName}</td>
                            <td>${empty user.ceoName ? '-' : user.ceoName}</td>
                            <td>${empty user.phone ? '-' : user.phone}</td>
                            <td>${empty user.email ? '-' : user.email}</td>
                            <td><fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="6" class="no-data">등록된 회원 정보가 없습니다.</td></tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
        <div class="pagination">
            <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>...<span>52</span>
        </div>
    </div>

    <div id="popup">
        <h3>기업 상세 정보(아직)</h3>
        <p><strong>기업명:</strong> <span id="popup-companyName"></span></p>
        <p><strong>담당자:</strong> <span id="popup-ceoName"></span></p>
        <p><strong>연락처:</strong> <span id="popup-phone"></span></p>
        <p><strong>이메일:</strong> <span id="popup-email"></span></p>
        <p><strong>등록일:</strong> <span id="popup-regDate"></span></p>
        <button onclick="closePopup()">닫기</button>
    </div>
</div>
</body>
</html>
