<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>📦 물품 목록</h2>

<form method="get" action="/products/list">
    <label for="status">필터:</label>
    <select name="status">
        <option value="">전체</option>
        <option value="1">품절</option>
        <option value="2">소진 임박</option>
        <option value="3">단종</option>
    </select>
    <button type="submit">조회</button>
</form>

<table border="1">
    <thead>
        <tr>
            <th>이미지</th>
            <th>물품코드</th>
            <th>상품명</th>
            <th>수량</th>
            <th>카테고리</th>
            <th>단가</th>
            <th>상태</th>
            <th>조정</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td><img src="${product.productImg}" width="80" height="80"/></td>
                <td>${product.productId}</td>
                <td>${product.productName}</td>
                <td>${product.productQtty}</td>
                <td>${product.category}</td>
                <td>${product.price}</td>
                <td>
                    <c:choose>
                        <c:when test="${product.status == 0}">정상</c:when>
                        <c:when test="${product.status == 1}">품절</c:when>
                        <c:when test="${product.status == 2}">소진 임박</c:when>
                        <c:when test="${product.status == 3}">단종</c:when>
                        <c:otherwise>알수없음</c:otherwise>
                    </c:choose>
                </td>
                <td><button>➕ 조정</button></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>