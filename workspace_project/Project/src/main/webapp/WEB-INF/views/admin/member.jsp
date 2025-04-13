<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <!-- JavaScript 코드 -->
    <script>
      function openModal(companyName, ceoName, phone, email, regDate) {
          document.getElementById("modal-companyName").innerText = companyName;
          document.getElementById("modal-ceoName").innerText = ceoName;
          document.getElementById("modal-phone").innerText = phone;
          document.getElementById("modal-email").innerText = email;
          document.getElementById("modal-regDate").innerText = regDate;

          // 날짜 차이 계산
          const joinDate = new Date(regDate);
          const today = new Date();
          const diffTime = today - joinDate;
          const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

          document.getElementById("modal-days").innerText = diffDays;
          document.getElementById("companyInfoModal").classList.remove("hidden");
      }

      function closeModal() {
          document.getElementById("companyInfoModal").classList.add("hidden");
      }

      function resetInput() {
          document.querySelector("input[name='keyword']").value = "";
      }

      let sortDirection = {};
      let currentSortedTh = null;

      function sortTable(colIndex, thElement) {
          const table = document.querySelector(".member-list");
          const tbody = table.tBodies[0];
          const rows = Array.from(tbody.rows);
          
          sortDirection[colIndex] = !sortDirection[colIndex];
          const direction = sortDirection[colIndex];
          const isNumeric = !isNaN(rows[0].cells[colIndex].innerText);

          rows.sort((a, b) => {
              let valA = a.cells[colIndex].innerText.trim();
              let valB = b.cells[colIndex].innerText.trim();
              if (isNumeric) {
                  valA = parseFloat(valA);
                  valB = parseFloat(valB);
              }
              if (valA < valB) return direction ? -1 : 1;
              if (valA > valB) return direction ? 1 : -1;
              return 0;
          });

          rows.forEach(row => tbody.appendChild(row));

          const updateArrows = (element, show) => {
              const upArrow = element.querySelector(".sort-up");
              const downArrow = element.querySelector(".sort-down");
              
              if (upArrow && downArrow) {
                  if (show) {
                      // 정렬 방향에 따라 화살표 표시
                      upArrow.style.display = direction ? "inline-block" : "none";
                      downArrow.style.display = direction ? "none" : "inline-block";
                  } else {
                      // 모든 화살표 숨기기
                      upArrow.style.display = "none";
                      downArrow.style.display = "none";
                  }
              }
          };
          
          if (currentSortedTh && currentSortedTh !== thElement) {
              updateArrows(currentSortedTh, false);
          }
          
          updateArrows(thElement, true);
          
          currentSortedTh = thElement;
      }

      window.onload = function () {
          sortTable(0, document.getElementById("defaultSort"));
      }
    </script>
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
                  <span class="absolute top-4 block cursor-pointer text-zinc-200 xl:hidden dark:text-white/40">
                  	<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 20 20" aria-hidden="true" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                    	<path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                  </span>
                  <!-- 페이지 명 -->
                  <div class="mt-8 flex items-center justify-center">
                    <h5 class="me-2 logo-font text-2xl leading-5 font-bold text-zinc-950">Sellity</h5>

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

                <!-- 사이드 바 하단 내용 - 추가 할지 말지 여쭤봐야함 (프로필, 이름, 로그아웃 기능)-->
                <div class="mt-7 mb-9">
                  <div class="flex justify-center"></div>
                  <div class="mt-5 flex w-full items-center rounded-lg border border-zinc-200 p-4 dark:border-zinc-800">
                    <a href="/shadcn-nextjs-boilerplate/dashboard/dashboard/settings">
                      <span class="relative flex h-10 min-h-10 w-10 min-w-10 shrink-0 overflow-hidden rounded-full"><img class="aspect-square h-full w-full" src="" /></span> <!-- 프로필 이미지 넣는거 수정 필요 -->
                    </a>
                    <a href="/shadcn-nextjs-boilerplate/dashboard/settings">
                      <p class="mr-3 ml-2 flex items-center text-sm leading-none font-semibold text-zinc-950 dark:text-white">m4gi</p>
                    </a>
                    <form class="w-full">
                      <input type="hidden" value="/shadcn-nextjs-boilerplate/dashboard/main" name="pathName" /><button class="ring-offset-background text-zinc-500 focus-visible:ring-ring border-input bg-background hover:bg-accent hover:text-accent-foreground ml-auto flex h-[40px] w-[40px] cursor-pointer items-center justify-center rounded-full border p-0 text-center text-sm font-medium whitespace-nowrap transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50 hover:dark:text-white" type="submit">
                        <svg stroke="currentColor" fill="none" stroke-width="1.5" viewBox="0 0 24 24" aria-hidden="true" class="h-4 w-4 stroke-2 text-zinc-950 dark:text-white" width="1em" height="1em" color="inherit" xmlns="http://www.w3.org/2000/svg" style="color: inherit;">
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

        <!-- 검색창 -->
        <div class="flex items-center justify-center bg-gray-200 bg-search-bg rounded-lg py-3 px-4 w-full max-w-3xl mx-auto">
          <button class="ml-3 mr-4 bg-transparent border-0 cursor-pointer text-lg text-reset-btn" onclick="resetInput()">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
              <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12c0-1.232-.046-2.453-.138-3.662a4.006 4.006 0 0 0-3.7-3.7 48.678 48.678 0 0 0-7.324 0 4.006 4.006 0 0 0-3.7 3.7c-.017.22-.032.441-.046.662M19.5 12l3-3m-3 3-3-3m-12 3c0 1.232.046 2.453.138 3.662a4.006 4.006 0 0 0 3.7 3.7 48.656 48.656 0 0 0 7.324 0 4.006 4.006 0 0 0 3.7-3.7c.017-.22.032-.441.046-.662M4.5 12l3 3m-3-3-3 3"></path>
            </svg>            
          </button>
          <form method="get" action="${pageContext.request.contextPath}/admin/member" class="flex w-full">
              <input type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword}" class="flex-1 border-none bg-white py-2.5 px-3.5 rounded-md focus:outline-none">
              <button type="submit" class="text-xl ml-4 mr-3">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z"></path>
                </svg>                              
              </button>
          </form>
        </div>

        <!-- 테이블 -->
        <div class="bg-card text-card-foreground w-full rounded-lg border border-zinc-200 p-6 shadow-sm dark:border-zinc-800">
          <div class="overflow-hidden rounded bg-white shadow">
            <table class="member-list min-w-full text-gray-700">
              <thead class="border-b border-gray-300 bg-gray-200">
                <tr>
                  <th id="defaultSort" onclick="sortTable(0, this)" class="p-4 text-center">
                    	회원번호
                    <svg class="sort-up size-7 inline-block w-4 text-xs ml-1 text-blue-600 text-left" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                      <path fill-rule="evenodd" d="M18.425 10.271C19.499 8.967 18.57 7 16.88 7H7.12c-1.69 0-2.618 1.967-1.544 3.271l4.881 5.927a2 2 0 0 0 3.088 0l4.88-5.927Z" clip-rule="evenodd"/>
                    </svg>
                    <svg class="sort-down size-7 inline-block w-4 text-xs ml-1 text-blue-600 text-left" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                      <path fill-rule="evenodd" d="M5.575 13.729C4.501 15.033 5.43 17 7.12 17h9.762c1.69 0 2.618-1.967 1.544-3.271l-4.881-5.927a2 2 0 0 0-3.088 0l-4.88 5.927Z" clip-rule="evenodd"/>
                    </svg>
                  </th>
                  <th onclick="sortTable(1, this)" class="p-4 text-center">
                      	기업명
                  </th>
                  <th onclick="sortTable(2, this)" class="p-4 text-center">
                      	담당자명
                  </th>
                  <th onclick="sortTable(3, this)" class="p-4 text-center">
                      	연락처
                  </th>
                  <th onclick="sortTable(4, this)" class="p-4 text-center">
                      	이메일
                  </th>
                  <th onclick="sortTable(5, this)" class="p-4 text-center">
                      	등록일
                  </th>
                </tr>
              </thead>
              <tbody>
                <c:choose>
                    <c:when test="${not empty companyList}">
                        <c:forEach var="user" items="${companyList}">
                            <tr onclick="openModal('${user.companyName}', '${user.ceoName}', '${user.phone}', '${user.email}', '${user.regDate}')" class="border-b border-gray-300 hover:bg-gray-50">
                                <td class="p-4 text-center text-sm border-b border-gray-100">${user.userId}</td>
                                <td class="p-4 text-center text-sm text-blue-700 border-b border-gray-100 hover:underline cursor-pointer">㈜ ${user.companyName}</td>
                                <td class="p-4 text-center text-sm border-b border-gray-100">${empty user.ceoName ? '-' : user.ceoName}</td>
                                <td class="p-4 text-center text-sm border-b border-gray-100">${empty user.phone ? '-' : user.phone}</td>
                                <td class="p-4 text-center text-sm border-b border-gray-100">${empty user.email ? '-' : user.email}</td>
                                <td class="p-4 text-center text-sm border-b border-gray-100"><fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" class="py-3 px-2 text-sm border-b border-gray-100 text-center">등록된 회원 정보가 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
              </tbody>
            </table>
          </div>

          <!-- pagination -->
          <div class="mt-5 text-center">
            <c:forEach var="i" begin="1" end="${totalPage}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <a href="?page=${i}&keyword=${param.keyword}" class="mx-1 text-sm font-semibold text-blue-500">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${i}&keyword=${param.keyword}" class="mx-1 text-sm text-gray-600">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
          </div>
          
          <!-- 기업 상세정보 모달창 -->
          <div id="companyInfoModal" class="hidden fixed top-1/5 left-1/2 transform -translate-x-1/2 bg-white border border-zinc-200 p-8 rounded-xl shadow-lg z-50 w-96">
            <h3 class="text-lg font-semibold mb-4">기업 상세 정보(아직)</h3>
            <div class="mt-4 mb-4 h-px bg-zinc-200"></div>
            <p class="mb-2"><strong>기업명:</strong> <span id="modal-companyName"></span></p>
            <p class="mb-2"><strong>담당자:</strong> <span id="modal-ceoName"></span></p>
            <p class="mb-2"><strong>연락처:</strong> <span id="modal-phone"></span></p>
            <p class="mb-2"><strong>이메일:</strong> <span id="modal-email"></span></p>
            <p class="mb-2"><strong>등록일:</strong> <span id="modal-regDate"></span></p>
            <p class="mb-4">우리는 함께한지 <strong><span id="modal-days"></span></strong>일째입니다.</p>
            <button onclick="closeModal()" class="mt-4 bg-blue-600 text-white border-0 py-2 px-5 rounded-md cursor-pointer hover:bg-blue-700">닫기</button>
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
