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
    <!-- JavaScript 코드 -->
    <script>
    	// 검색 초기화
        function resetInput() {
            document.querySelector("input[name='productName']").value = "";
            document.querySelector("input[name='companyName']").value = "";
        }
    	
     	// Enter 키를 누르면 폼을 제출하는 함수
        function submitFormOnEnter(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                event.target.form.submit();
            }
        }
		
    	// 테이블의 상품번호 정렬 방식 변경
        let sortDirection = {};
        let currentSortedTh = null;

        function sortTable(colIndex, thElement) {
			const dataColIndex = colIndex + 1;
        	
            const table = document.querySelector(".product-list");
            const tbody = table.tBodies[0];
            const rows = Array.from(tbody.rows);
            
            // 데이터 행이 없거나 메시지만 있는 경우
            if (rows.length === 0 || rows[0].cells.length <= 1) {
                return; 
            }

            sortDirection[colIndex] = !sortDirection[colIndex];
            const direction = sortDirection[colIndex];
            
            let firstDataRow = rows.find(row => row.cells.length > dataColIndex);
            let isNumeric = false;
            
            if (firstDataRow) {
                const cellText = firstDataRow.cells[dataColIndex].innerText.trim();
                isNumeric = !isNaN(parseFloat(cellText)) && isFinite(cellText);
            }

            rows.sort((a, b) => {
            	let valA = a.cells[dataColIndex].innerText.trim();
                let valB = b.cells[dataColIndex].innerText.trim();
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

        window.onload = function() {
            sortTable(0, document.getElementById("defaultSort"));
        }
        
      // 수량 더블 클릭 -> 물품 개수 수정
      function activateQtyEdit(productId, btn) {
		    const displayId = "qtyDisplay-" + productId;
		    const inputId = "qtyInput-" + productId;
		    
		    const display = document.getElementById(displayId);
		    const input = document.getElementById(inputId);
		    
		    if (display && input) {
		        display.classList.add("hidden");
		        input.classList.remove("hidden");
		        input.focus();
		        input.select();
		    } else {
		        console.error("요소를 찾을 수 없습니다:", displayId, inputId);
		    }
		}
      // 수량 변경 후 ENTER 누르면 => 서버에 AJAX 요청 보내는 방식
      function updateQtyOnEnter(event, productId) {
    	  if (event.key === "Enter") {
  	        const inputId = "qtyInput-" + productId;
  	        const displayId = "qtyDisplay-" + productId;

  	        const input = document.getElementById(inputId);
  	        const display = document.getElementById(displayId);

  	        if (input && display) {
  	            const newQtty = input.value;

  	            // 서버에 AJAX 요청 보내기
  	            fetch("/web/admin/product/updateQtty", {
  	                method: "POST",
  	                headers: {
  	                    "Content-Type": "application/x-www-form-urlencoded"
  	                },
  	                body: new URLSearchParams({
  	                    productId: productId,
  	                    ProductQtty: newQtty
  	                })
  	            })
  	            .then(res => res.text())
  	            .then(data => {
  	                if (data === "success") {
  	                    console.log("수정 성공!");
		    	            // UI 변경
		    	            display.textContent = newQtty;
		    	            input.classList.add("hidden");
		    	            display.classList.remove("hidden");
  	                } else {
  	                    alert("수정 실패");
  	                }
  	            })
  	            .catch(error => {
  	                console.error("에러 발생:", error);
  	                alert("서버 오류로 수정 실패");
  	            });
  	        }
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
									<div class="menu-item active flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-blue-300/30 font-semibold text-blue-800">
									    <a class="undefined rounded-none w-full select-none" href="${pageContext.request.contextPath}/admin/product">
									        <div class="w-full items-center justify-center">
									            <div class="flex w-full items-center justify-center">
									                <div class="svg-item text mr-3 mt-1.5 font-semibold text-blue-800">
									                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-mt-[7px] h-4 w-4 stroke-2 text-inherit" height="1em" width="1em">
									                        <path stroke-linecap="round" stroke-linejoin="round" d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
									                    </svg>
									                </div>
									                <p class="mr-auto text-sm font-semibold text-blue-800">물품 관리</p>
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
			
            <!-- 검색창 -->
            <form action="${pageContext.request.contextPath}/admin/product" method="get">
                <div class="flex items-center justify-center gap-3 bg-blue-300/30 bg-search-bg rounded-lg py-3 px-4 w-full max-w-3xl mx-auto">
                    <button class="ml-3 mr-4 bg-transparent border-0 cursor-pointer text-reset-btn" onclick="resetInput()">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 12c0-1.232-.046-2.453-.138-3.662a4.006 4.006 0 0 0-3.7-3.7 48.678 48.678 0 0 0-7.324 0 4.006 4.006 0 0 0-3.7 3.7c-.017.22-.032.441-.046.662M19.5 12l3-3m-3 3-3-3m-12 3c0 1.232.046 2.453.138 3.662a4.006 4.006 0 0 0 3.7 3.7 48.656 48.656 0 0 0 7.324 0 4.006 4.006 0 0 0 3.7-3.7c.017-.22.032-.441.046-.662M4.5 12l3 3m-3-3-3 3"></path>
                        </svg>
                    </button>
                    <input type="text" name="productName" placeholder="상품명 입력" value="${productName}" class="border-none bg-white py-2.5 px-3.5 rounded-md focus:outline-none" onkeydown="submitFormOnEnter(event)">
                    <input type="text" name="companyName" placeholder="기업명 입력" value="${companyName}" class="border-none bg-white py-2.5 px-3.5 rounded-md focus:outline-none" onkeydown="submitFormOnEnter(event)">
                    <select name="sort" class="flex-1 border-none bg-white py-2.5 px-3.5 rounded-md focus:outline-none">
                        <option value="recent" ${sort == 'recent' ? 'selected' : ''}>최신순</option>
                        <option value="oldest" ${sort == 'oldest' ? 'selected' : ''}>오래된순</option>
                    </select>
                    <button type="submit" class="text-xl ml-4 mr-3">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z"></path>
                        </svg>
                    </button>
                </div>
            </form>

            <!-- 테이블 -->
            <div class="bg-card text-card-foreground w-full rounded-lg border border-zinc-200 p-6 shadow-sm">
                <div class="rounded bg-white shadow">
                    <table class="product-list min-w-full text-gray-700">
                        <thead class="border-b border-gray-300 bg-blue-300/30">
                            <tr>
                            	<th class="selectAllCheckbox p-4"><input type="checkbox" id="checkbox-${product.productId}"></th>
                                <th id="defaultSort" onclick="sortTable(0, this)" class="p-4 text-center select-none">
                                    	물품번호
                                    <svg class="sort-up size-7 inline-block w-4 text-xs ml-1 text-blue-600 text-left" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                        <path fill-rule="evenodd" d="M18.425 10.271C19.499 8.967 18.57 7 16.88 7H7.12c-1.69 0-2.618 1.967-1.544 3.271l4.881 5.927a2 2 0 0 0 3.088 0l4.88-5.927Z" clip-rule="evenodd" />
                                    </svg>
                                    <svg class="sort-down size-7 inline-block w-4 text-xs ml-1 text-blue-600 text-left" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 24 24">
                                        <path fill-rule="evenodd" d="M5.575 13.729C4.501 15.033 5.43 17 7.12 17h9.762c1.69 0 2.618-1.967 1.544-3.271l-4.881-5.927a2 2 0 0 0-3.088 0l-4.88 5.927Z" clip-rule="evenodd" />
                                    </svg>
                                </th>
                                <th class="p-4 text-center select-none">기업명</th>
                                <th class="p-4 text-center select-none">상품명</th>
                                <th class="p-4 text-center select-none">수량</th>
                                <th class="p-4 text-center select-none">등록일</th>
                                <th class="p-4 text-center select-none">상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty productList}">
                                    <c:forEach var="product" items="${productList}">
                                        <tr class="hover:bg-blue-50 cursor-pointer border-b">
                                        	<td class="row-checkbox p-4 text-center text-sm border-b border-gray-100"><input type="checkbox" class="product-checkbox" value="${product.productId}"></td>
                                            <td class="p-4 text-center text-sm border-b border-gray-100">${product.productId}</td>
                                            <td class="p-4 text-center text-sm border-b border-gray-100">㈜ ${product.companyName}</td>
                                            <td id="productName" class="p-4 text-center text-sm border-b border-gray-100">${product.productName}</td>
                                            <td class="p-4 text-center text-sm border-b border-gray-100">
											    <span id="qtyDisplay-${product.productId}" ondblclick="activateQtyEdit('${product.productId}', null)">
											        ${product.productQty}
											    </span>
											    <input 
											        id="qtyInput-${product.productId}" 
											        type="number" 
											        class="hidden w-16 px-1 py-0.5 border border-gray-300 rounded text-center text-sm"
											        value="${product.productQty}" 
											        onkeydown="updateQtyOnEnter(event, '${product.productId}')"
                                    				onblur="updateQtyOnEnter({key:'Enter'}, '${product.productId}')"
											    />
											</td>
                                            <td class="p-4 text-center text-sm border-b border-gray-100"><fmt:formatDate value="${product.createdAt}" pattern="yyyy-MM-dd"/></td>
                                            <td class="p-4 text-center text-sm border-b border-gray-100">
                                                <c:choose>
                                                    <c:when test="${product.status == 0}">
														<span class="transform translate-x-4 rounded-md bg-green-100 px-2 py-1 text-xs font-medium text-green-700 inset-ring">
													                    정상
													    </span>
													</c:when>
                                                    <c:when test="${product.status == 1}">
                                                    	<span class="transform translate-x-4 rounded-md bg-yellow-100 px-2 py-1 text-xs font-medium text-yellow-700 inset-ring">
	                                                    	소진 임박
													    </span>
                                                    </c:when>
                                                    <c:when test="${product.status == 2}">
                                                    	<span class="transform translate-x-4 rounded-md bg-red-100 px-2 py-1 text-xs font-medium text-red-700 inset-ring">
	                                                    	거래 불가
													    </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                    	<span class="transform translate-x-4 rounded-md bg-gray-100 px-2 py-1 text-xs font-medium text-gray-700 inset-ring">
	                                                   		 알 수 없음
													    </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" class="py-3 px-2 text-sm border-b border-gray-100 text-center">등록된 물품 정보가 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
				
				<!-- 테이블 하단 -->
	            <div class="mt-5 text-center">
	            	<!-- 수정, 단종 변경 버튼 -->
                   	<div class="flex justify-end gap-2">
	            		<!-- <div>
		                  <button type="button" id="editButton" class="btn mx-0 mb-0 h-9 w-20">
		                    <span class="btn-text">수정</span>
		                  </button>
		                </div> 보류 -->
	            		<div>
		                  <button type="button" id="discontinueButton" onclick="changeStatus()" class="btn mx-0 mb-0 h-9 w-45">
		                    <span class="btn-text">거래 불가로 변경</span>
		                  </button>
		                </div>
            		</div>
		            <!-- pagination -->
	                <c:forEach var="i" begin="1" end="${totalPages}">
	                    <a href="?page=${i}&productName=${param.productName}&companyName=${param.companyName}&sort=${param.sort}"
	                       class="mx-1 px-2 py-1 text-sm ${currentPage == i ? 'font-bold text-blue-600' : 'text-gray-700'}">
	                       ${i}
	                    </a>
	                </c:forEach>
	            </div>
	            
            <!-- 변경 결과 모달창 -->
            <div id="updateResultModal"
                class="hidden fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm">
                <div role="dialog" aria-modal="true"
                    class="flex w-full max-w-lg flex-col items-center rounded-xl bg-white p-8 shadow-xl">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                        stroke-width="1.5" stroke="currentColor" class="mb-8 size-11 text-blue-500">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M9 12.75 11.25 15 15 9.75M21 12c0 1.268-.63 2.39-1.593 3.068a3.745 3.745 0 0 1-1.043 3.296 3.745 3.745 0 0 1-3.296 1.043A3.745 3.745 0 0 1 12 21c-1.268 0-2.39-.63-3.068-1.593a3.746 3.746 0 0 1-3.296-1.043 3.745 3.745 0 0 1-1.043-3.296A3.745 3.745 0 0 1 3 12c0-1.268.63-2.39 1.593-3.068a3.745 3.745 0 0 1 1.043-3.296 3.746 3.746 0 0 1 3.296-1.043A3.746 3.746 0 0 1 12 3c1.268 0 2.39.63 3.068 1.593a3.746 3.746 0 0 1 3.296 1.043 3.746 3.746 0 0 1 1.043 3.296A3.745 3.745 0 0 1 21 12Z" />
                    </svg>
                    <p id="updateResultModalMessage" class="mb-2 text-center text-lg font-semibold"></p>
                    <div class="align-center mt-8 flex gap-6">
                        <div>
                            <button onclick="closeModal('UpdateResultModal')" type="button"
                                class="btn mx-0 mb-0 h-9 w-35">
                                <span class="btn-text">확인</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            </div> <!-- 테이블 -->
            
        </div> <!-- 메인 -->
    </div>
</body>

<!-- 사이드 바 마우스 효과 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
    	const menuItems = document.querySelectorAll('.menu-item');

        menuItems.forEach(item => {
            item.addEventListener('mouseenter', function () {
                if (!this.classList.contains('active')) {
                    this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-blue-300/30 font-semibold text-blue-800";
                    const pElement = this.querySelector('p');
                    if (pElement) {
                        pElement.className = "mr-auto text-sm font-semibold text-blue-800";
                    }
                    const svgElement = this.querySelector('.svg-item');
                    if (svgElement) {
                        svgElement.className = "svg-item text mr-3 mt-1.5 font-semibold text-blue-800";
                    }
                }
            });

            item.addEventListener('mouseleave', function () {
                if (!this.classList.contains('active')) {
                    this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ";
                    const pElement = this.querySelector('p');
                    if (pElement) {
                        pElement.className = "mr-auto text-sm font-medium text-zinc-950 ";
                    }
                    const svgElement = this.querySelector('.svg-item');
                    if (svgElement) {
                        svgElement.className = "svg-item text mr-3 mt-1.5 text-zinc-950 ";
                    }
                }
            });
        });
    });
    
 	// 행 클릭 시 체크 박스 체크 (체크박스 자체 클릭 제외)
    document.querySelector('.product-list').addEventListener('click', function(event) {
        // 체크박스를 직접 클릭한 경우
        if (event.target.type === 'checkbox') {
            return;
        }
        
        // header는 행 클릭해도 체크박스 체크 안되도록
        const tbody = document.querySelector('.product-list tbody');
        if (!tbody.contains(event.target)) return;
        
        const row = event.target.closest('tr');
        if (!row) {
        	return;
        }
        
        const checkbox = row.querySelector('input[type="checkbox"]');
        if (checkbox) {
            checkbox.checked = !checkbox.checked;
            
            // 다른 이벤트 처리기에게 알림 (전체 선택 상태 업데이트 용)
            checkbox.dispatchEvent(new Event('change'));
        }
    });
    
    // 체크박스 일괄 체크
    const headerCheckboxTh = document.querySelector('th.selectAllCheckbox');
    const headerCheckbox = headerCheckboxTh ? headerCheckboxTh.querySelector('input[type="checkbox"]') : null;
    
    if (headerCheckbox) {
        headerCheckbox.addEventListener('change', function() {
            const rowCheckboxTds = document.querySelectorAll('td.row-checkbox');
            const rowCheckboxes = [];
            
            rowCheckboxTds.forEach(function(td) {
                const checkbox = td.querySelector('input[type="checkbox"]');
                if (checkbox) {
                    rowCheckboxes.push(checkbox);
                }
            });
            
            // 헤더 체크박스의 상태에 따라 모든 행 체크박스 상태 변경
            rowCheckboxes.forEach(function(checkbox) {
                checkbox.checked = headerCheckbox.checked;
            });
        });
        
        // 개별 체크박스의 상태 변경을 감지하여 전체 선택 상태 업데이트
        const updateHeaderCheckbox = function() {
            const rowCheckboxTds = document.querySelectorAll('td.row-checkbox');
            const rowCheckboxes = [];
            let checkedCount = 0;
            
            // 각 td 안의 input 요소를 배열에 저장하고 체크된 것 카운트
            rowCheckboxTds.forEach(function(td) {
                const checkbox = td.querySelector('input[type="checkbox"]');
                if (checkbox) {
                    rowCheckboxes.push(checkbox);
                    if (checkbox.checked) {
                        checkedCount++;
                    }
                }
            });
            
            // 체크박스가 모두 체크되었는지 확인
            if (rowCheckboxes.length > 0 && checkedCount === rowCheckboxes.length) {
                headerCheckbox.checked = true;
                headerCheckbox.indeterminate = false;
            } 
            // 일부만 체크되었을 때
            else if (checkedCount > 0) {
                headerCheckbox.checked = false;
            } 
            // 하나도 체크되지 않았을 때
            else {
                headerCheckbox.checked = false;
            }
        };
        
        // 각 행의 체크박스에 이벤트 리스너 추가
        document.querySelectorAll('td.row-checkbox').forEach(function(td) {
            const checkbox = td.querySelector('input[type="checkbox"]');
            if (checkbox) {
                checkbox.addEventListener('change', updateHeaderCheckbox);
            }
        });
    }
    
 	// 모달 닫기
    function closeModal(id) {
        document.getElementById(id)?.classList.add("hidden");
        location.reload();
    }
	
 	// 체크박스 체크된 행 클릭 후 -> 단종으로 변경
    function changeStatus() {
    	// 체크박스 행의 id로 이루어진 Array
    	const selectedIds = Array.from(document.querySelectorAll('.product-checkbox:checked')).map(cb => cb.value);
        const modal = document.getElementById('updateResultModal');
        const msg = document.getElementById('updateResultModalMessage');
    	
    	// 선택된 행이 없다면
    	if(selectedIds.length === 0){
    		msg.innerText = "선택된 물품이 없습니다.상태를 변경할 물품을 선택해주세요.";
			modal.classList.remove('hidden');
    		return;
    	}
    	
    	fetch('/web/admin/product/updateStatus', {
    		method: 'POST',
    		headers: {
    			'Content-type' : 'application/json'
    		},
    		body: JSON.stringify({
    			productIds: selectedIds,
    			newStatus: 2 // 단종
    		})
    	}).then(async response => {
    		const message = await response.text(); // 서버에서 보낸 메시지
            
    		if(response.ok) {
    			msg.innerText = message;
    			modal.classList.remove('hidden');
    		}
    		else {
    			msg.innerText = message;
    			modal.classList.remove('hidden');
    		}
    	})
    	.catch(error => {
    		document.getElementById('updateResultModalMessage').innerText = `오류가 발생하였습니다. 잠시 후 다시 시도 해주세요. ${error}`;
    		document.getElementById('updateResultModal').classList.remove('hidden');
    	})
   	}
</script>

</html>