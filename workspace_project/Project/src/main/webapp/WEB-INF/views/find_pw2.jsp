<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>비밀번호 재설정</title>

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

    <div class="bg-white shadow-[0_10px_20px_rgba(0,123,255,0.2)] select-none py-16 px-6 rounded-xl w-full max-w-2xl flex flex-col items-center">
     <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10">
     <span class="kimm-bold text-blue-500">비밀번호 재설정</span></h1>

     <form action="${pageContext.request.contextPath}/resetPassword"
            method="post"
            class="flex flex-col items-center">

    <%  // 세션에서 가져오기
        String userId = (String) session.getAttribute("resetUsername");
    %>

      <!-- 새로운 비밀번호 -->
       <div class="w-[300px] flex flex-col items-center space-y-2 mt-6 mb-4">
       <label class="w-[300px] block font-semibold text-left text-base text-gray-700">새 비밀번호</label>
        <input
           id="newPassword"
           name="newPassword"
           type="password"
           class="w-[300px] px-4 py-2 border border-gray-300 text-sm rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
           placeholder="특수문자를 1개 이상 포함한 8~20자리"
        />

            <!-- 비밀번호 유효성 오류 -->
            <div id="pwFormatError" class="hidden text-red-500 text-sm text-center w-[300px]">
              비밀번호를 다시 입력해주세요.
            </div>
      </div>

      <!-- 새로운 비밀번호 재입력 -->
      <div class="w-[300px] flex flex-col items-center space-y-2 mb-4">
      <label class="w-[300px] block font-semibold text-left text-base text-gray-700">새 비밀번호 확인</label>
        <input
          id="confirmPassword"
          name="confirmPassword"
          type="password"
          class="w-[300px] px-4 py-2 border border-gray-300 text-sm rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
          placeholder="비밀번호를 다시 입력해 주세요"
        />

        <!-- 비밀번호 불일치 오류 -->
        <div id="pwMatchError" class="hidden text-red-500 text-sm text-center w-[300px]">
          비밀번호가 일치하지 않습니다.
        </div>

      </div>

      <!-- 비밀번호 변경하기 버튼 -->
      <button
       type="submit"
       class="bg-blue-500 mt-10 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition"
       >
         변경하기
       </button>
      </form>
    </div>
   </div>
  </main>

</body>
</html>