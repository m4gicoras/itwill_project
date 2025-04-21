<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="${pageContext.request.contextPath}/resources/css/m4gi.css" rel="stylesheet" />
    <style>
        @font-face {
            font-family: 'KIMM_Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        .logo-font {
            font-family: 'KIMM_Bold', sans-serif;
        }
    </style>
    <script>
	  // 모달창 관련 코드
	  function openModal(modalId) {
         const modal = document.getElementById(modalId);

         modal.classList.remove("hidden");
         clickOutsideOfModal(modalId);
       }

       function closeModal(modalId) {
    	const modal = document.getElementById(modalId);
	     	if (modal) {
	     		modal.classList.add("hidden");
	     	}
	    }
    </script>
</head>

<body style="font-family: 'Noto Sans KR', sans-serif;">
    <!-- 사이드 바 -->
    <div class="flex h-full w-full bg-white">
        <div class="fixed !z-[99] min-h-full w-[300px] -translate-x-[120%] transition-all md:!z-[99] lg:!z-99 xl:!z-0 xl:block xl:translate-x-[unset]">
            <div class="bg-card text-card-foreground m-3 ml-3 h-[96.5vh] w-full overflow-hidden !rounded-lg rounded-lg border border-zinc-200 pe-4 shadow-sm sm:my-4 sm:mr-4 md:m-5 md:mr-[-50px]">
                <div class="relative overflow-hidden w-full h-full">
                    <div class="!translate-x-[5.5%] pr-4 absolute inset-0 overflow-scroll -mr-[15px] -mb-[22px]">
                        <div class="flex h-full flex-col justify-between">
                            <div>
                                <!-- 페이지 명 -->
                                <div class="mt-15 mb-10 flex items-center justify-center">
                                    <h5 class="me-2 logo-font text-4xl leading-5 font-bold text-blue-900 select-none">Sellity</h5>
                                </div>
                                <div class="mt-8 mb-8 h-px bg-zinc-200 "></div>
                                <!-- 사이드 바 리스트 -->
                                <ul>
									<div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950">
									    <a class="undefined rounded-none w-full select-none" href="${pageContext.request.contextPath}/admin/product">
									        <div class="w-full items-center justify-center">
									            <div class="flex w-full items-center justify-center">
									                <div class="svg-item text mt-1.5 mr-3 text-zinc-950">
									                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
									                        <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
									                    </svg>
									                </div>
									                <p class="mr-auto text-sm font-medium text-zinc-950">물품 관리</p>
									            </div>
									        </div>
									    </a>
									</div>
                                    <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950">
	                                    <a class="undefined rounded-none w-full select-none" href="${pageContext.request.contextPath}/admin/member">
	                                        <div class="w-full items-center justify-center">
	                                            <div class="flex w-full items-center justify-center">
	                                                <div class="svg-item text mt-1.5 mr-3 text-zinc-950">
	                                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
	                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" />
	                                                    </svg>
	                                                </div>
	                                                <p class="mr-auto text-sm font-medium text-zinc-950">회원 관리</p>
	                                            </div>
	                                        </div>
	                                    </a>
                                    </div>
                                    <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950">
										<a class="undefined rounded-none w-full select-none" href="${pageContext.request.contextPath}/admin/notificationTable">
										    <div class="w-full items-center justify-center">
										        <div class="flex w-full items-center justify-center">
										            <div class="svg-item text mt-1.5 mr-3 text-zinc-950">
										                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
										                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
										                </svg>
										            </div>
										            <p class="mr-auto text-sm font-medium text-zinc-950">알림 관리</p>
										        </div>
										    </div>
										</a>
                                     </div>
                                     <!-- <div class="menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950">
                                        <a class="undefined rounded-none w-full select-none" href="#">
                                            <div class="w-full items-center justify-center">
                                                <div class="flex w-full items-center justify-center">
                                                    <div class="svg-item text mt-1.5 mr-3 text-zinc-950">
                                                        <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                                            <path stroke-linecap="round" stroke-linejoin="round" d="M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.559.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.894.149c-.424.07-.764.383-.929.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.398.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.165-.398.143-.854-.108-1.204l-.526-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894Z"></path>
                                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"></path>
                                                        </svg>
                                                    </div>
                                                    <p class="mr-auto text-sm font-medium text-zinc-950">설정</p>
                                                </div>
                                            </div>
                                        </a>
                                     </div> -->
                                </ul>
                            </div>

                            <!-- 사이드 바 하단 내용 -->
                            <div class="mb-9">
                                <div class="flex w-full items-center rounded-lg border border-zinc-200 p-4">
                                    <a href="/shadcn-nextjs-boilerplate/dashboard/dashboard/settings">
                                        <span class="relative flex h-[40px] min-h-10 w-[40px] min-w-10 mr-1 shrink-0 overflow-hidden rounded-full">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="0.5" stroke="currentColor" class="h-[40px] w-[40px]">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                            </svg>
                                        </span>
                                    </a>
                                    <a href="/shadcn-nextjs-boilerplate/dashboard/settings">
                                        <p class="mr-3 ml-2 flex items-center text-sm leading-none font-semibold text-zinc-950 select-none">admin</p>
                                    </a>
                                    <form class="w-full">
                                        <!-- 로그아웃? -->
                                        <input type="hidden" value="/shadcn-nextjs-boilerplate/dashboard/main" name="pathName" />
                                        <button class="ring-offset-background text-zinc-500 focus-visible:ring-ring border-input bg-background hover:bg-accent hover:text-accent-foreground ml-auto flex h-[40px] w-[40px] cursor-pointer items-center justify-center rounded-full border p-0 text-center text-sm font-medium whitespace-nowrap transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50" type="submit">
                                            <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-4 w-4 stroke-2 text-zinc-950" width="1em" height="1em" color="inherit" xmlns="http://www.w3.org/2000/svg" style="color: inherit;">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 메인 컨텐츠 -->
        <div class="mx-5 my-4 flex w-full flex-col gap-5 xl:mr-4 xl:ml-[332px]">
            <div class="flex flex-col justify-center items-center min-h-[90vh]">
                <!-- 테두리 -->
                <div class="bg-card text-card-foreground w-full rounded-lg border border-zinc-200 shadow-sm">
                    <section class="bg-white rounded-xl p-8 mx-auto">
                    	<div class="flex gap-4">
                    		<div class="pt-1.5">
		                    	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
								  <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
								</svg>
							</div>
	                        <h2 class="text-2xl font-bold mb-8 select-none">알림 전송</h2>
	                    </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                            <!-- Left Side -->
                            <div class="flex flex-col">
                              <div class="flex gap-2 mb-3 h-10">
                                  <input type="text" id="companyInput" placeholder="기업명" class="flex-1 border border-gray-300 rounded-md px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-300">
				                  <button onclick="closeModal('ConfirmProductDeleteModal'); openModal('deleteSuccessModal');"  type="button" class="btn mx-0 mb-0 h-9 w-35">
				                    <span class="btn-text select-none">추가하기</span>
				                  </button>
			                  </div>
                              <div id="tagContainer" class="border border-gray-300 rounded-md p-3 h-55 overflow-y-auto space-y-2">
                                <!-- 태그 리스트 출력 영역 -->
                              </div>
                    
                              <button type="button" class="mt-3 mr-3 text-sm text-blue-600 hover:underline flex justify-end select-none" onclick="resetTags()">reset</button>
                            </div>
                    
                            <!-- Right Side -->
                            <div class="flex flex-col h-full">
                              <textarea maxlength="500" placeholder="내용을 입력하세요." class="resize-none border border-gray-300 rounded-md px-4 py-3 h-68 mb-3 focus:outline-none focus:ring-2 focus:ring-blue-300"></textarea>
                              <div class="flex justify-end mb-3 h-10">
				                  <button onclick="openModal('ConfirmSendingNotifModal')" type="button" class="btn mx-0 mb-0 h-9 w-40">
				                    <span class="btn-text select-none">메세지 보내기</span>
				                  </button>
			                  </div>
                            </div>
                          </div>
                    </section>
                    
					<!-- 알림 전송 확인 모달창 -->
		            <div id="ConfirmSendingNotifModal" class="hidden fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm">
		              <div role="dialog" aria-modal="true" class="flex w-full max-w-lg flex-col items-center rounded-xl bg-white p-8 shadow-xl">
		                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mb-8 size-7 text-yellow-500">
						  <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
						</svg>
		                <p class="mb-2 text-center text-lg font-semibold">알림을 전송하시겠습니까?</p>
		                <div class="align-center mt-8 flex gap-6">
		                  <div>
		                    <button onclick="closeModal('ConfirmSendingNotifModal'); openModal('SendingNotifModal');" type="button" class="btn mx-0 mb-0 h-9 w-35">
		                      <span class="btn-text">확인</span>
		                    </button>
		                  </div>
		                  <div>
		                    <button onclick="closeModal('ConfirmSendingNotifModal')" type="button" class="btn mx-0 mb-0 h-9 w-35 bg-gray-500/50">
		                      <span class="btn-text">취소</span>
		                    </button>
		                  </div>
		                </div>
		              </div>
		            </div>

		            <!-- 알림 전송 완료 모달창 -->
		            <div id="SendingNotifModal" class="hidden fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm">
		              <div role="dialog" aria-modal="true" class="flex w-full max-w-lg flex-col items-center rounded-xl bg-white p-8 shadow-xl">
		                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mb-8 size-7 text-blue-500">
						  <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
						</svg>
		                <p class="mb-2 text-center text-lg font-semibold">알림 전송이 완료되었습니다.</p>
		                <div class="align-center mt-8 flex gap-6">
		                  <div>
		                    <button onclick="closeModal('SendingNotifModal')" type="button" class="btn mx-0 mb-0 h-9 w-35">
		                      <span class="btn-text">확인</span>
		                    </button>
		                  </div>
		                </div>
		              </div>
		            </div>
                </div>
            </div>
        </div>
    </div>
</body>

<!-- 사이드 바 마우스 효과 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => {
            item.addEventListener('mouseenter', function() {
                // 부모 요소 클래스 변경 (hover 상태)
                this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-blue-300/30 font-semibold text-blue-800";
                // 하위 p 태그 클래스 변경
                const pElement = this.querySelector('p');
                if (pElement) {
                    pElement.className = "mr-auto text-sm font-semibold text-blue-800";
                }
                // 하위 svg-item 클래스 요소 변경
                const svgElement = this.querySelector('.svg-item');
                if (svgElement) {
                    svgElement.className = "svg-item text mr-3 mt-1.5 font-semibold text-blue-800";
                }
            });
            item.addEventListener('mouseleave', function() {
                // 부모 요소 클래스 원복 (hover 상태 해제)
                this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950";
                // 하위 p 태그 클래스 원복
                const pElement = this.querySelector('p');
                if (pElement) {
                    pElement.className = "mr-auto text-sm font-medium text-zinc-950";
                }
                // 하위 svg-item 클래스 요소 원복
                const svgElement = this.querySelector('.svg-item');
                if (svgElement) {
                    svgElement.className = "svg-item text mr-3 mt-1.5 text-zinc-950";
                }
            });
        });
    });
</script>

</html>