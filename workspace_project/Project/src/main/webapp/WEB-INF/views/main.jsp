<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>

    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- TailwindCSS 4.0 -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 구글 폰트 embed 코드 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
      rel="stylesheet">

        <style>
        * {
            box-sizing: border-box;
        }

        @font-face {
            font-family: 'KIMM_Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        body {
            font-weight: 300;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            position: relative;
        }

        /* ✅ 배경 블러 처리 영역 */
        .background-blur {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('<%= request.getContextPath() %>/resources/images/mainPage01.png');
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            z-index: -1;
        }

        .login-container {
            position: absolute;

            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(4px);

            border-radius: 12px;
            color: white;
            width: 100%;
            height: auto;
            max-width: 400px;

            /* 너무 넓어지지 않도록 최대 한도 지정 */
            min-width: 250px;

            /* 너무 좁아지지 않도록 최소 한도도 설정 가능 */
            padding: 2rem;

            /* rem은 전체적으로 일관된 크기 유지 */
            text-align: center;
            padding: 2rem;
            
            border: 2px solid rgba(255, 255, 255, 0.2);
            /* 흐릿한 테두리 */

            box-shadow: 0 0 30px rgba(255, 255, 255, 0.2);
            /* 외곽에 연한 빛 번짐 */
        }

        .title {
            font-family: 'KIMM_Bold', sans-serif;
            font-size: 2.5em;
            font-weight: bold;
            margin-bottom: 1em;
            margin-top: 1em;
            user-select: none;
        }

        .subtitle {
            font-family: 'KIMM_Bold', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2em;
            margin-bottom: 1.5em;
            color: white;
            user-select: none;
        }

        .subtitle .line {
            flex: 0 0 110px;
            /* grow:0, shrink:0, basis:40px */
            height: 3px;
            background-color: white;
            margin: 0 10px;
            opacity: 0.5;
        }

        .form-element {
            width: 90%;
            padding: 12px;
            font-size: 15px;
            border-radius: 6px;
            box-sizing: border-box;
            margin-bottom: 1em;
            line-height: 1.2;
            height: 44px;
        }

        input.form-element {
            border: none;
            background-color: #ffffff;
            font-weight: 300;
            color: #222222;
        }

        input.form-element::placeholder {
            color: #666;
            /* 약간 더 밝은 회색 */
        }

        input:focus {
            outline: none;
            /* 기본 outline 제거 */
            border: 2px solid #aac8ff;
            /* 색상 변경 가능 */
            box-shadow: 0 0 5px rgba(170, 200, 255, 0.5);
        }

        input.form-element,
        button.form-element {
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            /* 아래 방향 부드러운 그림자 */
        }

        .remember-container {
            user-select: none;

            display: flex;
            align-items: center;
            justify-content: flex-end;

            width: 80%;

            margin-bottom: 25px;
            margin-top: 15px;

            padding-right: 10px;

        }

        .rememberId {
            vertical-align: middle;
            margin-right: 5px;
            /* 체크박스와 텍스트 간격 조정 */

        }

        .remember-container label {
            position: relative;
            right: -50px;

            white-space: nowrap;

            font-size: 13px;
            /* 텍스트 크기 조절 */
            line-height: normal;
            /* 높낮이 균형 조절 */

        }

        .find-links {
            margin-top: 1em;
            font-size: 0.9em;
            margin-bottom: 1.5em;
            font-weight: 300;

        }

        .find-links a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;

        }

        @keyframes bounce {

            0%,
            100% {
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

        /* Color Themes */
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

        /* Checked State */
        .ios-checkbox input:checked+.checkbox-wrapper .checkbox-bg {
            background: var(--checkbox-color);
            border-color: var(--checkbox-color);
            border: none;
        }

        .ios-checkbox input:checked+.checkbox-wrapper .checkbox-icon {
            transform: scale(1);
        }

        .ios-checkbox input:checked+.checkbox-wrapper .check-path {
            stroke-dashoffset: 0;
        }

        /* Focus Styles */
        .ios-checkbox input:focus+.checkbox-wrapper .checkbox-bg {
            box-shadow: 0 0 0 4px var(--checkbox-bg);
        }

        /* Animation */
        .ios-checkbox input:checked+.checkbox-wrapper {
            animation: bounce 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
    </style>
    </head>

    <body style="font-family: 'Noto Sans KR', sans-serif;">
        <!-- ✅ 배경 블러 처리된 영역 -->
        <div class="background-blur"></div>

        <!-- 로그인 폼 -->
        <div class="login-container">
            <h1 class="title">SELLITY</h1>
            <h2 class="subtitle">
                <span class="line"></span>
                Login
                <span class="line"></span>
            </h2>

            <form id="login-form" class="login-form">
                <div class="input-group">
                    <input type="text" id="username" name="username" placeholder="ID" class="form-element">
                </div>

                <!-- 비밀번호 입력 필드 바로 아래에 에러 메시지 출력 영역 추가 -->
				<div class="input-group relative">
				  <input type="password" id="password" name="password" placeholder="Password" class="form-element">
				  <!-- 에러 메시지가 삽입될 컨테이너 (처음에는 숨김 처리) -->
				  <div id="password-error" class="hidden mt-2">
				    <span class="text-red-500 text-sm">계정 정보가 일치하지 않습니다</span>
				  </div>
				</div>

                <div class="remember-container flex items-center justify-between">
  <!-- 회원가입 관련 영역 (텍스트 클릭 시 이동) -->
  <div class="register mr-6 text-[13px] cursor-pointer"
       onclick="location.href='${pageContext.request.contextPath}/signup'">
    아이디가 없으신가요?
  </div>
  
  <!-- 아이디 저장 체크박스 영역 -->
  <label class="ios-checkbox blue inline-flex items-center cursor-pointer select-none">
    <input type="checkbox" class="hidden" />
    <div class="checkbox-wrapper relative rounded-[8px] transition-transform duration-200 ease hover:scale-105 active:scale-95"
         style="width: var(--checkbox-size); height: var(--checkbox-size);">
      <div class="checkbox-bg absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200 ease"
           style="width: var(--checkbox-size); height: var(--checkbox-size); border-color: var(--checkbox-border);">
        <div class="checkbox-icon absolute m-auto text-white scale-none transition-all duration-200 ease"
             style="width: 100%; height: 100%;">
          <svg viewBox="0 0 24 24" fill="none">
            <path class="check-path [transition:stroke-dashoffset_0.3s_ease_0.1s] [stroke-dasharray:40] [stroke-dashoffset:40]" d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
          </svg>
        </div>
      </div>
    </div>
    <span class="ml-2">아이디 저장</span>
  </label>
</div>

                <button type="submit"
        class="mx-auto w-[90%] shadow-xl/20 p-3 text-[15px] box-border mb-4 leading-[1.2] h-11 relative flex items-center px-6 py-3 overflow-hidden font-medium transition-all bg-blue-500 ring-2 ring-blue-500/10 rounded-full group">
  <span
    class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full bg-blue-600 rounded-md group-hover:translate-x-0"></span>
  <span class="relative w-full cursor-pointer text-white transition-colors duration-200 ease-in-out group-hover:text-white">
    로그인
  </span>
</button>
            </form>

            <div class="find-links">
                <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
            </div>
        </div>
        
        <script>
  document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('login-form').addEventListener('submit', function(event) {
      event.preventDefault(); // 기본 폼 제출 방지

      // 폼 데이터 수집
      const formData = new FormData(this);
      const username = formData.get('username');
      const password = formData.get('password');
      
      console.log(username);
      console.log(password);

      // fetch()를 이용해 AJAX로 로그인 검증 요청 (URL은 실제 엔드포인트로 변경)
      fetch('${pageContext.request.contextPath}/login', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
    	  console.log("서버 응답 : ", data);
        if (data.success) {
          // 로그인 성공 시 대시보드(성공url)로 이동
          //window.location.href = data.redirect;
          window.location.href = "${pageContext.request.contextPath}/dashboard";
        } else {
          // 로그인 실패 시 에러 메시지 표시 (TailwindCSS 클래스 활용)
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