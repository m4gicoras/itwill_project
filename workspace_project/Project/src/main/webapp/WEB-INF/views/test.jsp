<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 구글 폰트 embed 코드 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap"
        rel="stylesheet">
</head>

<body class="bg-gray-100 flex" style="font-family: 'Noto Sans KR', sans-serif;">

    <!-- 사이드바 시작 -->
    <aside class="flex flex-col w-64 h-screen px-4 py-8 bg-purple-700 text-white">
        <!-- 로고 / 타이틀 영역 -->
        <div class="text-2xl font-bold mb-6">셀리티</div>

        <!-- 네비게이션 메뉴 -->
        <nav class="flex-1">
            <ul class="space-y-2">
                <!-- Dashboard -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <!-- 아이콘(임시) -->
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M3 7l6 6-6 6M21 7l-6 6 6 6"></path>
                        </svg>
                        <span>상품 목록</span>
                        <!-- 오른쪽 알림 배지 -->
                        <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">
                            5
                        </span>
                    </a>
                </li>

                <!-- Team -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M17 20h5v-2a4 4 0 00-3-3.87M9 11a4 4 0 110-8 4 4 0 010 8zm6 8a6 6 0 1112 0v2H9v-2a6 6 0 016-6z">
                            </path>
                        </svg>
                        <span>상품 등록</span>
                    </a>
                </li>

                <!-- Projects -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M9 17v-2H3V5h18v10h-6v2m-6 0v2H3v-2h6zm6 0v2h6v-2h-6z"></path>
                        </svg>
                        <span>입고 현황</span>
                        <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">
                            12
                        </span>
                    </a>
                </li>

                <!-- Calendar -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0
                  00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                        </svg>
                        <span>출고 현황</span>
                        <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">
                            20+
                        </span>
                    </a>
                </li>

                <!-- Documents -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h10M7 16h10M5 20h14a2 2 0 002-2V6a2 2
                  0 00-2-2H9l-4 4v12a2 2 0 002 2z"></path>
                        </svg>
                        <span>견적 현황</span>
                    </a>
                </li>

                <!-- Reports -->
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M9 17v-2H3V5h18v10h-6v2m-6 0v2H3v-2h6zm6 0v2h6v-2h-6z"></path>
                        </svg>
                        <span>정산 현황</span>
                    </a>
                </li>
            </ul>

            <!-- Your teams 구분선 
            <hr class="my-6 border-purple-500" />
            -->

            <!-- Your teams 라벨 
            <span class="text-xs font-semibold uppercase text-purple-200 mb-2 inline-block">
                Your teams
            </span>
            -->

            <!-- 팀 목록 
            <ul class="space-y-2">
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <span class="text-sm font-medium">Heroicons</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <span class="text-sm font-medium">Tailwind Labs</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                        <span class="text-sm font-medium">Workcation</span>
                    </a>
                </li>
            </ul>
            -->
        </nav>
    </aside>
    <!-- 사이드바 끝 -->

    <!-- 메인 컨텐츠 영역 (데모용) -->
    <main class="flex-1 p-8">
        <h1 class="text-3xl font-bold">Main Content Area</h1>
        <p class="mt-4">이곳에 실제 페이지 내용을 배치하세요.</p>
    </main>

</body>

</html>