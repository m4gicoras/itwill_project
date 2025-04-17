<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>아이디 찾기 완료</title>

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
      0%, 100% {
        transform: scale(1);
      }

      50% {
        transform: scale(1.1);
      }
    }
  </style>
</head>

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white shadow-[0_8px_10px_rgba(0,123,255,0.1)] h-20 flex items-center px-8">
    <a href="/" class="text-2xl logo-font text-blue-900 select-none">Sellity</a>
  </header>

    <main class="flex flex-col items-center justify-center w-full px-4 py-20">
    <div class="bg-white shadow-[0_10px_20px_rgba(0,123,255,0.2)] select-none py-16 px-6 rounded-xl w-full max-w-2xl flex flex-col items-center">

         <h2 class="text-xl font-semibold text-gray-800 mb-4">회원님의 아이디는</h2>

           <p class="text-2xl text-blue-500 font-bold mb-6">${userId} 입니다.</p>

  <div class="flex flex-col items-center justify-center w-full max-w-xs gap-4">
    <a href="${pageContext.request.contextPath}/mainTest" class="flex items-center justify-center bg-blue-500 mt-10 text-white w-1/2 px-6 py-2 rounded-full shadow-md hover:bg-blue-600 transition">
      로그인하러 가기
    </a>
    <a href="${pageContext.request.contextPath}/find_pw" class="flex items-center justify-center bg-gray-400 text-white w-1/2 px-6 py-2 rounded-full shadow-md hover:bg-gray-500 transition">
      비밀번호 찾기
    </a>
  </div>
</div>
</body>
</html>
