<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html>

    <head>

        <script>
            var contextPath = '<%= request.getContextPath() %>';
        </script>

        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- TailwindCSS 4.0 -->
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <!-- 구글 폰트 embed 코드 추가 -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m4gi.css">
        <style>
            /* KIMM_Bold 폰트를 적용하는 부분 */

            @font-face {
                font-family: 'KIMM_Bold';
                src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
                font-weight: 700;
                font-style: normal;
            }

            .kimm-bold {
                font-family: 'KIMM_Bold', sans-serif !important;
            }
        </style>
    </head>

    <body style="font-family: 'Noto Sans KR', sans-serif;">
        <!-- 페이지 전체 레이아웃 -->
        <div class="flex h-screen w-full bg-white select-none">
            <!-- 사이드바 div (고정 위치) -->
            <div
                class="fixed !z-[99] min-h-full w-[300px] -translate-x-[120%] transition-all md:!z-[99] lg:!z-99 xl:!z-0 xl:block xl:translate-x-[unset]">
                <!-- 사이드바 내부 디자인 -->
                <div
                    class="bg-card text-card-foreground m-3 ml-3 h-[96.5vh] w-full overflow-hidden rounded-lg border border-zinc-200 pe-4 shadow-sm sm:my-4 sm:mr-4 md:m-5 md:mr-[-50px] ">
                    <div style="position: relative; overflow: hidden; width: 100%; height: 100%;">
                        <div class="!translate-x-[5.5%] pr-4 xl:!-mr-8 xl:w-[calc(100%_+_20px)]"
                            style="position: absolute; inset: 0px; overflow: scroll; margin-right: -15px; margin-bottom: -22px; width: 100%;">
                            <!-- 사이드 바 내부 div -->
                            <div class="flex h-full flex-col justify-between">
                                <!-- 사이드 바 상단 메뉴 div -->
                                <!-- 로고  -->
                                <div>
                                    <span class="absolute top-4 block cursor-pointer text-zinc-200 xl:hidden ">
                                        <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                            viewBox="0 0 20 20" aria-hidden="true" height="1em" width="1em"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                                clip-rule="evenodd"></path>
                                        </svg></span>
                                    <div class="mt-8 flex items-center justify-center">
                                        <h5 class="kimm-bold text-center text-4xl font-extrabold select-none">Sellity
                                        </h5>
                                    </div>
                                    <div class="mt-8 mb-8 h-px bg-zinc-200 "></div>
                                    <!-- 메뉴 -->
                                    <ul>
                                        <div
                                            class="flex w-full max-w-full items-center justify-between rounded-lg bg-zinc-950 py-3 pl-8 font-semibold text-white ">
                                            <a class="undefined" href="<%=request.getContextPath()%>/main"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div
                                                            class="svg-item text mt-1.5 mr-3 font-semibold text-white ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25">
                                                                </path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-semibold text-white ">상품 목록</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div
                                            class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ">
                                            <a class="undefined" href="<%=request.getContextPath()%>/add_product"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div class="svg-item text mt-1.5 mr-3 text-zinc-950 ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M8.25 3v1.5M4.5 8.25H3m18 0h-1.5M4.5 12H3m18 0h-1.5m-15 3.75H3m18 0h-1.5M8.25 19.5V21M12 3v1.5m0 15V21m3.75-18v1.5m0 15V21m-9-1.5h10.5a2.25 2.25 0 0 0 2.25-2.25V6.75a2.25 2.25 0 0 0-2.25-2.25H6.75A2.25 2.25 0 0 0 4.5 6.75v10.5a2.25 2.25 0 0 0 2.25 2.25Zm.75-12h9v9h-9v-9Z">
                                                                </path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-medium text-zinc-950 ">상품 등록</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div
                                            class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ">
                                            <a href="<%=request.getContextPath()%>/inbound"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div class="svg-item text mt-1.5 mr-3 text-zinc-950 ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z">
                                                                </path>
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"></path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-medium text-zinc-950 ">입고 현황</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div
                                            class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium">
                                            <a href="<%=request.getContextPath()%>/outbound"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div class="svg-item text mt-1.5 mr-3 text-zinc-950 ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z">
                                                                </path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-medium text-zinc-950 ">출고 현황</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div
                                            class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ">
                                            <a href="<%=request.getContextPath()%>/estimates"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div class="svg-item text mt-1.5 mr-3 text-zinc-950 ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z">
                                                                </path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-medium text-zinc-950 ">견적 현황</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div
                                            class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ">
                                            <a href="<%=request.getContextPath()%>/settlementStatus"
                                                style="border-radius: 0px; width: 100%;">
                                                <div class="w-full items-center justify-center">
                                                    <div class="flex w-full items-center justify-center">
                                                        <div class="svg-item text mt-1.5 mr-3 text-zinc-950 ">
                                                            <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                                viewBox="0 0 24 24" aria-hidden="true"
                                                                class="-mt-[7px] h-4 w-4 stroke-2 text-inherit"
                                                                height="1em" width="1em"
                                                                xmlns="http://www.w3.org/2000/svg">
                                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                                    d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Z">
                                                                </path>
                                                            </svg>
                                                        </div>
                                                        <p class="mr-auto text-sm font-medium text-zinc-950 ">정산 현황</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </ul>
                                </div>

                                <!-- 사이드바 하단 프로필 -->
                                <div class="mt-7 mb-9">
                                    <div class="flex justify-center"></div>
                                    <div class="mt-5 flex w-full items-center rounded-lg border border-zinc-200 p-4 ">
                                        <a href="/shadcn-nextjs-boilerplate/dashboard/dashboard/settings">
                                            <span
                                                class="relative flex h-10 min-h-10 w-10 min-w-10 shrink-0 overflow-hidden rounded-full profile">
                                                </span>
                                        </a>
                                        <a href="/shadcn-nextjs-boilerplate/dashboard/settings">
                                            <p
                                                class="mr-3 ml-2 flex items-center text-sm leading-none font-semibold text-zinc-950 ">
                                                m4gi</p>
                                        </a>
                                        <form action="<%=request.getContextPath()%>/logout" method="post"
                                            class="w-full">
                                            <button
                                                class="ring-offset-background focus-visible:ring-ring border-zinc-200 bg-background hover:bg-accent hover:text-accent-foreground ml-auto flex h-[40px] w-[40px] cursor-pointer items-center justify-center rounded-full border p-0 text-center text-sm font-medium whitespace-nowrap transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
                                                type="submit">
                                                <svg stroke="currentColor" fill="none" stroke-width="1.5"
                                                    viewBox="0 0 24 24" aria-hidden="true"
                                                    class="h-6 w-6 stroke-2 text-zinc-950 " width="1em" height="1em"
                                                    color="inherit" xmlns="http://www.w3.org/2000/svg"
                                                    style="color: inherit;">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9">
                                                    </path>
                                                </svg>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- 사이드 바 내부 div -->
                        </div>

                        <div
                            style="position: absolute; height: 6px; transition: opacity 200ms; opacity: 0; right: 2px; bottom: 2px; left: 2px; border-radius: 3px;">
                            <div
                                style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;">
                            </div>
                        </div>
                        <div class="xl:pr-3.5"
                            style="position: absolute; width: 6px; transition: opacity 200ms; opacity: 0; max-width: 100%; background: transparent; bottom: 2px; top: 2px; border-radius: 3px; right: 0px;">
                            <div
                                style="position: relative; display: block; width: 100%; border-radius: 15px; height: 855px; transform: translateY(0px);">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- 상단 바 -->
            <nav
                class="fixed top-3 right-3 z-[999] flex w-[calc(100vw_-_6%)] flex-row items-center justify-between rounded-lg bg-white/30 py-2 backdrop-blur-xl transition-all md:top-4 md:right-[30px] md:w-[calc(100vw_-_8%)] md:p-2 lg:w-[calc(100vw_-_6%)] xl:top-[20px] xl:w-[calc(100vw_-_365px)] 2xl:w-[calc(100vw_-_380px)]">
                <!-- 페이지명 -->
                <div class="ml-[6px]">
                    <p class="text-md shrink text-zinc-950 capitalize md:text-3xl">
                        <a class="font-bold capitalize hover:text-zinc-950" href="#" style="border-radius: 0px;">상품
                            목록</a>
                    </p>
                </div>
                <!-- 상단바 오른쪽 파트 -->
                <div class="w-[154px] min-w-max md:ml-auto md:w-[unset]">
                    <div
                        class="relative flex max-w-max min-w-max flex-grow items-center justify-around gap-1 rounded-lg md:px-2 md:py-2 md:pl-3 xl:gap-2">
                        <div class="flex items-center gap-2">
                            <!-- 검색 박스 전용 래퍼 (크기 고정) -->
                            <div class="relative flex-shrink-0 w-[40px] h-[40px]">
                                <!-- 검색 박스 컨테이너 (absolute) -->
                                <div class="search-container absolute top-0 right-0">
                                    <!-- 검색 아이콘 -->
                                    <div class="search-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            class="fill-white" viewBox="0 0 24 24">
                                            <path
                                                d="M18.9,16.776A10.539,10.539,0,1,0,16.776,18.9l5.1,5.1L24,21.88ZM10.5,18A7.5,7.5,0,1,1,18,10.5,7.507,7.507,0,0,1,10.5,18Z" />
                                        </svg>
                                    </div>
                                    <!-- 입력창 -->
                                    <input type="text" class="search-input" />
                                    <!-- 드롭다운 -->
                                    <div class="search-dropdown">
                                        <ul class="dropdown-list">
                                            <li class="dropdown-item"></li>
                                            <li class="dropdown-item"></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <a href="<%=request.getContextPath()%>/notification/list"
                                class="relative flex h-10 w-10 px-2 items-center justify-center rounded-full border border-zinc-200 hover:bg-accent hover:text-accent-foreground transition-colors">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
                                    class="h-6 w-6 stroke-2 text-zinc-950">
                                    <path
                                        d="M224 0c-17.7 0-32 14.3-32 32v19.2C119 66 64 130.6 64 208v25.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416h400c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm0 96c61.9 0 112 50.1 112 112v25.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V208c0-61.9 50.1-112 112-112zm64 352h-128c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7 33.3-6.7 45.3-18.7S288 465 288 448z" />
                                </svg>
                                <span
                                    class="absolute -top-1 -right-1 flex h-5 w-5 items-center justify-center rounded-full bg-red-500 text-xs font-bold text-white leading-none">3</span>
                            </a>
                            <button
                                class="ring-offset-background focus-visible:ring-ring bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer items-center justify-center rounded-full border border-zinc-200 p-0 text-xl font-medium whitespace-nowrap text-zinc-950 transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 md:min-h-10 md:min-w-10 ">
                                <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                                    aria-hidden="true" class="h-6 w-6 stroke-2 text-zinc-950 " height="1em" width="1em"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9">
                                    </path>
                                </svg>
                            </button>
                            <a class="w-full" href="<%=request.getContextPath()%>/myPage">
                                <span
                                    class="relative flex h-9 w-10 min-w-9 shrink-0 overflow-hidden rounded-full md:min-h-10 md:min-w-10 profile">

                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- 테이블 -->
            <div class="mt-24 mr-4 mb-5 ml-4 flex w-full flex-col gap-5 xl:mr-4 xl:ml-[332px] xl:flex-row">
                <div class="bg-card text-card-foreground w-full rounded-lg border border-zinc-200 p-6 shadow-sm ">
                    <!-- 여기에 내용을 추가하세요 -->
                    <div class="box-border h-[calc(100vh-6rem-6rem)] overflow-auto rounded bg-white shadow pr-2 pb-4">
                        <table class="min-w-full text-gray-700">
                            <thead class="bg-gray-200">
                                <!-- ② 이 tr 을 sticky 로 만든다 -->
                                <tr class="sticky top-0 bg-gray-200 z-10">
                                    <th class="p-4 text-left"><input type="checkbox" /></th>
                                    <th class="p-4 text-center">상품코드</th>
                                    <th class="p-4 text-center">이미지</th>
                                    <th class="p-4 text-center">상품명</th>
                                    <th class="p-4 text-center">수량</th>
                                    <th class="p-4 text-center">단가</th>
                                    <th class="p-4 text-center">등록일</th>
                                    <th class="p-4 text-left">상태</th>
                                </tr>
                            </thead>
                            <tbody id="Products">
                                <!-- AJAX로 동적 삽입 -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>

<script src="<%= request.getContextPath() %>/resources/js/dashboard.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/alarm.js"></script>
</html>


