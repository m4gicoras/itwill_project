<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sellity 상품 목록</title>
    <script src="https://cdn.tailwindcss.com"></script>

     <!-- 웹폰트 -->
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet"/>

        <!-- 커스텀 폰트 -->
        <style>
          @font-face {
            font-family: 'KIMM_Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
          }

          body {
            font-family: 'Noto Sans KR', sans-serif;
          }

          .logo-font {
            font-family: 'KIMM_Bold', sans-serif;
          }

          .kimm-bold {
            font-family: 'KIMM_Bold', sans-serif !important;
          }

     </style>


</head>
<body class="bg-gray-50 min-h-screen">

<!-- ✅ Header -->
<header class="bg-white h-20 flex items-center px-8 shadow-[0_8px_16px_rgba(0,123,255,0.12)]">
  <div class="text-2xl logo-font text-blue-900 select-none">Sellity<span class="text-base font-normal text-blue-700 ml-2">Shop</span></div>
</header>

<div class="flex select-none w-full items-start">
<c:set var="currentCategory" value="${param.category}" />

<aside class="w-60 ml-6 mt-14 bg-white shadow-[0_8px_16px_rgba(0,123,255,0.1)] rounded-xl overflow-auto">

    <!-- 카테고리 헤더 -->
    <div class="bg-blue-500 font-semibold text-white shadow-lg rounded-xl text-center py-3 text-lg">
      카테고리
    </div>

    <!-- 리스트 영역 -->
    <div class="flex flex-col gap-1 px-4 py-4">
      <ul class="flex flex-col gap-1 text-base">
        <c:forEach var="cat" items="${['의료용품','의료기기','전자기기','생활용품','사무용품','식음료','청소용품','화장품','반려동물용품']}">
          <li>
            <a href="${pageContext.request.contextPath}/shop?category=${cat}"
               class="block w-full px-4 py-2 rounded-full text-base transition
               ${currentCategory == cat ? 'bg-blue-100 text-blue-700 font-semibold' : 'text-gray-800 hover:bg-blue-50 hover:text-blue-700'}">
              ${cat}
            </a>
          </li>
        </c:forEach>
      </ul>

      <!-- 구분선 -->
      <div class="border-t my-4"></div>

      <!-- 기타 메뉴 -->
      <ul class="flex flex-col gap-1 text-base">
        <li>
          <a href="${pageContext.request.contextPath}/shop"
             class="block w-full px-4 py-2 rounded-full transition
             ${empty currentCategory ? 'bg-blue-100 text-blue-700 font-semibold' : 'text-gray-800 hover:bg-blue-50 hover:text-blue-800'}">
            전체 상품
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/dashboard"
             class="block w-full px-4 py-2 mb-6 text-gray-800 hover:font-semibold hover:text-blue-800 transition rounded-md">
            나의 기업
          </a>
        </li>
      </ul>
  </div>

</aside>

    <!-- 본문 콘텐츠 -->
    <main class="flex-1 p-8 min-h-screen">
        <!-- 검색 폼 -->

        <!-- ✅ 감싸는 카드 박스 시작 -->
        <div class="bg-white rounded-xl shadow-[0_8px_16px_rgba(0,123,255,0.1)] mt-6 mb-4 p-10">

        <!-- 검색 폼: 가운데 정렬 -->
        <div class="flex justify-start mt-2 mb-8">
            <form action="${pageContext.request.contextPath}/shop" method="get" class="flex gap-2">
                <input type="text" name="keyword"
                       placeholder="상품명 또는 기업명 검색"
                       value="${param.keyword}"
                       class="w-64 px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-300" />
                <button type="submit"
                        class="px-4 bg-blue-500 text-white rounded-md shadow-md hover:bg-blue-600">
                    검색
                </button>
            </form>
        </div>

        <div class="overflow-x-auto rounded-md">
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
                    <tr class="border-t hover:bg-blue-50
                <c:if test='${product.status == 3}'> bg-gray-50 text-gray-400</c:if>">
                        <td class="px-4 py-2">${product.productId}</td>
                        <td class="px-4 py-2">
                            <c:choose>
                                <c:when test="${not empty product.productImg}">
                                    <img src="${product.productImg}"
                                         alt="상품 이미지"
                                         class="w-16 h-16 object-cover rounded mx-auto"/>
                                </c:when>

                                <c:otherwise>
                                    <div class="no-image h-16 w-16 rounded mx-auto">
                                        <span class="text-gray-500 text-xs block text-center">No image</span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="px-4 py-2">
                            <c:choose>
                                <c:when test="${product.status == 3}">
                                    <span class="text-gray-400 cursor-not-allowed">${product.productName}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" onclick="openPopup(${product.productId})" class="font-semibold text-blue-500 hover:underline">
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
                    ${product.status == 0 ? 'bg-green-200 text-green-700' :
                      product.status == 1 ? 'bg-red-200 text-red-700' :
                      product.status == 2 ? 'bg-orange-200 text-orange-700' :
                      'bg-gray-200 text-gray-700'}">
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