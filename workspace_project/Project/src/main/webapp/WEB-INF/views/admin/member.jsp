<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- TailwindCSS 4.0 -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 구글 폰트 embed 코드 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap" rel="stylesheet" />
  </head>

  <body style="font-family: 'Noto Sans KR', sans-serif;">
    <!-- 사이드 바 -->
    <div class="dark:bg-background-900 flex h-full w-full bg-white">
      <div class="fixed !z-[99] min-h-full w-[300px] -translate-x-[120%] transition-all md:!z-[99] lg:!z-99 xl:!z-0 xl:block xl:translate-x-[unset]">
        <div class="bg-card text-card-foreground m-3 ml-3 h-[96.5vh] w-full overflow-hidden !rounded-lg rounded-lg border border-zinc-200 pe-4 shadow-sm sm:my-4 sm:mr-4 md:m-5 md:mr-[-50px] dark:border-zinc-800">
          <div style="position: relative; overflow: hidden; width: 100%; height: 100%;">
            <div class="!translate-x-[5.5%] pr-4 xl:!-mr-8 xl:w-[calc(100%_+_20px)]" style="position: absolute; inset: 0px; overflow: scroll; margin-right: -15px; margin-bottom: -22px; width: 100%;">
              <div class="flex h-full flex-col justify-between">
                <div>
                  <span class="absolute top-4 block cursor-pointer text-zinc-200 xl:hidden dark:text-white/40"
                    ><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 20 20" aria-hidden="true" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg
                  ></span>
                  <!-- 페이지 명 -->
                  <div class="mt-8 flex items-center justify-center">
                    <h5 class="me-2 text-2xl leading-5 font-bold text-zinc-950">Sellity</h5>

                  </div>
                  <div class="mt-8 mb-8 h-px bg-zinc-200 dark:bg-white/10"></div>
                  <!-- 사이드 바 리스트 -->
                  <ul>
                    <div>
                      <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="${pageContext.request.contextPath}/admin/product" style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mt-1.5 mr-3 text-zinc-950 dark:text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
                                </svg>                                
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">물품 관리</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div>
                      <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="${pageContext.request.contextPath}/admin/member" style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mt-1.5 mr-3 text-zinc-950 dark:text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" />
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">회원 관리</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div>
                      <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="${pageContext.request.contextPath}/admin/notification" style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mt-1.5 mr-3 text-zinc-950 dark:text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">알림 전송</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div>
                      <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="#" style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mt-1.5 mr-3 text-zinc-950 dark:text-white">
                                <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z"></path>
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"></path>
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">설정</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                  </ul>
                </div>
                <!-- 사이드 바 하단 내용 -->
                <div class="mt-7 mb-9">
                  <div class="flex justify-center"></div>
                  <div class="mt-5 flex w-full items-center rounded-lg border border-zinc-200 p-4 dark:border-zinc-800">
                    <a href="/shadcn-nextjs-boilerplate/dashboard/dashboard/settings"
                      ><span class="relative flex h-10 min-h-10 w-10 min-w-10 shrink-0 overflow-hidden rounded-full"><img class="aspect-square h-full w-full" src="" /></span></a
                    ><a href="/shadcn-nextjs-boilerplate/dashboard/settings">
                      <p class="mr-3 ml-2 flex items-center text-sm leading-none font-semibold text-zinc-950 dark:text-white">m4gi</p>
                    </a>
                    <form class="w-full">
                      <input type="hidden" value="/shadcn-nextjs-boilerplate/dashboard/main" name="pathName" /><button class="ring-offset-background focus-visible:ring-ring border-input bg-background hover:bg-accent hover:text-accent-foreground ml-auto flex h-[40px] w-[40px] cursor-pointer items-center justify-center rounded-full border p-0 text-center text-sm font-medium whitespace-nowrap transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 hover:dark:text-white" type="submit">
                        <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-4 w-4 stroke-2 text-zinc-950 dark:text-white" width="1em" height="1em" color="inherit" xmlns="http://www.w3.org/2000/svg" style="color: inherit;">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9"></path>
                        </svg>
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <!-- 뭔지 모르겠음 - 사이드바 하단에 위치 -->
            <div style="position: absolute; height: 6px; transition: opacity 200ms; opacity: 0; right: 2px; bottom: 2px; left: 2px; border-radius: 3px;">
              <div style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;"></div>
            </div>
            <div class="xl:pr-3.5" style="position: absolute; width: 6px; transition: opacity 200ms; opacity: 0; max-width: 100%; background: transparent; bottom: 2px; top: 2px; border-radius: 3px; right: 0px;">
              <div style="position: relative; display: block; width: 100%; border-radius: 15px; height: 855px; transform: translateY(0px);"></div>
            </div>
          </div>
        </div>
      </div>
      <!-- 상단 바 -->
      <nav class="fixed top-3 right-3 z-[0] flex w-[calc(100vw_-_6%)] flex-row items-center justify-between rounded-lg bg-white/30 py-2 backdrop-blur-xl transition-all md:top-4 md:right-[30px] md:w-[calc(100vw_-_8%)] md:p-2 lg:w-[calc(100vw_-_6%)] xl:top-[20px] xl:w-[calc(100vw_-_365px)] 2xl:w-[calc(100vw_-_380px)] dark:bg-transparent">
        <div class="ml-[6px]">
          <p class="text-md shrink text-zinc-950 capitalize md:text-3xl dark:text-white"><a class="font-bold capitalize hover:text-zinc-950 dark:hover:text-white" href="#" style="border-radius: 0px;">상품 목록</a></p>
        </div>
        <div class="w-[154px] min-w-max md:ml-auto md:w-[unset]">
          <div class="relative flex max-w-max min-w-max flex-grow items-center justify-around gap-1 rounded-lg md:px-2 md:py-2 md:pl-3 xl:gap-2">
            <button class="ring-offset-background focus-visible:ring-ring bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer items-center justify-center rounded-full border border-zinc-200 p-0 text-xl font-medium whitespace-nowrap text-zinc-950 transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 md:min-h-10 md:min-w-10 xl:hidden dark:border-zinc-800 dark:text-white">
              <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <line x1="21" y1="10" x2="3" y2="10"></line>
                <line x1="21" y1="6" x2="3" y2="6"></line>
                <line x1="21" y1="14" x2="3" y2="14"></line>
                <line x1="21" y1="18" x2="3" y2="18"></line>
              </svg></button
            ><button class="ring-offset-background focus-visible:ring-ring bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer items-center justify-center rounded-full border border-zinc-200 p-0 text-xl font-medium whitespace-nowrap text-zinc-950 transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 md:min-h-10 md:min-w-10 dark:border-zinc-800 dark:text-white">
              <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-5 w-5 stroke-2" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z"></path>
              </svg></button
            ><button class="ring-offset-background focus-visible:ring-ring bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer items-center justify-center rounded-full border border-zinc-200 p-0 text-xl font-medium whitespace-nowrap text-zinc-950 transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 md:min-h-10 md:min-w-10 dark:border-zinc-800 dark:text-white" type="button" id="radix-:re:" aria-haspopup="menu" aria-expanded="false" data-state="closed">
              <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-[20px] w-[20px] text-zinc-950 dark:text-white" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" d="m11.25 11.25.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z"></path>
              </svg></button
            ><button class="ring-offset-background focus-visible:ring-ring bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer items-center justify-center rounded-full border border-zinc-200 p-0 text-xl font-medium whitespace-nowrap text-zinc-950 transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 md:min-h-10 md:min-w-10 dark:border-zinc-800 dark:text-white">
              <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-4 w-4 stroke-2 text-zinc-950 dark:text-white" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9"></path>
              </svg></button
            ><a class="w-full" href="/shadcn-nextjs-boilerplate/dashboard/settings"
              ><span class="relative flex h-9 w-10 min-w-9 shrink-0 overflow-hidden rounded-full md:min-h-10 md:min-w-10"><img class="aspect-square h-full w-full" src="https://lh3.googleusercontent.com/a/ACg8ocKu6HSZ3T2vl0KJnwiB5ZSGFdkZ01mz_MtheLzmVRqoIjHhdFs=s96-c" /></span
            ></a>
          </div>
        </div>
      </nav>

      <!-- 메인 컨텐츠 -->
      <div class="mt-24 mr-4 mb-5 ml-4 flex w-full flex-col gap-5 xl:mr-4 xl:ml-[332px] xl:flex-row">
        <div class="bg-card text-card-foreground w-full rounded-lg border border-zinc-200 p-6 shadow-sm dark:border-zinc-800">
          <!-- 테이블 -->
          <div class="overflow-hidden rounded bg-white shadow">
            <table class="min-w-full text-gray-700">
              <thead class="border-b border-gray-300 bg-gray-200">
                <tr>
                  <th class="p-4 text-left">
                    <input type="checkbox" />
                  </th>
                  <th class="p-4 text-center">상품코드</th>
                  <th class="p-4 text-center">상품명</th>
                  <th class="p-4 text-center">수량</th>
                  <th class="p-4 text-center">판매가격</th>
                  <th class="p-4 text-center">재고수량</th>
                  <th class="p-4 text-center">등록일</th>
                  <!-- 상태 컬럼 -->
                  <th class="p-4 text-left">상태</th>
                  <!-- 세로 점 3개 아이콘 컬럼 -->
                </tr>
              </thead>
              <tbody>
                <!-- 예시 1: 정상 -->
                <tr class="border-b border-gray-300 hover:bg-gray-50">
                  <td class="p-4">
                    <input type="checkbox" />
                  </td>
                  <td class="p-4 text-center">A-001</td>
                  <td class="p-4 text-center">Washing Bottle 2</td>
                  <td class="p-4 text-center">20</td>
                  <td class="p-4 text-center">320,000</td>
                  <td class="p-4 text-center">10</td>
                  <td class="p-4 text-center">2015-03-21</td>
                  <td class="flex items-center pt-4">
                    <span class="translate-x-4 transform rounded-md bg-green-100 px-2 py-1 text-xs font-medium text-green-700 inset-ring"> 정상 </span>
                    <button class="ml-auto flex h-full items-center">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5h.01M12 12h.01M12 19h.01"></path>
                      </svg>
                    </button>
                  </td>
                </tr>

                <!-- 예시 2: 재고없음 -->
                <tr class="border-b border-gray-300 hover:bg-gray-50">
                  <td class="p-4">
                    <input type="checkbox" />
                  </td>
                  <td class="p-4 text-center" p-4="">A-002</td>
                  <td class="p-4 text-center">Washing Bottle</td>
                  <td class="p-4 text-center">32</td>
                  <td class="p-4 text-center">120,000</td>
                  <td class="p-4 text-center">8</td>
                  <td class="p-4 text-center">2015-03-22</td>
                  <td class="flex items-center pt-4">
                    <!-- 재고없음 배지 
                                    <span
                                        <class="inline-block px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-700">-->
                    <span class="translate-x-4 transform rounded-md bg-yellow-100 px-2 py-1 text-xs font-medium text-pink-700 inset-ring inset-ring-yellow-500"> 재고없음 </span>
                    <button class="ml-auto flex h-full items-center">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5h.01M12 12h.01M12 19h.01"></path>
                      </svg>
                    </button>
                  </td>
                </tr>

                <!-- 예시 3: 단종 -->
                <tr class="border-b border-gray-300 hover:bg-gray-50">
                  <td class="p-4">
                    <input type="checkbox" />
                  </td>
                  <td class="p-4 text-center">A-003</td>
                  <td class="p-4 text-center">Sample Product</td>
                  <td class="p-4 text-center">10</td>
                  <td class="p-4 text-center">90,000</td>
                  <td class="p-4 text-center">0</td>
                  <td class="p-4 text-center">2015-03-23</td>
                  <td class="flex items-center pt-4">
                    <!-- 단종 배지 
                    <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-700">-->
                    <span class="translate-x-4 transform rounded-md bg-red-100 px-2 py-1 text-xs font-medium text-pink-700 inset-ring"> 단종 </span>
                    <button class="ml-auto flex h-full items-center">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5h.01M12 12h.01M12 19h.01"></path>
                      </svg>
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>

  <!-- 사이드 바 마우스 효과 -->
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const menuItems = document.querySelectorAll('.menu-item');
      menuItems.forEach(item => {
        item.addEventListener('mouseenter', function () {
          // 부모 요소 클래스 변경 (hover 상태)
          this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-zinc-950 font-semibold text-white dark:bg-white dark:text-zinc-950";
          // 하위 p 태그 클래스 변경
          const pElement = this.querySelector('p');
          if (pElement) {
            pElement.className = "mr-auto text-sm font-semibold text-white dark:text-zinc-950";
          }
          // 하위 svg-item 클래스 요소 변경
          const svgElement = this.querySelector('.svg-item');
          if (svgElement) {
            svgElement.className = "svg-item text mr-3 mt-1.5 font-semibold text-white dark:text-zinc-950";
          }
        });
        item.addEventListener('mouseleave', function () {
          // 부모 요소 클래스 원복 (hover 상태 해제)
          this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400";
          // 하위 p 태그 클래스 원복
          const pElement = this.querySelector('p');
          if (pElement) {
            pElement.className = "mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400";
          }
          // 하위 svg-item 클래스 요소 원복
          const svgElement = this.querySelector('.svg-item');
          if (svgElement) {
            svgElement.className = "svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white";
          }
        });
      });
    });
  </script>
</html>
