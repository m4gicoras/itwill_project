<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">

  <title>상품등록</title>

  <!-- 웹폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet" />

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
      font-family: 'KIMM_Bold', sans-serif;
    }
  </style>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">

<main class="flex flex-col items-center justify-center px-8 py-20">
  <div class="bg-white px-14 py-16 text-gray-800 shadow-lg select-none rounded-lg w-full max-w-3xl">

    <!-- 상품명 -->
    <div>
      <label class="block text-base font-semibold mb-1">상품명</label>
      <input type="text" class="w-full border border-gray-300 rounded-md px-3 py-2" />
    </div>

    <div class="flex gap-4 mt-4">
      <!-- 상품 대표 이미지 -->
      <div class="w-1/2">
        <label class="block text-base font-semibold mb-1">상품대표이미지</label>

        <!-- 업로드 박스 -->
        <div class="relative">
          <div id="uploadBox"
            class="w-full aspect-square bg-gray-100 flex items-center justify-center rounded-md overflow-hidden cursor-pointer relative">

            <!-- 기본 아이콘 -->
            <svg id="placeholderIcon" class="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" stroke-width="2"
              viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round"
                d="M3 5h18M3 5v14a2 2 0 002 2h14a2 2 0 002-2V5M3 5l9 7 9-7" />
            </svg>

            <!-- 미리보기 이미지 -->
            <img id="previewImg" src="" alt="미리보기"
              class="absolute w-full h-full object-cover hidden" />
          </div>

          <!-- X 삭제 버튼 -->
          <button id="deleteImageBtn"
            class="absolute top-2 right-2 z-20 border-none p-1 cursor-pointer hidden"
            type="button">
            <img src="https://www.svgrepo.com/show/416193/basic-delete-ui.svg"
                 alt="삭제"
                 class="w-6 h-6" />
          </button>

        </div>

        <!-- 파일 업로드 -->
        <input type="file" id="imageInput" accept=".jpg, .jpeg, .png, .webp" class="hidden" />

        <!-- 오류 메시지 -->
        <p id="imageError" class="text-red-500 text-sm mt-2 hidden">지원하는 파일 형식이 아닙니다.</p>
      </div>

      <!-- 카테고리, 단가, 수량 -->
      <div class="w-1/2 space-y-4">
        <div>
          <label class="block text-base font-semibold mb-1">카테고리</label>
          <select class="w-full border border-gray-300 rounded-md px-3 py-2">
            <option>선택</option>
            <option>카테고리1</option>
            <option>카테고리2</option>
          </select>
        </div>
        <div>
          <label class="block text-base font-semibold mb-1">단가</label>
          <input type="text" class="w-full border border-gray-300 rounded-md px-3 py-2" />
        </div>
        <div>
          <label class="block text-base font-semibold mb-1">수량</label>
          <select class="w-full border border-gray-300 rounded-md px-3 py-2">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
          </select>
        </div>
      </div>
    </div>

    <!-- 상품 설명 -->
    <div>
      <textarea
        placeholder="상품 설명을 입력해주세요"
        class="w-full mt-4 border-none focus:outline-none rounded-sm px-3 py-5 bg-blue-50 text-gray-800 resize-none"
        rows="5"></textarea>
    </div>

    <!-- 버튼 -->
    <div class="flex justify-end gap-4 mt-6">
      <button class="px-6 py-2 bg-gray-300 rounded-full shadow-lg hover:bg-gray-400 cursor-pointer transition">초기화</button>
      <button class="px-6 py-2 bg-blue-500 text-white rounded-full shadow-lg hover:bg-blue-600 cursor-pointer transition">등록하기</button>
    </div>
  </div>
</main>

<!-- 스크립트 -->
<script>
  const uploadBox = document.getElementById("uploadBox");
  const imageInput = document.getElementById("imageInput");
  const imageError = document.getElementById("imageError");
  const previewImg = document.getElementById("previewImg");
  const placeholderIcon = document.getElementById("placeholderIcon");
  const deleteImageBtn = document.getElementById("deleteImageBtn");

  // 클릭 시 파일 선택창 열기 (이미지가 없을 때만)
  uploadBox.addEventListener("click", () => {
    if (previewImg.classList.contains("hidden")) {
      imageInput.click();
    }
  });

  // 파일 선택
  imageInput.addEventListener("change", function () {
    const file = this.files[0];
    if (file) {
      const allowedTypes = ["image/jpeg", "image/jpg", "image/png", "image/webp"];
      if (!allowedTypes.includes(file.type)) {
        imageError.classList.remove("hidden");
        previewImg.classList.add("hidden");
        placeholderIcon.classList.remove("hidden");
        this.value = "";
        deleteImageBtn.classList.add("hidden");
        return;
      }

      imageError.classList.add("hidden");

      const reader = new FileReader();
      reader.onload = function (e) {
        previewImg.src = e.target.result;
        previewImg.classList.remove("hidden");
        placeholderIcon.classList.add("hidden");
        deleteImageBtn.classList.remove("hidden");
      };
      reader.readAsDataURL(file);
    }
  });

  // 이미지 삭제 버튼
  deleteImageBtn.addEventListener("click", (e) => {
    e.stopPropagation(); // 박스 클릭 막기
    previewImg.src = "";
    previewImg.classList.add("hidden");
    placeholderIcon.classList.remove("hidden");
    imageInput.value = "";
    deleteImageBtn.classList.add("hidden");
  });
</script>

</body>
</html>