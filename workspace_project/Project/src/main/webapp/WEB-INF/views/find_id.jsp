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
    <a href="/" class="text-2xl logo-font text-blue-900 select-none">Sellity</a>
  </header>

  <!-- ✅ Main -->
  <main class="flex-grow flex items-center justify-center px-8 py-20">

    <div class="bg-white py-16 px-6 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] w-full max-w-xl flex flex-col items-center">
      <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10">
         <span class="kimm-bold text-blue-500">아이디 찾기</span></h1>

    <form id="findIdForm" action="${pageContext.request.contextPath}/find_id" method="POST" class="flex flex-col items-center w-full">
      <!-- forward() 메소드에 의해 서버 내부적으로 요청과 응답 객체가 유지된 채로 finish_id.jsp로 이동 (포워딩) -->

      <input type="hidden" id="verificationStatus" name="verificationStatus" value="not_completed">

      <!-- 이메일 + 전송 버튼 -->
      <div class="w-[400px] flex items-center mt-4 gap-2">
          <input
            id="emailInput"
            name="email"
            type="email"
            class="w-[300px] px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
            placeholder="Email"
            required
          />
          <button
            type="button"
            onclick="sendVerificationEmail()"
            class="w-[70px] font-semibold text-sm border-2 border-gray-200 bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full shadow-sm transition"
          >
            전송
          </button>
      </div>

      <!-- 인증번호 입력 + 확인 버튼 -->
      <div class="w-[400px] flex items-center gap-2 mt-6 mb-6">
        <input
          id="verifyInput"
          name="verificationCode"
          type="text"
          class="w-[300px] px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="인증번호를 입력해주세요"
          required
        />

        <button
          type="submit"
          class="w-[70px] font-semibold text-sm border-2 border-gray-200 bg-gray-100 text-gray-700 hover:bg-gray-200 px-4 py-2 rounded-full shadow-sm transition"
          onclick="checkVerificationCode()"
        >
          확인
        </button>
        </div>


      <!-- 인증 결과 메시지 -->
      <div class="relative w-[400px] flex items-center">
        <div id="successMsg" class="absolute top-full left-20 w-[300px] text-blue-500 text-sm hidden mt-1">
          인증이 완료되었습니다.
        </div>
        <div id="errorMsg" class=" absolute top-full left-16 w-[300px] text-red-500 text-sm hidden mt-1">
          인증번호가 일치하지 않습니다.
        </div>
      </div>


      <!-- 아이디 찾기 완료 버튼 -->
      <button
        type="submit"
        class="bg-blue-500 mt-10 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition"
      >
        아이디 찾기
      </button>
      </form>

    </div>

  </main>

  <script>

      const correctEmail = "3thirdp4rty@gmail.com";  // 예시 이메일
      const correctCode = "123456";  // 예시 인증번호

      let isEmailVerified = false;

      function sendVerificationEmail() {
              const email = document.getElementById("emailInput").value.trim();

              if (email === "") {
                alert("이메일을 입력해주세요.");
                return;
              }

              if (email !== correctEmail) {
                alert("존재하지 않는 이메일 입니다.");
              } else {
                alert("인증번호가 발송되었습니다. (예시: 1234)");
                // 실제로는 서버로 이메일 전송 및 인증번호 발송 로직 필요
              }
            }

            function checkVerificationCode() {
              const input = document.getElementById("verifyInput").value.trim();
              const successMsg = document.getElementById("successMsg");
              const errorMsg = document.getElementById("errorMsg");
              const verificationStatusInput = document.getElementById("verificationStatus"); // 숨겨진 필드 참조

              if (input === "") {
                alert("인증번호를 입력해주세요.");
                successMsg.classList.add("hidden");
                errorMsg.classList.add("hidden");
                return;
              }

              if (input !== correctCode) {
                successMsg.classList.add("hidden");
                errorMsg?.classList.remove("hidden");
                isEmailVerified = false;
                verificationStatusInput.value = "not_completed"; // 인증 실패 시 상태 유지
              } else {
                successMsg.classList.remove("hidden");
                errorMsg?.classList.add("hidden");
                isEmailVerified = true;
                verificationStatusInput.value = "completed"; // 인증 성공 시 상태 변경
                alert("인증이 완료되었습니다.");
              }
            }

            // 아이디 찾기 버튼 클릭 시 (submit 이벤트 발생 시)
            document.getElementById("findIdForm").addEventListener("submit", function(event) {
              const email = document.getElementById("emailInput").value.trim();
              const code = document.getElementById("verifyInput").value.trim();

              if (email === "" || code === "") {
                alert("이메일과 인증번호를 모두 입력해주세요.");
                event.preventDefault(); // 폼 제출 막기
                return;
              }

              if (!isEmailVerified) {
                alert("인증을 먼저 완료해주세요.");
                event.preventDefault(); // 폼 제출 막기
                return;
              }

              // 인증이 완료되면 FindIdServlet으로 form action에 의해 이동
            });

            window.onload = function () {
              const successMsg = document.getElementById("successMsg");
              const errorMsg = document.getElementById("errorMsg");

              var errorMessage = "${errorMessage}";
              var successMessage = "${successMessage}";

              if (errorMessage != "") {
                errorMsg.classList.remove("hidden");
                successMsg.classList.add("hidden");
              }

              if (successMessage != "") {
                successMsg.classList.remove("hidden");
                errorMsg.classList.add("hidden");
              }
            };

  </script>


</body>
</html>
