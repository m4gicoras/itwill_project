<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원탈퇴 완료</title>

  <!-- TailwindCSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

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

    @keyframes bounce {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.1); }
    }
  </style>
</head>
<body>
  <div class="flex flex-col items-center justify-center select-none min-h-screen bg-gray-50 px-4 text-center">
    <!-- 이미지 -->
    <img src="${pageContext.request.contextPath}/resources/images/ufo.png" alt="emoji" class="w-40 h-40 mb-2" />

    <!-- 텍스트 -->
    <p class="text-2xl font-semibold mb-2">회원탈퇴가 완료되었습니다.</p>
    <p class="text-xl text-gray-700">
      <span class="kimm-bold text-blue-500">Sellity</span>를 이용해주셔서 감사합니다.
    </p>
    <p class="text-xl text-gray-700 mb-6">
      더 나은 <span class="kimm-bold text-blue-500">Sellity</span>가 되겠습니다.
    </p>

    <!-- 버튼 영역 -->
    <div class="flex flex-col space-y-4 mt-14">
      <!-- 메인페이지 이동 -->
      <a href="/mainTest" class="px-6 py-2 bg-blue-500 text-white rounded-full shadow-md hover:bg-blue-600 transition text-center">
        확인
      </a>

      <!-- 회원가입 페이지 이동 -->
      <a href="/signup" class="px-6 py-2 bg-gray-300 text-black rounded-full shadow-md hover:bg-gray-400 transition text-center">
        회원가입
      </a>
    </div>
  </div>
</body>
</html>
