<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sellity - 메인 페이지</title>

  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

  <!-- 구글 폰트 embed 코드 추가 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">
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

  </style>
</head>

<body>
  <!-- 배경 블러 처리된 영역 -->
  <div class="background-blur"></div>

    <!-- 로그인 폼 -->
    <div class="login-container absolute top-1/2 left-1/2 select-none transform -translate-x-1/2 -translate-y-1/2 backdrop-blur-lg text-white rounded-xl p-8 max-w-sm w-full border-2 border-white/30 shadow-2xl z-10"
         style="background-color: rgba(255, 255, 255, 0.3); backdrop-filter: blur(4px); box-shadow: 0 0 50px rgba(255, 255, 255, 0.4);">

      <!-- Sellity 제목에만 KIMM_Bold 폰트 적용 -->
      <h1 class="title text-4xl font-extrabold text-center text-blue-900 kimm-bold" style="margin-top: 1em; margin-bottom: 1em;">SELLITY</h1>

    <!-- Login 제목에만 KIMM_Bold 폰트 적용 -->
    <h2 class="subtitle text-xl font-semibold flex justify-center items-center mb-6 kimm-bold">
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
      <div class="remember-container flex items-center justify-between w-full mt-4 mb-6">
        <div class="register text-sm cursor-pointer" onclick="location.href='<%= request.getContextPath() %>/signup'">아이디가 없으신가요?</div>

      <div class="remember-container flex justify-center items-center text-sm">
        <div class="checkbox-container flex justify-center items-center">
                <label class="ios-checkbox blue">
                    <input type="checkbox" name="keep-id" />
                    <div class="checkbox-wrapper flex justify-center items-center">
                        <div class="checkbox-bg"></div>
                        <svg fill="none" viewBox="0 0 24 24" class="checkbox-icon">
                            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="3" stroke="currentColor"
                                d="M4 12L10 18L20 6" class="check-path"></path>
                        </svg>
                    </div>
                </label>
            </div>
        <span class="ml-2 text-sm">로그인 상태 유지</span>
      </div>
    </div>


      <button type="submit" class="btn-effect kimm-bold">
                      <span class="btn-text">Sign in</span>
      </button>
    </form>

    <!-- 소셜 로그인 버튼을 나란히 배치하는 div -->
    <div class="flex space-x-4 justify-center mt-2 mb-4">
      <!-- 구글 로그인 버튼 (SVG) -->
      <a href="https://accounts.google.com/signin" class="flex items-center justify-center w-12 h-12 bg-white rounded-full shadow-md transition-all">
        <svg viewBox="0 0 512 512" class="w-8 h-8" xmlns="http://www.w3.org/2000/svg">
          <g>
            <path d="M42.4,145.9c15.5-32.3,37.4-59.6,65-82.3c37.4-30.9,80.3-49.5,128.4-55.2c56.5-6.7,109.6,4,158.7,33.4 c12.2,7.3,23.6,15.6,34.5,24.6c2.7,2.2,2.4,3.5,0.1,5.7c-22.3,22.2-44.6,44.4-66.7,66.8c-2.6,2.6-4,2.4-6.8,0.3 c-64.8-49.9-159.3-36.4-207.6,29.6c-8.5,11.6-15.4,24.1-20.2,37.7c-0.4,1.2-1.2,2.3-1.8,3.5c-12.9-9.8-25.9-19.6-38.7-29.5 C72.3,169,57.3,157.5,42.4,145.9z" fill="#E94335"/>
            <path d="M126,303.8c4.3,9.5,7.9,19.4,13.3,28.3c22.7,37.2,55.1,61.1,97.8,69.6c38.5,7.7,75.5,2.5,110-16.8 c1.2-0.6,2.4-1.2,3.5-1.8c0.6,0.6,1.1,1.3,1.7,1.8c25.8,20,51.7,40,77.5,60c-12.4,12.3-26.5,22.2-41.5,30.8 c-43.5,24.8-90.6,34.8-140.2,31C186.3,501.9,133,477.5,89,433.5c-19.3-19.3-35.2-41.1-46.7-66c10.7-8.2,21.4-16.3,32.1-24.5 C91.6,329.9,108.8,316.9,126,303.8z" fill="#34A853"/>
            <path d="M429.9,444.9c-25.8-20-51.7-40-77.5-60c-0.6-0.5-1.2-1.2-1.7-1.8c8.9-6.9,18-13.6,25.3-22.4 c12.2-14.6,20.3-31.1,24.5-49.6c0.5-2.3,0.1-3.1-2.2-3c-1.2,0.1-2.3,0-3.5,0c-40.8,0-81.7-0.1-122.5,0.1 c-4.5,0-5.5-1.2-5.4-5.5c0.2-29,0.2-58,0-87c0-3.7,1-4.7,4.7-4.7c74.8,0.1,149.6,0.1,224.5,0c3.2,0,4.5,0.8,5.3,4.2 c6.1,27.5,5.7,55.1,2,82.9c-3,22.2-8.4,43.7-16.7,64.5c-12.3,30.7-30.4,57.5-54.2,80.5C431.6,443.8,430.7,444.3,429.9,444.9z" fill="#4285F3"/>
            <path d="M126,303.8c-17.2,13.1-34.4,26.1-51.6,39.2c-10.7,8.1-21.4,16.3-32.1,24.5C34,352.1,28.6,335.8,24.2,319 c-8.4-32.5-9.7-65.5-5.1-98.6c3.6-26,11.1-51,23.2-74.4c15,11.5,29.9,23.1,44.9,34.6c12.9,9.9,25.8,19.7,38.7,29.5 c-2.2,10.7-5.3,21.2-6." fill="#FFC107"/>
          </g>
        </svg>
      </a>

      <!-- 카카오 로그인 버튼 (SVG) -->
      <a href="https://kauth.kakao.com/oauth/authorize?client_id=YOUR_APP_KEY&redirect_uri=YOUR_REDIRECT_URI&response_type=code"
         class="flex items-center justify-center w-12 h-12 rounded-full shadow-md bg-yellow-300 transition-all focus:outline-none">
        <svg viewBox="0 0 512 512" class="w-8 h-8" xmlns="http://www.w3.org/2000/svg">
          <path fill="#000000" d="M255.5 48C299.345 48 339.897 56.5332 377.156 73.5996C414.415 90.666 443.871 113.873 465.522 143.22C487.174 172.566 498 204.577 498 239.252C498 273.926 487.174 305.982 465.522 335.42C443.871 364.857 414.46 388.109 377.291 405.175C340.122 422.241 299.525 430.775 255.5 430.775C241.607 430.775 227.262 429.781 212.467 427.795C148.233 472.402 114.042 494.977 109.892 495.518C107.907 496.241 106.012 496.15 104.208 495.248C103.486 494.706 102.945 493.983 102.584 493.08C102.223 492.177 102.043 491.365 102.043 490.642V489.559C103.126 482.515 111.335 453.169 126.672 401.518C91.8486 384.181 64.1974 361.2 43.7185 332.575C23.2395 303.951 13 272.843 13 239.252C13 204.577 23.8259 172.566 45.4777 143.22C67.1295 113.873 96.5849 90.666 133.844 73.5996C171.103 56.5332 211.655 48 255.5 48Z"/>
        </svg>
      </a>
    </div>

    <div class="find-links text-sm text-white text-center" style="margin-top: 1em; margin-bottom: 1.5em;">
      <a href="find_id" class="hover:underline">아이디 찾기</a>
      <span class="mx-2">|</span>
      <a href="find_pw" class="hover:underline">비밀번호 찾기</a>
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