<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>비밀번호 찾기</title>

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

          /* KIMM_Bold 폰트를 적용하는 부분 */
          .kimm-bold {
            font-family: 'KIMM_Bold', sans-serif;
          }

    </style>

</head>
<body>

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white h-20 flex items-center px-8 shadow-[0_8px_16px_rgba(0,123,255,0.12)]">
    <a href="/" class="text-2xl logo-font text-blue-900 select-none">Sellity</a>
  </header>

  <!-- ✅ Main -->
  <main class="flex-grow flex items-center justify-center px-8 py-20">

    <div class="bg-white py-16 px-6 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] w-full max-w-2xl flex flex-col items-center">
     <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10"><span class="kimm-bold text-blue-500">비밀번호 찾기</span></h1>

      <form id="pwFindForm" action="http://localhost:8080/web/find_pw2" method="post" class="flex flex-col items-center">
      <!-- 아이디 -->
       <div class="w-[400px] flex justify-center mt-4 mb-4">
        <input
           id="userId" name="userId"
           type="text"
           class="w-[300px] px-4 py-2 text-base border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
           placeholder="ID"
        />
      </div>

      <!-- 이메일 입력창 -->
      <div class="w-[400px] flex flex-col justify-center items-center mb-4">
        <input
          id="userEmail"
          type="email"
          class="w-[300px] px-4 py-2 text-base border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="Email"
        />

      </div>

      <!-- 비밀번호 찾기 버튼 -->
      <button
        type="button"
        onclick="validateAndSubmit()"
        class="bg-blue-500 mt-10 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition"
      >
        비밀번호 찾기
      </button>
      </form>

    </div>

  </main>

  <script>
    // 유효성 검사 및 폼 전송 함수
    function validateAndSubmit() {
      const id = document.getElementById("userId").value.trim();
      const email = document.getElementById("userEmail").value.trim();

      // 아이디와 이메일이 비어있는 경우
      if (!id || !email) {
        alert("아이디와 이메일을 작성해주세요.");
        return;  // 더 이상 진행하지 않음
      }

      // 가정: 아이디와 이메일이 일치하는지 확인 (예시 아이디와 이메일)
      const expectedId = "user123";  // 예시 아이디
      const expectedEmail = "user@example.com";  // 예시 이메일

      // 아이디와 이메일이 일치하지 않으면 오류 메시지 표시
      if (id !== expectedId || email !== expectedEmail) {
        alert("존재하지 않는 회원정보 입니다.");
        return;  // 더 이상 진행하지 않음
      }

      // 입력이 모두 올바르면 form 전송
      document.getElementById("pwFindForm").submit(); // ✅ 전송 ⭕
    }
  </script>

</body>
</html>