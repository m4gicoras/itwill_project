<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
  	<title>DashBoard</title>
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
  </head>

  <body style="font-family: 'Noto Sans KR', sans-serif;">

    <div class="dark:bg-background-900 flex h-full w-full bg-white">
      <div
        class="lg:!z-99 fixed !z-[99] min-h-full w-[300px] transition-all md:!z-[99] xl:!z-0 xl:block -translate-x-[120%] xl:translate-x-[unset]">
        <div
          class="rounded-lg border bg-card text-card-foreground shadow-sm m-3 ml-3 h-[96.5vh] w-full overflow-hidden !rounded-lg border-zinc-200 pe-4 dark:border-zinc-800 sm:my-4 sm:mr-4 md:m-5 md:mr-[-50px]">
          <div style="position: relative; overflow: hidden; width: 100%; height: 100%;">
            <div class="!translate-x-[5.5%] pr-4 xl:!-mr-8 xl:w-[calc(100%_+_20px)]"
              style="position: absolute; inset: 0px; overflow: scroll; margin-right: -15px; margin-bottom: -22px; width: 100%;">
              <div class="flex h-full flex-col justify-between">
                <div><span class="absolute top-4 block cursor-pointer text-zinc-200 dark:text-white/40 xl:hidden"><svg
                      stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 20 20" aria-hidden="true"
                      height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd"
                        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                        clip-rule="evenodd"></path>
                    </svg></span>
                  <div class="mt-8 flex items-center justify-center">

                    <h5 class="me-2 text-2xl font-bold leading-5 text-zinc-950 dark:text-white">Cellity
                    </h5>
                    <div
                      class="inline-flex items-center rounded-full border font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 my-auto w-max px-2 py-0.5 text-xs text-zinc-950 dark:border-none dark:bg-zinc-800 dark:text-white">
                      FREE</div>
                  </div>
                  <div class="mb-8 mt-8 h-px bg-zinc-200 dark:bg-white/10"></div>
                  <ul>
                    <div>
                      <div
                        class="flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-zinc-950 font-semibold text-white dark:bg-white dark:text-zinc-950">
                        <a class="undefined" href="/shadcn-nextjs-boilerplate/dashboard/main"
                          style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mr-3 mt-1.5 font-semibold text-white dark:text-zinc-950 ">
                                <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                                  aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                                  width="1em" xmlns="http://www.w3.org/2000/svg">
                                  <path stroke-linecap="round" stroke-linejoin="round"
                                    d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25">
                                  </path>
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-semibold text-white dark:text-zinc-950">
                                상품 목록</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div>
                      <div
                        class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="/shadcn-nextjs-boilerplate/dashboard/ai-chat"
                          style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white ">
                                <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                                  aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                                  width="1em" xmlns="http://www.w3.org/2000/svg">
                                  <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M8.25 3v1.5M4.5 8.25H3m18 0h-1.5M4.5 12H3m18 0h-1.5m-15 3.75H3m18 0h-1.5M8.25 19.5V21M12 3v1.5m0 15V21m3.75-18v1.5m0 15V21m-9-1.5h10.5a2.25 2.25 0 0 0 2.25-2.25V6.75a2.25 2.25 0 0 0-2.25-2.25H6.75A2.25 2.25 0 0 0 4.5 6.75v10.5a2.25 2.25 0 0 0 2.25 2.25Zm.75-12h9v9h-9v-9Z">
                                  </path>
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">
                                상품 등록</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div>
                      <div
                        class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 dark:text-zinc-400">
                        <a class="undefined" href="/shadcn-nextjs-boilerplate/dashboard/settings"
                          style="border-radius: 0px; width: 100%;">
                          <div class="w-full items-center justify-center">
                            <div class="flex w-full items-center justify-center">
                              <div class="svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white ">
                                <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                                  aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                                  width="1em" xmlns="http://www.w3.org/2000/svg">
                                  <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z">
                                  </path>
                                  <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"></path>
                                </svg>
                              </div>
                              <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">
                                입고 현황</p>
                            </div>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div
                      class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium">
                      <div class="w-full items-center justify-center">
                        <div class="flex w-full items-center justify-center">
                          <div class="svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white ">
                            <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                              aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                              width="1em" xmlns="http://www.w3.org/2000/svg">
                              <path stroke-linecap="round" stroke-linejoin="round"
                                d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z">
                              </path>
                            </svg>
                          </div>
                          <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">
                            출고
                            현황
                          </p>
                        </div>
                      </div>
                    </div>

                    <div
                      class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium">
                      <div class="w-full items-center justify-center">
                        <div class="flex w-full items-center justify-center">
                          <div class="svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white ">
                            <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                              aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                              width="1em" xmlns="http://www.w3.org/2000/svg">
                              <path stroke-linecap="round" stroke-linejoin="round"
                                d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z">
                              </path>
                            </svg>
                          </div>
                          <p class="mr-auto text-sm font-medium text-zinc-950 dark:text-zinc-400">
                            견적
                            현황
                          </p>
                        </div>
                      </div>
                    </div>
                    <div
                      class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium">
                      <div class="w-full items-center justify-center">
                        <div class="flex w-full items-center justify-center">
                          <div class="svg-item text mr-3 mt-1.5 text-zinc-950 dark:text-white">
                            <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                              aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em"
                              width="1em" xmlns="http://www.w3.org/2000/svg">
                              <path stroke-linecap="round" stroke-linejoin="round"
                                d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Z">
                              </path>
                            </svg>
                          </div>
                          <p class="mr-auto text-sm text-zinc-950 dark:text-white">정산 현황
                          </p>
                        </div>
                      </div>
                    </div>


                  </ul>
                </div>
                <div class="mb-9 mt-7">
                  <div class="flex justify-center">

                  </div>
                  <div class="mt-5 flex w-full items-center rounded-lg border border-zinc-200 p-4 dark:border-zinc-800">
                    <a href="/shadcn-nextjs-boilerplate/dashboard/dashboard/settings"><span
                        class="relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full min-h-10 min-w-10"><img
                          class="aspect-square h-full w-full" src=""></span></a><a
                      href="/shadcn-nextjs-boilerplate/dashboard/settings">
                      <p
                        class="ml-2 mr-3 flex items-center text-sm font-semibold leading-none text-zinc-950 dark:text-white">
                        m4gi</p>
                    </a>
                    <form class="w-full"><input type="hidden" value="/shadcn-nextjs-boilerplate/dashboard/main"
                        name="pathName"><button
                        class="whitespace-nowrap ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground ml-auto flex h-[40px] w-[40px] cursor-pointer items-center justify-center rounded-full p-0 text-center text-sm font-medium hover:dark:text-white"
                        type="submit"><svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24"
                          aria-hidden="true" class="h-4 w-4 stroke-2 text-zinc-950 dark:text-white" width="1em"
                          height="1em" color="inherit" xmlns="http://www.w3.org/2000/svg" style="color: inherit;">
                          <path stroke-linecap="round" stroke-linejoin="round"
                            d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9">
                          </path>
                        </svg></button></form>
                  </div>
                </div>
              </div>
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
      <nav
        class="fixed right-3 top-3 z-[0] flex w-[calc(100vw_-_6%)] flex-row items-center justify-between rounded-lg bg-white/30 py-2 backdrop-blur-xl transition-all dark:bg-transparent md:right-[30px] md:top-4 md:w-[calc(100vw_-_8%)] md:p-2 lg:w-[calc(100vw_-_6%)] xl:top-[20px] xl:w-[calc(100vw_-_365px)] 2xl:w-[calc(100vw_-_380px)]">
        <div class="ml-[6px]">

          <p class="text-md shrink capitalize text-zinc-950 dark:text-white md:text-3xl"><a
              class="font-bold capitalize hover:text-zinc-950 dark:hover:text-white" href="#"
              style="border-radius: 0px;">상품 목록</a></p>
        </div>
        <div class="w-[154px] min-w-max md:ml-auto md:w-[unset]">
          <div
            class="relative flex min-w-max max-w-max flex-grow items-center justify-around gap-1 rounded-lg md:px-2 md:py-2 md:pl-3 xl:gap-2">
            <button
              class="items-center justify-center whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer rounded-full border-zinc-200 p-0 text-xl text-zinc-950 dark:border-zinc-800 dark:text-white md:min-h-10 md:min-w-10 xl:hidden"><svg
                stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round"
                stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <line x1="21" y1="10" x2="3" y2="10"></line>
                <line x1="21" y1="6" x2="3" y2="6"></line>
                <line x1="21" y1="14" x2="3" y2="14"></line>
                <line x1="21" y1="18" x2="3" y2="18"></line>
              </svg></button><button
              class="items-center justify-center whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer rounded-full border-zinc-200 p-0 text-xl text-zinc-950 dark:border-zinc-800 dark:text-white md:min-h-10 md:min-w-10"><svg
                stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true"
                class="h-5 w-5 stroke-2" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z">
                </path>
              </svg></button><button
              class="items-center justify-center whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer rounded-full border-zinc-200 p-0 text-xl text-zinc-950 dark:border-zinc-800 dark:text-white md:min-h-10 md:min-w-10"
              type="button" id="radix-:re:" aria-haspopup="menu" aria-expanded="false" data-state="closed"><svg
                stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true"
                class="h-[20px] w-[20px] text-zinc-950 dark:text-white" height="1em" width="1em"
                xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="m11.25 11.25.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z">
                </path>
              </svg></button><button
              class="items-center justify-center whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border bg-background hover:bg-accent hover:text-accent-foreground flex h-9 min-w-9 cursor-pointer rounded-full border-zinc-200 p-0 text-xl text-zinc-950 dark:border-zinc-800 dark:text-white md:min-h-10 md:min-w-10"><svg
                stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true"
                class="h-4 w-4 stroke-2 text-zinc-950 dark:text-white" height="1em" width="1em"
                xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9">
                </path>
              </svg></button><a class="w-full" href="/shadcn-nextjs-boilerplate/dashboard/settings"><span
                class="relative flex w-10 shrink-0 overflow-hidden rounded-full h-9 min-w-9 md:min-h-10 md:min-w-10"><img
                  class="aspect-square h-full w-full"
                  src="https://lh3.googleusercontent.com/a/ACg8ocKu6HSZ3T2vl0KJnwiB5ZSGFdkZ01mz_MtheLzmVRqoIjHhdFs=s96-c"></span></a>
          </div>
        </div>
      </nav>

      <div class="mb-5 flex gap-5 flex-col xl:flex-row w-full mt-24 ml-4 mr-4 xl:ml-[332px] xl:mr-4">
        <div
          class="rounded-lg border bg-card text-card-foreground shadow-sm border-zinc-200 p-6 dark:border-zinc-800 w-full">
          <!-- 여기에 내용을 추가하세요 -->
          <div class="bg-white rounded shadow overflow-hidden">
            <table class="min-w-full text-gray-700">
              <thead class="bg-gray-200 border-b border-gray-300">
                <tr>
                  <th class="p-4 text-left">
                    <input type="checkbox">
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
			  <c:choose>
			    <c:when test="${not empty productList}">
			      <c:forEach var="p" items="${productList}">
			        <tr class="border-b hover:bg-gray-50 border-gray-300">
			          <td class="p-4"><input type="checkbox" /></td>
			          <td class="p-4 text-center">${p.product_id}</td>
			          <td class="p-4 text-center">${p.product_name}</td>
			          <td class="p-4 text-center">${p.product_qtty}</td>
			          <td class="p-4 text-center"><fmt:formatNumber value="${p.price}" type="number" /></td>
			          <td class="p-4 text-center">
			            <c:choose>
			              <c:when test="${not empty p.created_at}">
			                <fmt:formatDate value="${p.created_at}" pattern="yyyy-MM-dd" />
			              </c:when>
			              <c:otherwise>-</c:otherwise>
			            </c:choose>
			          </td>
			          <td class="pt-4 flex items-center">
			            <c:choose>
			              <c:when test="${p.status == 0}">
			                <span class="bg-green-100 text-green-700 px-2 py-1 rounded-md text-xs">정상</span>
			              </c:when>
			              <c:when test="${p.status == 1}">
			                <span class="bg-yellow-100 text-yellow-700 px-2 py-1 rounded-md text-xs">품절</span>
			              </c:when>
			              <c:when test="${p.status == 2}">
			                <span class="bg-orange-100 text-orange-700 px-2 py-1 rounded-md text-xs">소진 임박</span>
			              </c:when>
			              <c:when test="${p.status == 3}">
			                <span class="bg-red-100 text-red-700 px-2 py-1 rounded-md text-xs">단종</span>
			              </c:when>
			            </c:choose>
			          </td>
			        </tr>
			      </c:forEach>
			    </c:when>
			    <c:otherwise>
			      <tr>
			        <td colspan="8" class="text-center text-gray-500 p-4">등록된 상품이 없습니다.</td>
			      </tr>
			    </c:otherwise>
			  </c:choose>
			</tbody>
              
            </table>
          </div>

        </div>
      </div>
    </div>
  </body>

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