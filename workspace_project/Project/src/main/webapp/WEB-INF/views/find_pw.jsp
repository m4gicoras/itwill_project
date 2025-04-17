<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>

    <script> var contextPath = '<%= request.getContextPath() %>'; </script>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">

        <title>비밀번호 찾기</title>

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
            <main class="flex-grow flex items-center justify-center px-8 py-20">

                <div
                    class="bg-white py-16 px-6 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] w-full max-w-2xl flex flex-col items-center">
                    <h1 class="flex flex-col items-center justify-center text-4xl font-semibold mb-10"><span
                            class="kimm-bold text-blue-500">비밀번호 찾기</span></h1>

                    <form id="pwFindForm" action="http://localhost:8080/web/find_pw2" method="post"
                        class="flex flex-col items-center">
                        <!-- 아이디 -->
                        <div class="w-[400px] flex justify-left mt-4 mb-4">
                            <input id="username" name="username" type="text"
                                class="w-[300px] px-4 py-2 text-base border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
                                placeholder="ID" />

                        </div>


                        <!-- 이메일 입력창 + 버튼을 가로로 배치 -->
                        <div class="w-[400px] flex items-center mb-4">
                            <input id="emailInput" type="email"
                                class="w-[300px] px-4 py-2 text-base border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
                                placeholder="Email" />
                            <!-- 오른쪽 버튼 -->
                            <button type="button"
                                                                class="ml-4 btn"
                                                                onclick="validateInputs()"
                                                                style="margin-bottom: revert; width: revert;">
                                                          <span class="btn-text">전송</span>
                                                        </button>
                        </div>

                        <div class="w-[400px] flex items-center mb-4">
                            <input id="verifyInput" type="text"
                                class="w-[300px] px-4 py-2 text-base border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300"
                                placeholder="인증번호를 입력해주세요." />
                            <!-- 오른쪽 버튼 -->
                            <button type="button"
                                    class="ml-4 btn"
                                    onclick="checkVerificationCode()"
                                    style="margin-bottom: revert; width: revert;">
                              <span class="btn-text">확인</span>
                            </button>
                        </div>

                        <!-- 오류 메시지 (아래에 위치) -->
                        <div id="noInfoMsg" class="text-red-500 text-sm text-center hidden mt-4 w-[300px]">
                            회원정보가 존재하지 않습니다.
                        </div>

                        <!-- 비밀번호 찾기 버튼 -->
                        <button type="button" id="pwFindButton" onclick="checkPwFind()"
                            class="bg-blue-500 mt-10 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                            비밀번호 찾기
                        </button>
                    </form>

                </div>
                </div>

            </main>
        </body>

            <script src="<%= request.getContextPath() %>/resources/js/find.js"></script>

        </html>