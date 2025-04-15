<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sellity - 메인 페이지</title>

  <!-- TailwindCSS 2.0 -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- 구글 폰트 embed 코드 추가 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap" rel="stylesheet">

  <style>
    @font-face {
      font-family: 'KIMM_Bold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }

    /* html, body의 높이 설정 */
    html, body {
      height: 100%;
      margin: 0;
      overflow: hidden; /* 불필요한 스크롤 방지 */
      font-family: 'Noto Sans KR', sans-serif; /* 기본 폰트 설정 */
    }

    /* 배경 이미지 및 블러 처리 */
    .background-blur {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-image: url('<%= request.getContextPath() %>/resources/images/mainPage01.png');
      background-size: cover;
      background-position: center;
      filter: blur(5px); /* 블러 효과 */
      z-index: -1; /* 배경이 로그인 폼 아래로 가도록 설정 */
    }

    /* KIMM_Bold 폰트를 적용하는 부분 */
    .kimm-bold {
      font-family: 'KIMM_Bold', sans-serif;
    }

    /* 애니메이션 효과 */
    @keyframes bounce {
      0%, 100% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.1);
      }
    }

    .ios-checkbox {
      --checkbox-size: 24px;
      --checkbox-color: #3b82f6;
      --checkbox-bg: #dbeafe;
      --checkbox-border: #93c5fd;
    }

    /* 체크박스 색상 설정 */
    .ios-checkbox.blue {
      --checkbox-color: #3b82f6;
      --checkbox-bg: #dbeafe;
      --checkbox-border: #93c5fd;
    }

    .ios-checkbox.green {
      --checkbox-color: #10b981;
      --checkbox-bg: #d1fae5;
      --checkbox-border: #6ee7b7;
    }

    .ios-checkbox.purple {
      --checkbox-color: #8b5cf6;
      --checkbox-bg: #ede9fe;
      --checkbox-border: #c4b5fd;
    }

    .ios-checkbox.red {
      --checkbox-color: #ef4444;
      --checkbox-bg: #fee2e2;
      --checkbox-border: #fca5a5;
    }

    /* 체크된 상태 */
    .ios-checkbox input:checked + .checkbox-wrapper .checkbox-bg {
      background: var(--checkbox-color);
      border-color: var(--checkbox-color);
      border: none;
    }

    .ios-checkbox input:checked + .checkbox-wrapper .checkbox-icon {
      transform: scale(1);
    }

    .ios-checkbox input:checked + .checkbox-wrapper .check-path {
      stroke-dashoffset: 0;
    }

    /* Focus Styles */
    .ios-checkbox input:focus + .checkbox-wrapper .checkbox-bg {
      box-shadow: 0 0 0 4px var(--checkbox-bg);
    }

    /* 애니메이션 */
    .ios-checkbox input:checked + .checkbox-wrapper {
      animation: bounce 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

  </style>
</head>

<body>
  <!-- 배경 블러 처리된 영역 -->
  <div class="background-blur"></div>

  <!-- 로그인 폼 -->
  <div class="login-container absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 backdrop-blur-lg text-white rounded-xl p-8 max-w-sm w-full border-2 border-white/30 shadow-2xl z-10"
       style="background-color: rgba(255, 255, 255, 0.2); backdrop-filter: blur(4px); box-shadow: 0 0 50px rgba(255, 255, 255, 0.4);">

    <!-- Sellity 제목에만 KIMM_Bold 폰트 적용 -->
    <h1 class="title text-4xl font-extrabold text-center select-none kimm-bold" style="margin-top: 1em; margin-bottom: 1em;">SELLITY</h1>

    <!-- Login 제목에만 KIMM_Bold 폰트 적용 -->
    <h2 class="subtitle text-xl font-semibold flex justify-center items-center mb-6 kimm-bold select-none">
      <span class="line flex-1 h-0.5 bg-white opacity-50"></span>  <!-- 선 굵기를 h-2로 변경 -->
      <span class="mx-3">Sign in</span>
      <span class="line flex-1 h-0.5 bg-white opacity-50"></span>  <!-- 선 굵기를 h-2로 변경 -->
    </h2>

    <form id="login-form" class="flex flex-col items-center">
      <div class="input-group mb-4 w-full">
        <input type="text" id="username" name="username" placeholder="ID" class="w-full p-3 text-sm rounded-md shadow-md bg-white text-black focus:ring-2 focus:ring-blue-300 placeholder-gray-500 focus:outline-none">
      </div>

      <div class="input-group relative mb-4 w-full">
        <input type="password" id="password" name="password" placeholder="Password" class="w-full p-3 text-sm rounded-md shadow-md bg-white text-black focus:ring-2 focus:ring-blue-300 placeholder-gray-500 focus:outline-none">
        <div id="password-error" class="hidden text-red-500 text-sm mt-2">계정 정보가 일치하지 않습니다</div>
      </div>

      <!-- 회원가입 관련 영역 -->
      <div class="remember-container flex justify-between w-full mt-6 mb-6">
        <div class="register text-sm cursor-pointer" onclick="location.href='<%= request.getContextPath() %>/signup'">아이디가 없으신가요?</div>

      <div class="remember-container flex items-center text-sm">
        <label class="ios-checkbox blue inline-flex items-center cursor-pointer select-none" style="--checkbox-size: 20px;">
          <input type="checkbox" class="hidden" onchange="checkAgreement()" />
          <div class="checkbox-wrapper relative rounded-[8px] transition-transform duration-200 ease hover:scale-105 active:scale-95"
               style="width: var(--checkbox-size); height: var(--checkbox-size);">
            <div class="checkbox-bg absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200 ease border-blue-500"
                 style="width: var(--checkbox-size); height: var(--checkbox-size); border-color: var(--checkbox-border);">
              <div class="checkbox-icon absolute m-auto text-white scale-none transition-all duration-200 ease"
                   style="width: 100%; height: 100%;">
                <svg viewBox="0 0 24 24" fill="none">
                  <path class="check-path [transition:stroke-dashoffset_0.3s_ease_0.1s] [stroke-dasharray:40] [stroke-dashoffset:40]" d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
                </svg>
              </div>
            </div>
          </div>
        </label>
        <span class="ml-2 text-sm">아이디 저장</span>
      </div>
    </div>


      <button type="submit"
              class="w-11/12 p-3 bg-blue-500 text-white rounded-full shadow-lg mb-4 transition-all hover:bg-blue-600 focus:outline-none kimm-bold">
       Sign in
      </button>
    </form>



    <!-- 소셜 로그인 버튼을 나란히 배치하는 div -->
    <div class="flex space-x-4 justify-center mt-2 mb-4">
      <!-- 구글 로그인 버튼 (G 로고 이미지) -->
      <a href="https://accounts.google.com/signin" class="flex items-center justify-center w-12 h-12 bg-white rounded-full shadow-md transition-all focus:outline-none">
        <img src="<%= request.getContextPath() %>/resources/images/google01.png" alt="Google" class="w-8 h-8 object-cover rounded-full" />
      </a>

      <!-- 카카오 로그인 버튼 -->
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=YOUR_APP_KEY&redirect_uri=YOUR_REDIRECT_URI&response_type=code"
         class="flex items-center justify-center w-12 h-12 rounded-full shadow-md transition-all focus:outline-none">
        <img src="<%= request.getContextPath() %>/resources/images/kakaoLogo01.png" alt="Kakao" class="w-full h-full object-cover rounded-full" />
      </a>
    </div>

    <div class="find-links text-sm text-white text-center" style="margin-top: 1em; margin-bottom: 1.5em;">
      <a href="#" class="hover:underline">아이디 찾기</a>
      <span class="mx-2">|</span>
      <a href="#" class="hover:underline">비밀번호 찾기</a>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      document.getElementById('login-form').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        const formData = new FormData(this);
        const username = formData.get('username');
        const password = formData.get('password');

        console.log(username);
        console.log(password);

        fetch('<%= request.getContextPath() %>/login', {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(data => {
          if (data.success) {
            window.location.href = data.redirect;
          } else {
            document.getElementById('password-error').classList.remove('hidden');
          }
        })
        .catch(error => {
          console.error('로그인 요청 에러:', error);
        });
      });
    });
  </script>
</body>
</html>
