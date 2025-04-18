<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>견적 현황</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">

<div class="max-w-7xl mx-auto">
  <h2 class="text-2xl font-bold mb-6 text-center">견적 현황</h2>

  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
    <!-- 보낸 견적 -->
    <div class="bg-white shadow rounded-lg p-5">
      <h3 class="text-lg font-semibold mb-3 text-blue-600">보낸 견적</h3>
      <table class="w-full text-sm text-center border border-gray-200">
        <thead class="bg-gray-100">
        <tr>
          <th class="p-2">상품명</th>
          <th class="p-2">수량</th>
          <th class="p-2">요청단가</th>
          <th class="p-2">견적상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="estimate" items="${sentEstimates}">
          <tr class="border-b">
            <td class="p-2">${estimate.productName}</td>
            <td class="p-2">${estimate.estimateQtty}</td>
            <td class="p-2"><fmt:formatNumber value="${estimate.reqCost}" type="number" /></td>
            <td class="p-2">
              <c:choose>
                <c:when test="${estimate.status == 0}">요청중</c:when>
                <c:when test="${estimate.status == 1}">수락됨</c:when>
                <c:when test="${estimate.status == 2}">거절됨</c:when>
                <c:when test="${estimate.status == 3}">견적제시됨</c:when>
                <c:when test="${estimate.status == 4}">만료됨</c:when>
                <c:otherwise>알 수 없음</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- 받은 견적 -->
    <div class="bg-white shadow rounded-lg p-5">
      <h3 class="text-lg font-semibold mb-3 text-green-600">받은 견적</h3>
      <table class="w-full text-sm text-center border border-gray-200">
        <thead class="bg-gray-100">
        <tr>
          <th class="p-2">상품명</th>
          <th class="p-2">요청기업</th>
          <th class="p-2">수량</th>
          <th class="p-2">견적상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="estimate" items="${receivedEstimates}">
          <tr class="border-b">
            <td class="p-2">${estimate.productName}</td>
            <td class="p-2">${estimate.reqCompanyName}</td>
            <td class="p-2">${estimate.estimateQtty}</td>
            <td class="p-2">
              <c:choose>
                <c:when test="${estimate.status == 0}">요청중</c:when>
                <c:when test="${estimate.status == 1}">수락됨</c:when>
                <c:when test="${estimate.status == 2}">거절됨</c:when>
                <c:when test="${estimate.status == 3}">견적제시됨</c:when>
                <c:when test="${estimate.status == 4}">만료됨</c:when>
                <c:otherwise>알 수 없음</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
