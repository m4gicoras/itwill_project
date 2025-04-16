<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>비밀번호 변경 완료</title>

  <!-- TailwindCSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- 웹폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
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
    </style>

</head>
<body>

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white h-20 flex items-center px-8 shadow-[0_8px_16px_rgba(0,123,255,0.12)]">
    <a href="/" class="text-2xl logo-font text-black select-none">Sellity</a>
  </header>

  <!-- ✅ Main -->
  <main class="flex-grow flex items-center justify-center px-8 py-20">
  <div class="bg-white shadow-[0_10px_20px_rgba(0,123,255,0.2)] py-16 px-6 select-none rounded-xl w-full max-w-2xl flex flex-col items-center">
  <img src="${pageContext.request.contextPath}/resources/images/finish_pw_image.png" alt="emoji" class="w-32 h-28 mb-6" />

  <!-- 텍스트 -->
      <p class="text-2xl font-semibold mb-2">비밀번호 변경 완료</p>
      <p class="text-lg text-gray-700">
        비밀번호 변경이 완료되었습니다.
      </p>
      <p class="text-lg text-gray-700 mb-6">
        새로운 비밀번호로 로그인해주세요.
      </p>

      <!-- 버튼 영역 -->
      <div class="flex flex-col space-y-4 mt-10">
        <!-- 메인페이지 이동 -->
        <a href="${pageContext.request.contextPath}/mainTest"
           class="px-6 py-2 bg-blue-500 text-white rounded-full shadow-md hover:bg-blue-600 transition text-center">
          로그인하러 가기
        </a>

    </div>
  </main>
</body>
</html>