<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<div class="bg-white rounded-lg shadow-md p-6 max-w-3xl mx-auto">
    <h2 class="text-2xl font-bold mb-4">상품 상세 정보</h2>

    <div class="flex gap-6">
        <!-- 이미지 영역 -->
        <div class="w-1/2">
            <img src="${product.productImg != null ? product.productImg : 'https://via.placeholder.com/300'}"
                 alt="상품 이미지"
                 class="w-full h-auto rounded" />
        </div>

        <!-- 상품 정보 -->
        <div class="w-1/2 flex flex-col justify-between">
            <form id="estimateForm" method="post" action="${pageContext.request.contextPath}/estimate/send">
                <div>
                    <p class="text-gray-700"><strong>기업명:</strong> ${product.companyName}</p>
                    <p class="text-gray-700 mt-2"><strong>상품명:</strong> ${product.productName}</p>
                    <p class="text-gray-700 mt-2"><strong>카테고리:</strong> ${product.category}</p>
                    <p class="text-gray-700 mt-2"><strong>수량:</strong> ${product.productQtty}</p>
                    <p class="text-gray-700 mt-2"><strong>단가:</strong> ₩<fmt:formatNumber value="${product.price}" type="number" /></p>
                    <p class="text-gray-700 mt-4 whitespace-pre-line"><strong>상세 설명:</strong><br>${product.productDesc}</p>
                </div>

                <!-- 숨은 필드 -->
                <input type="hidden" name="productId" value="${product.productId}" />
                <input type="hidden" name="resCompanyId" value="${product.companyId}" />
                <input type="hidden" name="reqCost" value="${product.price}" />

                <!-- 견적 수량 입력 -->
                <label class="block font-medium mt-4">견적 수량</label>
                <input type="number" name="estimateQtty" id="estimateQtty" placeholder="수량을 입력하세요"
                       class="w-full p-2 border border-gray-300 rounded" oninput="validateEstimate()" required />

                <!-- 에러 메시지 -->
                <p id="qttyError" class="text-red-500 text-sm mt-1 hidden">※ 보유 수량보다 많은 수량은 입력할 수 없습니다.</p>

                <!-- 버튼 영역 -->
                <div class="flex justify-between mt-6 w-full px-6">
                    <button type="button" onclick="window.close()"
                            class="w-full py-3 bg-gray-300 hover:bg-gray-400 text-sm font-semibold rounded-l-md">닫기</button>
                    <button type="submit"
                            class="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold rounded-r-md ml-2">보내기</button>
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
