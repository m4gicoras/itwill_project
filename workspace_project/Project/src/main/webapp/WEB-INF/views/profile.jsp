<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>프로필 페이지</title>
</head>
<body>
    <h1>프로필 이미지 변경</h1>

    <!-- 현재 프로필 이미지 표시 -->
    <c:if test="${not empty profileImageUrl}">
        <img src="${profileImageUrl}" alt="Profile Image" width="200" height="200"/>
    </c:if>

    <!-- 업로드 폼 -->
    <form action="<c:url value='/profile/upload'/>" method="post" enctype="multipart/form-data">
        <input type="file" name="file" accept="image/jpeg, image/png, image/webp" />
        <button type="submit">업로드</button>
    </form>

    <!-- 메시지 출력 -->
    <c:if test="${not empty message}">
        <p style="color:red;">${message}</p>
    </c:if>

</body>
</html>