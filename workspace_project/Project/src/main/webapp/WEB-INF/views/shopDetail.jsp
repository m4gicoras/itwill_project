<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">

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

      /* KIMM_Bold 폰트를 적용하는 부분 */
      .kimm-bold {
         font-family: 'KIMM_Bold', sans-serif;
      }

    </style>

</head>
<body class="bg-gray-50 p-6">
<div class="bg-white rounded-xl shadow-lg p-6 max-w-3xl mx-auto">
    <h2 class="text-3xl font-bold mb-6">상품 상세 정보</h2>

    <div class="flex gap-6">
        <!-- 이미지 영역 -->
        <div class="w-1/2">
            <c:choose>
                <c:when test="${not empty product.productImg}">
                    <img src="${product.productImg}"
                         alt="상품 이미지"
                         class="w-full h-auto rounded"/>
                </c:when>

                <c:otherwise>
                    <div class="no-image w-full h-60 rounded flex items-center justify-center">
                        <span class="text-gray-500 text-sm">No image</span>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- 상품 정보 -->
                <div class="w-1/2 flex flex-col justify-between">
                    <form id="estimateForm" method="post" action="${pageContext.request.contextPath}/estimate/send">
                        <input type="hidden" name="productId" value="${product.productId}" />
                        <input type="hidden" name="resCompanyId" value="${product.companyId}" />

                        <div class="space-y-4">
                                <!-- 상품명 -->
                                <div class="flex items-center gap-6">
                                    <span class="text-gray-800 font-semibold text-2xl">상품명</span>
                                    <span class="text-gray-800 text-2xl">${product.productName}</span>
                                </div>

                            <!-- 단가 입력 -->
                            <div class="flex items-center gap-4">
                                <span class="text-blue-500 font-semibold text-xl">요청 단가</span>
                                <input type="number" name="reqCost" id="reqCost"
                                       value="${product.price}" min="0"
                                       class="w-32 text-end border border-gray-300 focus:outline-none rounded-md px-2 py-1 text-sm"
                                       required />
                                <span class="text-blue-500 font-semibold text-xl">₩</span>
                            </div>

                                <!-- 기업명 -->
                                <div class="flex items-center gap-4">
                                    <span class="text-gray-800 font-semibold">기업명</span>
                                    <span class="text-gray-800">${product.companyName}</span>
                                </div>

                                <!-- 카테고리 -->
                                <div class="flex items-center gap-4">
                                    <span class="text-gray-800 font-semibold">카테고리</span>
                                    <span class="text-gray-800">${product.category}</span>
                                </div>

                                <!-- 수량 -->
                                <div class="flex items-center gap-4">
                                    <span class="text-gray-800 font-semibold">수량</span>
                                    <span class="text-gray-800">${product.productQtty}</span>
                                </div>
                                <hr class="mb-2 border-gray-300">

                                <!-- 상세 설명 -->
                                <div>
                                    <p class="text-gray-800 font-semibold mb-2">상세 설명 :</p>
                                    <p class="text-gray-800 whitespace-pre-line">${product.productDesc}</p>
                                    <hr class="mt-4 mb-2 border-gray-300">
                                </div>


                            <!-- 견적 수량 입력 -->
                                <div class>
                                    <label class="block text-base text-gray-800 font-semibold mb-2">수량 :</label>
                                    <div class="inline-flex items-center space-y-4">
                                        <input type="number" name="estimateQtty" id="estimateQtty"
                                               value="1" min="1"
                                               placeholder="수량을 입력하세요"
                                               class="w-full text-start mb-2 text-sm border border-gray-300 focus:outline-none rounded-md px-3 py-2 appearance-none no-spinner"
                                               inputmode="numeric" pattern="[0-9]*" required />
                                    </div>
                                </div>

                                <!-- 에러 메시지 -->
                                <p id="qttyError" class="text-red-500 text-sm mt-1 hidden">※ 보유 수량보다 많은 수량은 입력할 수 없습니다.</p>

                                <!-- 버튼 영역 -->
                                <div class="flex justify-end mt-6 w-full px-4 gap-2">
                                    <button type="button" onclick="window.close()"
                                            class="w-1/3 py-3 bg-gray-300 hover:bg-gray-400 rounded-full shadow-md mb-2">닫기</button>
                                    <button type="submit"
                                            class="w-1/3 py-3 bg-blue-500 hover:bg-blue-600 text-white rounded-full shadow-md mb-2">보내기</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>

<script>
    function validateEstimate() {
        const availableQtty = ${product.productQtty};
        const input = document.getElementById('estimateQtty');
        const errorMsg = document.getElementById('qttyError');
        const enteredQtty = parseInt(input.value);

        if (enteredQtty > availableQtty) {
            input.classList.add('border-red-500', 'ring-1', 'ring-red-500');
            errorMsg.classList.remove('hidden');
            return false;
        } else {
            input.classList.remove('border-red-500', 'ring-1', 'ring-red-500');
            errorMsg.classList.add('hidden');
            return true;
        }
    }

    document.getElementById('estimateForm').addEventListener('submit', function (e) {
        if (!validateEstimate()) {
            e.preventDefault(); // 제출 막기
        }
    });
</script>

</body>
</html>
