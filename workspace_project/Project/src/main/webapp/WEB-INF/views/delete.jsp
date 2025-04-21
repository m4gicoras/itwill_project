<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>회원탈퇴</title>

  <!-- TailwindCSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- 웹폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

  <!-- 커스텀 폰트 및 체크박스 스타일 -->
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

    @keyframes bounce {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.1); }
    }

    .ios-checkbox {
      --checkbox-size: 24px;
      --checkbox-color: #3b82f6;
      --checkbox-bg: #dbeafe;
      --checkbox-border: #93c5fd;
    }

    .ios-checkbox input:checked + .checkbox-wrapper .checkbox-bg {
      background: var(--checkbox-color);
      border-color: var(--checkbox-color);
    }

    .ios-checkbox input:checked + .checkbox-wrapper .checkbox-icon {
      transform: scale(1);
    }

    .ios-checkbox input:checked + .checkbox-wrapper .check-path {
      stroke-dashoffset: 0;
    }

    .ios-checkbox input:focus + .checkbox-wrapper .checkbox-bg {
      box-shadow: 0 0 0 4px var(--checkbox-bg);
    }

    .ios-checkbox input:checked + .checkbox-wrapper {
      animation: bounce 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
  </style>
</head>

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white shadow-[0_8px_10px_rgba(0,123,255,0.1)] h-20 flex items-center px-8">
    <a href="/" class="text-2xl logo-font text-blue-900 select-none">Sellity</a>
  </header>

  <!-- ✅ Main -->
  <main class="flex flex-col items-center justify-center px-8 py-20">
  <div class="bg-white px-14 py-16 shadow-[0_10px_20px_rgba(0,123,255,0.2)] mt-10 select-none rounded-xl w-full max-w-3xl">
    <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10">
    <span class="kimm-bold text-blue-500">회원탈퇴</span></h1></h1>

      <form action="withdraw_process.jsp" method="post" class="space-y-8 py-10">

        <!-- 탈퇴 사유 -->
        <div class="space-y-4">
          <label for="reason" class="block font-semibold text-lg text-gray-700">*탈퇴 사유</label>
          <select id="reason" name="reason" class="w-full border border-gray-300 rounded-md p-3 text-sm focus:outline-none">
            <option value="reason1">서비스가 마음에 들지 않아서</option>
            <option value="reason2">더 이상 서비스를 사용하지 않아서</option>
            <option value="other">기타사유(직접 입력)</option>
          </select>
          <textarea
            id="other"
            name="other-reason"
            maxlength="2000"
            placeholder="자세한 사유를 입력해 주세요. (최대 2,000자 까지)"
            class="w-full h-40 border border-gray-300 rounded-md p-3 resize-none focus:outline-none text-sm"
          ></textarea>
        </div>

        <!-- 경고 문구 -->
        <div class="text-sm font-semibold bg-red-50 border-2 border-gray-200 text-red-800 text-center p-4 rounded-md">
          회원탈퇴 처리 후 회원님의 개인정보는 즉시 파기되어 복원할 수 없으며,<br>해당 아이디는 영구적으로 삭제 됩니다.
        </div>

        <!-- 동의 체크 -->
        <div class="flex items-center justify-center">
          <label class="ios-checkbox blue inline-flex items-center mb-10 cursor-pointer select-none" style="--checkbox-size: 20px">
            <input type="checkbox" id="agree" class="hidden" onchange="checkAgreement()" />
            <div class="checkbox-wrapper relative rounded-[8px] transition-transform duration-200 ease hover:scale-105 active:scale-95"
                 style="width: var(--checkbox-size); height: var(--checkbox-size);">
              <div class="checkbox-bg absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200 ease"
                   style="border-color: var(--checkbox-border);">
                <div class="checkbox-icon absolute m-auto text-white scale-none transition-all duration-200 ease"
                     style="width: 100%; height: 100%;">
                  <svg viewBox="0 0 24 24" fill="none">
                    <path class="check-path [transition:stroke-dashoffset_0.3s_ease_0.1s] [stroke-dasharray:40] [stroke-dashoffset:40]"
                          d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
                  </svg>
                </div>
              </div>
            </div>
            <span class="ml-2 text-sm">해당 내용을 모두 확인하였으며, 회원탈퇴에 동의합니다.</span>
          </label>
        </div>

        <!-- 버튼 -->
            <div class="w-full max-w-[500px] mx-auto">
              <div class="flex justify-center space-x-6">

           <!-- 회원 탈퇴 버튼 -->
               <button
                 type="button"
                 onclick="withdrawWithAgreement()"
                 class="w-1/4 px-6 py-2 bg-blue-500 text-white rounded-full shadow-lg hover:bg-blue-600 transition"
               >
                 회원 탈퇴
               </button>

               <!-- 취소 버튼 -->
               <button
                 type="button"
                 onclick="location.href='${pageContext.request.contextPath}/main'"
                 class="w-1/4 px-6 py-2 bg-gray-400 text-white rounded-full shadow-lg hover:bg-gray-500 transition"
               >
                 취소
               </button>


        </div>

      </form>
    </div>
  </main>

  <script>
    function withdrawWithAgreement() {
      const checkbox = document.getElementById('agree');
      if (!checkbox.checked) {
        alert("탈퇴에 동의하셔야 회원 탈퇴가 가능합니다.");
        return;
      }

      // 동의가 되었을 때 메인페이지로 이동
      window.location.href = "${pageContext.request.contextPath}/main";
    }
  </script>

</body>
</html>
