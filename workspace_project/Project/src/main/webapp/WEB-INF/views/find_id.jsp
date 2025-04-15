<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>아이디 찾기</title>

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

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white h-20 flex items-center px-8 shadow-[0_8px_16px_rgba(0,123,255,0.12)]">
    <a href="/" class="text-2xl logo-font text-black select-none">Sellity</a>
  </header>

  <!-- ✅ Main -->
  <main class="flex-grow flex items-center justify-center px-8 py-20">

    <div class="bg-white py-16 px-6 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] w-full max-w-xl flex flex-col items-center">
    <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10">
         <span class="kimm-bold text-blue-500">아이디 찾기</span></h1>

      <!-- 이름 -->
      <div class="w-[400px] mb-4">
        <input
          id="nameInput"
          type="text"
          class="w-[300px] px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="이름"
        />
      </div>

      <!-- 이메일 + 전송 버튼 -->
      <div class="w-[400px] flex items-center gap-2 mb-4 relative">
        <input
          id="emailInput"
          type="email"
          class="w-[300px] px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="이메일"
        />
        <button
          type="button"
          class="w-[70px] font-semibold text-sm border-2 border-gray-200 bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full shadow-sm transition"
          onclick="validateInputs()"
        >
          전송
        </button>

      <!-- 이메일 입력값이 비었을 때 오류 메시지 -->
      <div id="noInfoMsg" class="text-red-500 text-sm hidden mt-1 absolute top-full left-16 w-[300px]">
       회원정보가 존재하지 않습니다.
      </div>

    </div>

      <!-- 인증번호 + 재발송 버튼 -->
      <div class="w-[400px] flex items-center gap-2 mt-6 mb-6 relative">
        <input
          id="verifyInput"
          type="text"
          class="w-[300px] px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="인증번호를 입력해주세요."
        />
        <button
          type="button"
          class="w-[70px] font-semibold text-sm border-2 border-gray-200 bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full shadow-sm transition"
          onclick="checkVerificationCode()"
        >
          확인
        </button>

        <div id="errorMsg" class="text-red-500 text-sm hidden mt-1 absolute top-full left-16 w-[300px]">
          인증번호가 일치하지 않습니다.
        </div>
      </div>

      <!-- 아이디 찾기 버튼 -->
      <button
        type="submit"
        class="bg-blue-500 mt-10 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition"
      >
        아이디 찾기
      </button>

    </div>

    </div>


  </main>

  <script>
    // 실제 인증번호를 여기에 임시 하드코딩 (예: 서버에서 받은 값)
    const correctCode = "123456";

    // 이름과 이메일이 일치하는지 확인하는 함수
    function validateInputs() {
      const name = document.getElementById("nameInput").value;
      const email = document.getElementById("emailInput").value;
      const noInfoMsg = document.getElementById("noInfoMsg");

       // 이메일 또는 이름이 비어있다면 오류 메시지를 표시하고 함수를 종료
      if (name === "" || email === "") {
        noInfoMsg.classList.remove("hidden");
        return;  // 더 이상 진행x
      } else {
        noInfoMsg.classList.add("hidden");  // 메시지 숨기기
      }

      // 예시: 특정 이름과 이메일이 일치해야 한다고 가정
      const expectedName = "홍길동";  // 예시 이름
      const expectedEmail = "hong@example.com";  // 예시 이메일

      if (name !== expectedName || email !== expectedEmail) {
        alert("이름과 이메일이 일치하지 않습니다.");
      } else {
        // 이름과 이메일이 일치하면 인증 메일을 보냄
        sendVerificationEmail(email);
      }
    }

    function checkVerificationCode() {
      const input = document.getElementById("verifyInput").value;
      const errorMsg = document.getElementById("errorMsg");

      if (input !== correctCode) {
        errorMsg.classList.remove("hidden");
      } else {
        errorMsg.classList.add("hidden");
        alert("인증이 완료되었습니다.");
      }
    }

    // 인증 메일 전송을 알리는 함수 (실제로 메일을 보내는 것은 서버에서 처리해야 함)
    function sendVerificationEmail(email) {
      alert("입력하신 이메일(" + email + ")로 인증 메일을 전송했습니다.");
    }
  </script>


</body>
</html>