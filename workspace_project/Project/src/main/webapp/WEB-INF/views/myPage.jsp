<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">

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
    <main class="flex justify-center align-middle px-8 py-20">
      <div class="flex flex-col items-center ">
        <div class="py-20 px-10 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] flex flex-col items-center">
        <div class="text-4xl font-bold logo-font select-none text-blue-500 mb-10">마이페이지</div>
          <div class="flex flex-col gap-8 w-250">
              <!-- 프로필 섹션-->
              <div class="w-full rounded-md overflow-hidden border-2 border-zinc-200">
                <table class="w-full">
                  <!-- 왼쪽 - 프로필 이미지 구역 -->
                  <thead>
                    <tr class="border-b border-zinc-200 bg-gray-200"> <!-- 혹은 bg-zinc-200 -->
                      <th class="text-left px-8 py-3 font-semibold text-lg select-none">프로필</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="px-8 py-5 flex items-center space-x-10">
                        <div class="relative w-27 h-27 bg-blue-100 rounded-full flex items-center justify-center">
                          <!-- 프로필 이미지(임시) -->  
                          <svg class="w-10 h-10 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M10 10a4 4 0 100-8 4 4 0 000 8zm-6 8a6 6 0 0112 0H4z" />
                          </svg>
                          <!-- 수정 버튼 -->
                          <button class="absolute bottom-0 right-0 w-8 h-8 bg-white rounded-full p-1 shadow">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4.5 h-4.5 text-zinc-600 absolute top-1.5 right-1.5">
                              <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                            </svg>
                          </button>
                        </div>
                        <!-- 오른쪽 - 이메일, 이름 구역 -->
                        <div class="flex flex-col gap-2 select-none">
                          <p class="text-lg select-none">${user.nickname}</p>
                          <p class="text-zinc-500 select-none">${user.email}</p>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- 기본 정보 섹션 -->
              <div class="w-full rounded-md overflow-hidden border-2 border-zinc-200">
                <table class="w-full">
                  <thead>
                    <tr class="border-b border-zinc-200 bg-gray-200">
                      <th colspan="2" class="text-left px-8 py-3 font-semibold text-lg select-none">기본 정보</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">아이디</td>
                      <td class="select-none">${user.username}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">닉네임</td>
                      <td class="select-none">${user.nickname}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">이메일</td>
                      <td class="italic text-zinc-600 select-none">${user.email}</td>
                    </tr>
                    <tr class="border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">연락처</td>
                      <td class="select-none">${user.phone}</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <!-- 기업 정보 섹션 -->
              <div class="w-full rounded-md overflow-hidden border-2 border-zinc-200">
                <table class="w-full">
                  <thead>
                    <tr class="border-b border-zinc-200 bg-gray-200">
                      <th colspan="2" class="text-left px-8 py-3 font-semibold text-lg select-none">기업 정보</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">상호/법인명</td>
                      <td class="select-none">${user.companyName}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">대표자명</td>
                      <td class="select-none">${user.masterName}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">사업자등록번호</td>
                      <td class="select-none">${user.bregNum}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">대표 전화</td>
                      <td class="select-none">${user.companyPhone}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">주소</td>
                      <td class="select-none">${user.companyAddr}</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="flex justify-end mr-4">
                <!-- 정보 수정 버튼 --> 
                <button type="button" class="flex gap-3 items-center bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4.5 h-4.5 text-white">
                    <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                  </svg>
                  	정보 수정
                </button>
              </div>


              <!-- 계정 연동 섹션 -->
              <div class="w-full rounded-md overflow-hidden border-2 border-zinc-200">
                <table class="w-full">
                  <thead>
                    <tr class="border-b border-zinc-200 bg-gray-200">
                      <th class="text-left px-8 py-3 font-semibold text-lg select-none">계정 연동</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="border-b border-zinc-200">
                      <td class="px-8 py-3 flex items-center justify-between space-x-4">
                        <div class="flex gap-5 items-center">
                          <img src="${pageContext.request.contextPath}/resources/images/google01.png" class="w-6 h-6" alt="google" />
                          <div class="mr-5 select-none">Google</div>
                          <div class="text-zinc-700 select-none">temp@google.com</div>
                          <div class="text-xs text-zinc-500 select-none">연동일: <span>2015-03-11</span></div>
                        </div>
                        <button type="button" class="bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                          	연결끊기
                        </button>
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200">
                      <td class="px-8 py-3 flex items-center justify-between space-x-4">
                        <img src="${pageContext.request.contextPath}/resources/images/kakaoLogo01.png" class="w-6 h-6" alt="kakao" /> 
                        <div class="flex-1 text-gray-500 text-sm select-none">연결되지 않음</div>
                        <button type="button" class="bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                          	연동
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
        </div>
      </div>
    </main>
</body>
</html>