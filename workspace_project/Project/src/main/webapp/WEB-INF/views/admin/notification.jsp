<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 메인</title>
    <style>
        body { font-family: Arial; background-color: #f4f4f4; padding: 30px; }
        .box { background: white; padding: 20px; border-radius: 8px; box-shadow: 2px 2px 8px rgba(0,0,0,0.1); }
        h1 { color: #333; }
    </style>
</head>
<body>
<div class="box">
    <h1>👩‍💼 알림 페이지</h1>
    <p>여기는 알림페이지 입니다.(수리중)</p>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/member">회원 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/product">물품 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/notification">알림 전송</a></li>
    </ul>
</div>
</body>
</html>
