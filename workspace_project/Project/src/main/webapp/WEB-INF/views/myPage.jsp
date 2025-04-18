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
<!-- 주소 검색 API: 다음 카카오 우편번호 서비스 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
     // 다음 주소 검색 팝업 호출
     function execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function (data) {
                 const fullAddr = data.roadAddress ? data.roadAddress : data.jibunAddress;
                 document.getElementById('address').value = fullAddr;
                 document.getElementById('addressDetail').focus();
             }
         }).open();
     }

	function infoChange() {
	    // 각 항목의 span과 input을 토글하여 수정 가능하도록 변경
	    document.querySelectorAll('.user-info').forEach(function(element) {
	        element.classList.toggle('hidden');
	    });
	
	    document.querySelectorAll('.user-input').forEach(function(element) {
	        element.classList.toggle('hidden');
	    });
	    
	    // 기본과 기업 전화번호가 value값에 들어오도록
	    const UserPhone = '${user.phone}';
	    const CompanyPhone = '${user.companyPhone}'
	    const [Upart1, Upart2, Upart3] = UserPhone.split('-');
	    const [Cpart1, Cpart2, Cpart3] = CompanyPhone.split('-');

	    document.getElementById('userPhone1').value = Upart1;
	    document.getElementById('userPhone2').value = Upart2;
	    document.getElementById('userPhone3').value = Upart3;
	    
	    document.getElementById('companyPhone1').value = Cpart1;
	    document.getElementById('companyPhone2').value = Cpart2;
	    document.getElementById('companyPhone3').value = Cpart3;
	    
	    
	
	    // 버튼 텍스트를 변경 ("정보 수정" -> "저장하기")
	    const button = document.querySelector('.info-change-btn');
	    if (button.innerText === '정보 수정') {
	        button.innerHTML = `
	        	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4.5 h-4.5 text-white">
	        	  <path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5M16.5 12 12 16.5m0 0L7.5 12m4.5 4.5V3" />
	        	</svg>
	            <span>저장하기</span>
	        `;
	    } else {
	        button.innerHTML = `
	        	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4.5 h-4.5 text-white">
	            	<path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
	          	</svg>
	          	<span>정보 수정</span>
	        `;
    }
	    
 	// 숫자만 입력 가능 + 입력한 칸이 다 차면 다음 input으로 이동
    function validateAndMove(current, nextId, maxLength) {
        current.value = current.value.replace(/[^0-9]/g, '');

        if (current.value.length >= maxLength && nextId !== null) {
            const nextInput = document.getElementById(nextId);
            if (nextInput) {
                nextInput.focus();
            }
        }
    }
}
</script>
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
                    <tr class="border-b border-zinc-200 bg-gray-200">
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
                          <button class="cursor-pointer absolute bottom-0 right-0 w-8 h-8 bg-white rounded-full p-1 shadow">
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
                      <td class="px-8 py-3 w-80 select-none">아이디</td>
                      <td class="select-none">${user.username}</td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">닉네임</td>
                      <td class="select-none">
	                      <span class="user-info">${user.nickname}</span>
	                      <input type="text" class="hidden user-input h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" id="edit-nickname" value="${user.nickname}" />
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">이메일</td>
                      <td class="italic text-zinc-600 select-none">${user.email}</td>
                    </tr>
                    <tr class="border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">연락처</td>
                      <td class="select-none">
	                      <span class="user-info">${user.phone}</span>
	                      <div class="hidden user-input flex items-center gap-1.5">
				            <input type="text" name="userPhone1" id="userPhone1" maxlength="3" required oninput="validateAndMove(this, 'userPhone2', 3)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" value="${user.phone}"/>
				            <span class="text-gray-500">-</span>
				            <input type="text" name="userPhone2" id="userPhone2" maxlength="4" required oninput="validateAndMove(this, 'userPhone3', 4)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
				            <span class="text-gray-500">-</span>
				            <input type="text" name="userPhone3" id="userPhone3" maxlength="4" required oninput="validateAndMove(this, null, 4)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
				          </div>
                      </td>
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
                      <td class="px-8 py-3 w-80 select-none">상호/법인명</td>
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
                      <td class="select-none">
                      <span class="user-info">${user.companyPhone}</span>
                      <div class="hidden user-input flex items-center gap-1.5">
			            <input type="text" name="companyPhone1" id="companyPhone1" maxlength="3" required oninput="validateAndMove(this, 'companyPhone2', 3)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
			            <span class="text-gray-500">-</span>
			            <input type="text" name="companyPhone2" id="companyPhone2" maxlength="4" required oninput="validateAndMove(this, 'companyPhone3', 4)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
			            <span class="text-gray-500">-</span>
			            <input type="text" name="companyPhone3" id="companyPhone3" maxlength="4" required oninput="validateAndMove(this, null, 4)" class="h-9 w-30 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
			          </div>
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">주소</td>
                      <td class="select-none">
	                      <span class="user-info">${user.companyAddr}</span>
	                      <div class="user-input hidden my-4 mr-4">
				          	<div class="flex items-center gap-2.5">
				            	<input type="text" id="address" name="address" placeholder="기본 주소" required="" readonly="" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" value="${user.companyAddr}">
					            <div class="w-3xs">
					              <button type="button" class="btn mb-0 h-9" onclick="execDaumPostcode()">
					                <span class="btn-text">주소 검색</span>
					              </button>
					            </div>
					          </div>
					          <input type="text" id="addressDetail" name="addressDetail" placeholder="상세 주소 (예: 3층, 301호)" class="mt-3 h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
					        </div>
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 select-none">취급상품</td>
                      <td class="select-none">
	                      <span class="user-info">${user.productCategory}</span>
	                      <select name="category" class="hidden user-input h-9 w-60 rounded-md border border-gray-300 bg-white px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
				            <option value="">카테고리 선택</option>
				            <option value="digital">가전/디지털</option>
				            <option value="fashion">패션</option>
				            <option value="food">식품</option>
				            <option value="etc">기타</option>
				          </select>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="flex justify-end mr-4">
                <!-- 정보 수정 버튼 --> 
                <button onclick="infoChange()" type="button" class="info-change-btn flex gap-3 cursor-pointer items-center bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
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
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 flex items-center justify-between space-x-4">
                        <div class="flex gap-5 items-center">
                          <img src="${pageContext.request.contextPath}/resources/images/google01.png" class="w-6 h-6" alt="google" />
                          <div class="mr-5 w-[50px] select-none">Google</div>
                          <div class="text-zinc-700 select-none">temp@google.com</div>
                          <div class="text-xs text-zinc-500 select-none">연동일: <span>2015-03-11</span></div>
                        </div>
                        <button type="button" class="cursor-pointer bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                          	연결끊기
                        </button>
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 flex items-center justify-between space-x-4">
                        <div class="flex gap-5 items-center">
                          <img src="${pageContext.request.contextPath}/resources/images/kakaoLogo01.png" class="w-6 h-6" alt="kakao" />
                          <div class="mr-5 w-[50px] select-none">Kakao</div>
                          <div class="text-zinc-700 select-none">연결되지 않음</div>
                          <div class="text-xs text-zinc-500 select-none"></div>
                        </div>
                        <button type="button" class="cursor-pointer bg-blue-500 text-white px-6 py-2 rounded-full shadow-lg hover:bg-blue-600 transition">
                          	연결끊기
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