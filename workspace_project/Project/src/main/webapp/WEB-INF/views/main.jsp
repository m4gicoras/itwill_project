<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<!-- 영상란 -->

<!-- 영상란 -->

<!-- 로그인 폼 -->
<form action="${pageContext.request.contextPath}/main" method="post">
    <input type="text" name="username" placeholder="아이디" value="${savedUsername}" required><br>
    <input type="password" name="password" placeholder="비밀번호" required><br>

    <label>
        <input type="checkbox" name="saveId"> 아이디 저장
    </label><br>

    <button type="submit">로그인</button>
</form>

<!-- 회원가입 / 아이디 찾기 / 비밀번호 찾기 -->
<%-- <a href="${pageContext.request.contextPath}/signup">회원가입</a><br> --%>
<c:url var="signupUrl" value="/signup" /><a href="${signupUrl}">회원가입</a>
<a href="${pageContext.request.contextPath}/find">아이디 / 비밀번호 찾기</a>
<br>

<!-- 에러 메시지 -->
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

</body>
</html>
