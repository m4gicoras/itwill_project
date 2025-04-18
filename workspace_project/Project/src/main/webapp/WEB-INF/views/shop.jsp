<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sellity 상품 목록</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<!-- 상단바 -->
<header class="bg-white shadow-md p-4 flex justify-center items-center">
    <div class="text-2xl font-bold text-gray-800">Sellity</div>
</header>


<div class="flex min-h-screen">
    <!-- 사이드바 -->
    <aside class="w-64 bg-white shadow-md p-6">
        <nav class="flex flex-col gap-4">
            <h3 class="text-gray-500 text-sm font-semibold mb-2">📚 품목별 보기</h3>
            <a href="${pageContext.request.contextPath}/shop?category=의료용품">🩺 의료용품</a>
            <a href="${pageContext.request.contextPath}/shop?category=의료기기" class="text-gray-800 hover:text-blue-500 font-medium">🛠️ 의료기기</a>
            <a href="${pageContext.request.contextPath}/shop?category=전자기기" class="text-gray-800 hover:text-blue-500 font-medium">📱 전자기기</a>
            <a href="${pageContext.request.contextPath}/shop?category=생활용품" class="text-gray-800 hover:text-blue-500 font-medium">🏠 생활용품</a>
            <a href="${pageContext.request.contextPath}/shop?category=사무용품" class="text-gray-800 hover:text-blue-500 font-medium">📎 사무용품</a>
            <a href="${pageContext.request.contextPath}/shop?category=식음료" class="text-gray-800 hover:text-blue-500 font-medium">🥤 식음료</a>
            <a href="${pageContext.request.contextPath}/shop?category=청소용품" class="text-gray-800 hover:text-blue-500 font-medium">🧽 청소용품</a>
            <a href="${pageContext.request.contextPath}/shop?category=화장품" class="text-gray-800 hover:text-blue-500 font-medium">💄 화장품</a>
            <a href="${pageContext.request.contextPath}/shop?category=반려동물용품" class="text-gray-800 hover:text-blue-500 font-medium">🐶 반려동물용품</a>

            <!-- 기타 -->
            <div class="border-t my-4"></div>
            <a href="${pageContext.request.contextPath}/shop"
               class="text-gray-800 hover:text-blue-500 font-medium">📦 전체 상품</a>
            <a href="${pageContext.request.contextPath}/dashboard"
               class="text-gray-800 hover:text-blue-500 font-medium">📝 나의 기업</a>

        </nav>
    </aside>

    <!-- 본문 콘텐츠 -->
    <main class="flex-1 p-8">
        <!-- 검색 폼 -->
        <!-- 검색 폼: 가운데 정렬 -->
        <div class="flex justify-center mb-6">
            <form action="${pageContext.request.contextPath}/shop" method="get" class="flex gap-2">
                <input type="text" name="keyword"
                       placeholder="상품명 또는 기업명 검색"
                       value="${param.keyword}"
                       class="w-64 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
                <button type="submit"
                        class="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600">
                    🔍 검색
                </button>
            </form>
        </div>

        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200">
                <thead class="bg-gray-100">
                <tr class="text-left text-gray-700">
                    <th class="px-4 py-2 border-b">상품코드</th>
                    <th class="px-4 py-2 border-b">이미지</th>
                    <th class="px-4 py-2 border-b">상품명</th>
                    <th class="px-4 py-2 border-b">수량</th>
                    <th class="px-4 py-2 border-b">단가</th>
                    <th class="px-4 py-2 border-b">등록일</th>
                    <th class="px-4 py-2 border-b">상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr class="border-t hover:bg-gray-50
            <c:if test='${product.status == 3}'> bg-gray-100 text-gray-500</c:if>">
                        <td class="px-4 py-2">${product.productId}</td>
                        <td class="px-4 py-2">
                            <img src="${product.productImg != null ? product.productImg : 'https://via.placeholder.com/50'}"
                                 alt="이미지"
                                 class="w-12 h-12 object-cover rounded" />
                        </td>
                        <td class="px-4 py-2">
                            <c:choose>
                                <c:when test="${product.status == 3}">
                                    <span class="text-gray-400 cursor-not-allowed">${product.productName}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" onclick="openPopup(${product.productId})" class="text-blue-600 hover:underline">
                                            ${product.productName}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-4 py-2">${product.productQtty}</td>
                        <td class="px-4 py-2">₩<fmt:formatNumber value="${product.price}" type="number"/></td>
                        <td class="px-4 py-2"><fmt:formatDate value="${product.createdAt}" pattern="yyyy-MM-dd"/></td>
                        <td class="px-4 py-2">
                <span class="
                    text-xs font-semibold px-2.5 py-0.5 rounded-full
                    ${product.status == 0 ? 'bg-green-100 text-green-700' :
                      product.status == 1 ? 'bg-red-100 text-red-600' :
                      product.status == 2 ? 'bg-orange-100 text-orange-600' :
                      'bg-gray-300 text-gray-600'}">
                    <c:choose>
                        <c:when test="${product.status == 0}">구매 가능</c:when>
                        <c:when test="${product.status == 1}">재고 부족</c:when>
                        <c:when test="${product.status == 2}">소진 임박</c:when>
                        <c:when test="${product.status == 3}">구매 불가</c:when>
                        <c:otherwise>알 수 없음</c:otherwise>
                    </c:choose>
                </span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </main>
</div>

<script>
    function openPopup(productId) {
        const contextPath = '${pageContext.request.contextPath}';
        const url = contextPath + '/shopDetail?productId=' + productId;
        const popup = window.open(url, '견적 제시', 'width=700,height=600,scrollbars=yes,resizable=no');
        if (popup == null) {
            alert('팝업이 차단되어 있습니다! 브라우저 설정을 확인해주세요.');
        }
    }
</script>


</body>
</html>