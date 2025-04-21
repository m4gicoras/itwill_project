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

     // 버튼 상태에 따라 다른 함수 실행
     window.addEventListener('DOMContentLoaded', function () {
	  document.querySelector('.edit-btn').addEventListener('click', function () {
	    const btnText = document.querySelector('.btn-text');

	    if (btnText.textContent === '정보 수정') {
	      infoChange();
	    } else if (btnText.textContent === '저장하기') {
	      updateUserInfo();
	    }
	  });
	});

	// 정보 수정 버튼 클릭 시
	function infoChange() {
		const editBtn = document.querySelector('.edit-btn');
		const btnText = document.querySelector('.btn-text');

		if (btnText.textContent === '정보 수정') {
			btnText.textContent = '저장하기';

		    // 각 항목의 span과 input을 토글하여 수정 가능하도록 변경
		    document.querySelectorAll('.user-info').forEach(function(element) {
		        element.classList.toggle('hidden');
		    });

		    document.querySelectorAll('.user-input').forEach(function(element) {
		        element.classList.toggle('hidden');
		    });

		    // 기본과 기업 전화번호가 value값에 들어오도록
		    const UserPhone = '${user.phone}';
		    const [Upart1, Upart2, Upart3] = UserPhone.split('-');

		    document.getElementById('userPhone1').value = Upart1;
		    document.getElementById('userPhone2').value = Upart2;
		    document.getElementById('userPhone3').value = Upart3;
		  } else {
			  btnText.textContent = '정보 수정'

			document.querySelectorAll('.user-info').forEach(function(element) {
			      element.classList.toggle('hidden');
			});

			document.querySelectorAll('.user-input').forEach(function(element) {
			    element.classList.toggle('hidden');
			});
		  }
    }

     // DB에 정보 수정
	 function updateUserInfo() {
		 const btnText = document.querySelector('.btn-text');

		 if (btnText.textContent === '저장하기') {
	        const form = document.getElementById('updateForm');

	        if (!form.checkValidity()) {
	            form.reportValidity();
	            return;
	        }

			// input 넣기 전에 조합하기
	        const email = document.getElementById('email').value;
	        const phone = document.getElementById('userPhone1').value + '-' +
	                      document.getElementById('userPhone2').value + '-' +
	                      document.getElementById('userPhone3').value;
	        const category = document.getElementById('category').value;
	        const userId = document.getElementById('userId').value;

	        const data = {
       			userId: userId,
	            email: email,
	            phone: phone,
	            productCategory: category
	        };

	        fetch('/web/myPage/update', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(data)
	        })
	        .then(response => response.text())
	        .then(result => {
	            if (result === 'success') {
	                openModal('UpdateSuccessModal');
	                infoChange();
	            } else {
	                openModal('UpdateFailModal');
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            openModal('UpdateFailModal');
	        });
	    }
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
	// 모달창 관련 코드
	function openModal(modalId) {
    	const modal = document.getElementById(modalId);
    	modal.classList.remove("hidden");
	}
	function closeModal(modalId) {
		const modal = document.getElementById(modalId);
		if (modal) {
			modal.classList.add("hidden");
			location.reload();
		}
	}
</script>
</head>

<body class="bg-gray-50 min-h-screen flex flex-col">

    <!-- ✅ Header -->
    <header class="bg-white h-20 flex items-center px-8 shadow-[0_8px_16px_rgba(0,123,255,0.12)]">
        <a href="<%=request.getContextPath()%>/main" class="text-2xl logo-font text-blue-900 select-none">Sellity</a>
    </header>

    <!-- ✅ Main -->
    <main class="flex justify-center align-middle px-8 py-20">
      <div class="flex flex-col items-center ">
        <div class="py-20 px-10 rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] flex flex-col items-center">
        <div class="text-4xl font-bold logo-font select-none text-blue-500 mb-10">마이페이지</div>
          <div class="flex flex-col gap-10 w-250">
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
              <form id="updateForm" method="post" action="/web/myPage/update">
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
	                      <td id="userId" class="select-none">${user.username}</td>
	                    </tr>
	                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
	                      <td class="px-8 py-3 select-none">닉네임</td>
	                      <td class="select-none">${user.nickname}</td>
	                    </tr>
	                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
	                      <td class="px-8 py-3 select-none">이메일</td>
	                      <td class="italic text-zinc-600 select-none">
	                      	<span class="user-info">${user.email}</span>
	                      	<div class="hidden user-input pr-8">
					          <input type="email" id="email" name="email" required class="h-9 w-100 rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" value="${user.email}"/>
					        </div>
	                      </td>
	                    </tr>
	                    <tr class="border-zinc-200 hover:bg-zinc-100/50">
	                      <td class="px-8 py-3 select-none">연락처</td>
	                      <td class="select-none">
		                      <span class="user-info">${user.phone}</span>
		                      <div class="hidden user-input flex w-100 items-center gap-1.5 pr-8">
					            <input type="text" name="userPhone1" id="userPhone1" maxlength="3" required="" oninput="validateAndMove(this, 'userPhone2', 3)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" value="010-3322-3333">
					            <span class="text-gray-500">-</span>
					            <input type="text" name="userPhone2" id="userPhone2" maxlength="4" required="" oninput="validateAndMove(this, 'userPhone3', 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
					            <span class="text-gray-500">-</span>
					            <input type="text" name="userPhone3" id="userPhone3" maxlength="4" required="" oninput="validateAndMove(this, null, 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
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
	                      <td class="select-none">${user.companyPhone}</td>
	                    </tr>
	                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
	                      <td class="px-8 py-3 select-none">주소</td>
	                      <td class="select-none">${user.companyAddr}</td>
	                    </tr>
	                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
	                      <td class="px-8 py-3 select-none">취급상품</td>
	                      <td class="select-none">
		                      <span class="user-info">${user.productCategory}</span>
		                      <select name="category" id="category" class="hidden user-input h-9 w-100 pr-8 rounded-md border border-gray-300 bg-white px-2.5 py-1.5 text-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
								<option value="" ${empty user.productCategory ? 'selected' : ''}>카테고리 선택</option>
								<option value="digital" ${user.productCategory == '가전/디지털' ? 'selected' : ''}>가전/디지털</option>
								<option value="fashion" ${user.productCategory == '패션' ? 'selected' : ''}>패션</option>
								<option value="food" ${user.productCategory == '식품' ? 'selected' : ''}>식품</option>
								<option value="etc" ${user.productCategory == '기타' ? 'selected' : ''}>기타</option>
							  </select>
	                      </td>
	                    </tr>
	                  </tbody>
	                </table>
	              </div>
              </form>

              <!-- 정보 수정 버튼 -->
              <div class="flex justify-end mr-8">
                <button type="button" class="btn edit-btn mx-0 w-40">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4.5 h-4.5 text-white">
                    <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                  </svg>
                  	<span class="btn-text">정보 수정</span>
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
						  <a class="flex items-center justify-center w-10 h-10 bg-white rounded-full shadow-md transition-all">
					        <svg viewBox="0 0 512 512" class="w-6 h-6" xmlns="http://www.w3.org/2000/svg">
					          <g>
					            <path d="M42.4,145.9c15.5-32.3,37.4-59.6,65-82.3c37.4-30.9,80.3-49.5,128.4-55.2c56.5-6.7,109.6,4,158.7,33.4 c12.2,7.3,23.6,15.6,34.5,24.6c2.7,2.2,2.4,3.5,0.1,5.7c-22.3,22.2-44.6,44.4-66.7,66.8c-2.6,2.6-4,2.4-6.8,0.3 c-64.8-49.9-159.3-36.4-207.6,29.6c-8.5,11.6-15.4,24.1-20.2,37.7c-0.4,1.2-1.2,2.3-1.8,3.5c-12.9-9.8-25.9-19.6-38.7-29.5 C72.3,169,57.3,157.5,42.4,145.9z" fill="#E94335"/>
					            <path d="M126,303.8c4.3,9.5,7.9,19.4,13.3,28.3c22.7,37.2,55.1,61.1,97.8,69.6c38.5,7.7,75.5,2.5,110-16.8 c1.2-0.6,2.4-1.2,3.5-1.8c0.6,0.6,1.1,1.3,1.7,1.8c25.8,20,51.7,40,77.5,60c-12.4,12.3-26.5,22.2-41.5,30.8 c-43.5,24.8-90.6,34.8-140.2,31C186.3,501.9,133,477.5,89,433.5c-19.3-19.3-35.2-41.1-46.7-66c10.7-8.2,21.4-16.3,32.1-24.5 C91.6,329.9,108.8,316.9,126,303.8z" fill="#34A853"/>
					            <path d="M429.9,444.9c-25.8-20-51.7-40-77.5-60c-0.6-0.5-1.2-1.2-1.7-1.8c8.9-6.9,18-13.6,25.3-22.4 c12.2-14.6,20.3-31.1,24.5-49.6c0.5-2.3,0.1-3.1-2.2-3c-1.2,0.1-2.3,0-3.5,0c-40.8,0-81.7-0.1-122.5,0.1 c-4.5,0-5.5-1.2-5.4-5.5c0.2-29,0.2-58,0-87c0-3.7,1-4.7,4.7-4.7c74.8,0.1,149.6,0.1,224.5,0c3.2,0,4.5,0.8,5.3,4.2 c6.1,27.5,5.7,55.1,2,82.9c-3,22.2-8.4,43.7-16.7,64.5c-12.3,30.7-30.4,57.5-54.2,80.5C431.6,443.8,430.7,444.3,429.9,444.9z" fill="#4285F3"/>
					            <path d="M126,303.8c-17.2,13.1-34.4,26.1-51.6,39.2c-10.7,8.1-21.4,16.3-32.1,24.5C34,352.1,28.6,335.8,24.2,319 c-8.4-32.5-9.7-65.5-5.1-98.6c3.6-26,11.1-51,23.2-74.4c15,11.5,29.9,23.1,44.9,34.6c12.9,9.9,25.8,19.7,38.7,29.5 c-2.2,10.7-5.3,21.2-6." fill="#FFC107"/>
					          </g>
					        </svg>
					      </a> 
                          <div class="mr-5 w-[50px] select-none">Google</div>
                          <div class="text-zinc-700 select-none">temp@google.com</div>
                          <div class="text-xs text-zinc-500 select-none">연동일: <span>2015-03-11</span></div>
                        </div>
                        <button type="button" class="btn cursor-pointer mx-0 mb-0 w-40">
                          	<span class="btn-text">연결끊기</span>
                        </button>
                      </td>
                    </tr>
                    <tr class="border-b border-zinc-200 hover:bg-zinc-100/50">
                      <td class="px-8 py-3 flex items-center justify-between space-x-4">
                        <div class="flex gap-5 items-center">
                        	<a class="flex items-center justify-center w-10 h-10 rounded-full shadow-md bg-yellow-300 transition-all focus:outline-none">
					          <svg viewBox="0 0 512 512" class="w-6 h-6" xmlns="http://www.w3.org/2000/svg">
					            <path fill="#000000" d="M255.5 48C299.345 48 339.897 56.5332 377.156 73.5996C414.415 90.666 443.871 113.873 465.522 143.22C487.174 172.566 498 204.577 498 239.252C498 273.926 487.174 305.982 465.522 335.42C443.871 364.857 414.46 388.109 377.291 405.175C340.122 422.241 299.525 430.775 255.5 430.775C241.607 430.775 227.262 429.781 212.467 427.795C148.233 472.402 114.042 494.977 109.892 495.518C107.907 496.241 106.012 496.15 104.208 495.248C103.486 494.706 102.945 493.983 102.584 493.08C102.223 492.177 102.043 491.365 102.043 490.642V489.559C103.126 482.515 111.335 453.169 126.672 401.518C91.8486 384.181 64.1974 361.2 43.7185 332.575C23.2395 303.951 13 272.843 13 239.252C13 204.577 23.8259 172.566 45.4777 143.22C67.1295 113.873 96.5849 90.666 133.844 73.5996C171.103 56.5332 211.655 48 255.5 48Z"/>
					          </svg>
					        </a>
                          <div class="mr-5 w-[50px] select-none">Kakao</div>
                          <div class="text-zinc-700 select-none">연결되지 않음</div>
                          <div class="text-xs text-zinc-500 select-none"></div>
                        </div>
                        <button type="button" class="btn cursor-pointer mx-0 mb-0 w-40">
                          	<span class="btn-text">연동</span>
                        </button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

               <!-- 탈퇴 페이지로 가는 버튼 -->
              <div class="flex justify-end mr-8">
                <button onclick="location.href='/web/delete'" type="button" class="btn edit-btn mx-0 w-40 bg-zinc-300 cursor-pointer">
				  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4.5 h-4.5 text-zinc-700">
					<path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
				  </svg>
                  	<span class="btn-text text-zinc-700">회원 탈퇴</span>
                </button>
              </div>

              <!-- 수정 완료 모달창 -->
              <div id="UpdateSuccessModal" class="hidden fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm">
	              <div role="dialog" aria-modal="true" class="flex w-full max-w-lg flex-col items-center rounded-xl bg-white p-8 shadow-xl">
	                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mb-8 size-11 text-blue-500">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12c0 1.268-.63 2.39-1.593 3.068a3.745 3.745 0 0 1-1.043 3.296 3.745 3.745 0 0 1-3.296 1.043A3.745 3.745 0 0 1 12 21c-1.268 0-2.39-.63-3.068-1.593a3.746 3.746 0 0 1-3.296-1.043 3.745 3.745 0 0 1-1.043-3.296A3.745 3.745 0 0 1 3 12c0-1.268.63-2.39 1.593-3.068a3.745 3.745 0 0 1 1.043-3.296 3.746 3.746 0 0 1 3.296-1.043A3.746 3.746 0 0 1 12 3c1.268 0 2.39.63 3.068 1.593a3.746 3.746 0 0 1 3.296 1.043 3.746 3.746 0 0 1 1.043 3.296A3.745 3.745 0 0 1 21 12Z" />
					</svg>
	                <p class="mb-2 text-center text-lg font-semibold">회원님의 정보가 정상적으로 변경되었습니다.</p>
	                <div class="align-center mt-8 flex gap-6">
	                  <div>
	                    <button onclick="closeModal('UpdateSuccessModal')" type="button" class="btn mx-0 mb-0 h-9 w-35">
	                      <span class="btn-text">확인</span>
	                    </button>
	                  </div>
	                </div>
	              </div>
	            </div>

              <!-- 수정 실패 모달창 -->
              <div id="UpdateFailModal" class="hidden fixed inset-0 z-50 flex items-center justify-center backdrop-blur-sm">
	              <div role="dialog" aria-modal="true" class="flex w-full max-w-lg flex-col items-center rounded-xl bg-white p-8 shadow-xl">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="mb-8 size-11 text-red-500">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
					</svg>
	                <p class="mb-2 text-center text-lg font-semibold">정보 변경에 실패했습니다. 잠시 후 다시 시도해 주세요.</p>
	                <div class="align-center mt-8 flex gap-6">
	                  <div>
	                    <button onclick="closeModal('UpdateFailModal')" type="button" class="btn mx-0 mb-0 h-9 w-35">
	                      <span class="btn-text">확인</span>
	                    </button>
	                  </div>
	                </div>
	              </div>
	            </div>


            </div>
        </div>
      </div>
    </main>
</body>
</html>