<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 구글 폰트 embed 코드 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet" />
    <title>회원가입</title>
    <style>
      body {
          font-family: 'Noto Sans KR', sans-serif;
      }

      /* 커스텀 bounce 애니메이션 (키프레임) */
      @keyframes bounce {
        0%,
        100% {
          transform: scale(1);
        }

        50% {
          transform: scale(1.1);
        }
      }

      .ios-checkbox {
        --checkbox-size: 23px;
        --checkbox-color: #3b82f6;
        --checkbox-bg: #dbeafe;
        --checkbox-border: #93c5fd;
      }

      /* Checked State */
      .ios-checkbox input:checked+.checkbox-wrapper .checkbox-bg {
        background: var(--checkbox-color);
        border-color: var(--checkbox-color);
        border: none;
      }

      .ios-checkbox input:checked+.checkbox-wrapper .checkbox-icon {
        transform: scale(1);
      }

      .ios-checkbox input:checked+.checkbox-wrapper .check-path {
        stroke-dashoffset: 0;
      }

      /* Focus Styles */
      .ios-checkbox input:focus+.checkbox-wrapper .checkbox-bg {
        box-shadow: 0 0 0 4px var(--checkbox-bg);
      }

      /* Animation */
      .ios-checkbox input:checked+.checkbox-wrapper {
        animation: bounce 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      }
    </style>
  </head>
  <body class="m-0 bg-gray-100 p-5 font-sans">
    <!-- 회원가입 폼 컨테이너 -->
    <div class="mx-auto my-8 w-full max-w-xl rounded-lg bg-white px-[80px] py-[45px] shadow-sm">
      <h2 class="text-center text-[25px] font-semibold">회원가입</h2>

      <!-- 폼 전송 시 POST 방식으로 서버에 전달 -->
      <form action="${pageContext.request.contextPath}/signup" method="post">
        <!-- 사용자 정보 입력 구역 -->
        <div class="mt-5 text-[17px] font-semibold">사용자 정보</div>

        <!-- 아이디 입력 및 중복 확인 버튼 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">아이디<span class="ml-1 text-sm text-red-500">*</span></label>
          <div class="flex items-center gap-2.5">
            <input type="text" name="username" id="username" required class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <button type="button" onclick="checkUsername()" class="group relative flex h-9 cursor-pointer items-center justify-center overflow-hidden rounded-full bg-blue-500 px-10 font-medium ring-2 ring-blue-500/10 transition-all">
              <span class="relative text-left text-sm font-medium whitespace-nowrap text-white transition-colors duration-200 ease-in-out group-hover:text-white">중복 확인</span>
            </button>
          </div>
          <div id="idTooltip" class="mt-1 hidden pl-1 text-[13px] text-red-500">6~12자의 영문 소문자, 숫자와 특수문자 '_'만 사용 가능합니다.</div>
          <div id="idCheckResult" class="mt-1 text-[13px]"></div>
        </div>

        <!-- 비밀번호 입력 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">비밀번호<span class="ml-1 text-sm text-red-500">*</span></label>
          <input type="password" name="password" id="password" required class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
          <div id="pwTooltip" class="mt-1 hidden pl-1 text-[13px] text-red-500">8~20자, 특수문자 1개 이상 포함해주세요.</div>
        </div>

        <!-- 비밀번호 확인 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">비밀번호 확인<span class="ml-1 text-sm text-red-500">*</span></label>
          <input type="password" name="passwordCheck" id="passwordCheck" required class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
          <div id="pwMatchMessage" class="mt-1 hidden pl-1 text-[13px] text-red-500">비밀번호가 일치하지 않습니다.</div>
        </div>

        <!-- 닉네임 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">닉네임</label>
          <input type="text" name="nickname" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
        </div>

        <!-- 연락처: 세 칸 분할 입력 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">연락처<span class="ml-1 text-sm text-red-500">*</span></label>
          <div class="flex items-center gap-1.5">
            <input type="text" name="phone1" maxlength="3" required oninput="validateAndMove(this, 'phone2', 3)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="phone2" id="phone2" maxlength="4" required oninput="validateAndMove(this, 'phone3', 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="phone3" id="phone3" maxlength="4" required oninput="validateAndMove(this, null, 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
          </div>
        </div>

        <!-- 이메일 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">이메일<span class="ml-1 text-sm text-red-500">*</span></label>
          <input type="email" name="email" required class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
        </div>

        <!-- 사업자 정보 입력 구역 -->
        <div class="mt-9 text-lg font-semibold">사업자 정보</div>

        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">상호/법인명<span class="ml-1 text-sm text-red-500">*</span></label>
          <input type="text" name="companyName" required class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
        </div>

        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">대표자명</label>
          <input type="text" name="ceoName" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
        </div>

        <!-- 사업자등록번호 3단 입력 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">사업자등록번호<span class="ml-1 text-sm text-red-500">*</span></label>
          <div class="flex items-center gap-1.5">
            <input type="text" name="bizNum1" maxlength="3" required oninput="validateAndMove(this, 'bizNum2', 3)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="bizNum2" id="bizNum2" maxlength="2" required oninput="validateAndMove(this, 'bizNum3', 2)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="bizNum3" id="bizNum3" maxlength="5" required oninput="validateAndMove(this, null, 5)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
          </div>
        </div>

        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">대표 전화<span class="ml-1 text-sm text-red-500">*</span></label>
          <div class="flex items-center gap-1.5">
            <input type="text" name="companyPhone1" maxlength="3" required oninput="validateAndMove(this, 'companyPhone2', 3)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="companyPhone2" id="companyPhone2" maxlength="4" required oninput="validateAndMove(this, 'companyPhone3', 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <span class="text-gray-500">-</span>
            <input type="text" name="companyPhone3" id="companyPhone3" maxlength="4" required oninput="validateAndMove(this, null, 4)" class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
          </div>
        </div>

        <!-- 주소 입력 (카카오 주소 API 사용) -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">주소<span class="ml-1 text-sm text-red-500">*</span></label>
          <div class="flex items-center gap-2.5">
            <input type="text" id="address" name="address" placeholder="기본 주소" required readonly class="h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
            <button type="button" onclick="execDaumPostcode()" class="group relative flex h-9 cursor-pointer items-center justify-center overflow-hidden rounded-full bg-blue-500 px-10 font-medium ring-2 ring-blue-500/10 transition-all">
              <span class="relative cursor-pointer text-left text-sm font-medium whitespace-nowrap text-white transition-colors duration-200 ease-in-out group-hover:text-white">주소 검색</span>
            </button>
          </div>
          <input type="text" id="addressDetail" name="addressDetail" placeholder="상세 주소 (예: 3층, 301호)" class="mt-3 h-9 w-full rounded-md border border-gray-300 px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none" />
        </div>

        <!-- 취급 카테고리 선택 -->
        <div class="mb-4">
          <label class="mt-3 mb-1.5 block text-sm font-medium">취급상품 카테고리</label>
          <select name="category" class="h-9 w-full appearance-none rounded-md border border-gray-300 bg-white px-2.5 py-1.5 text-sm shadow-sm focus:ring-1 focus:ring-blue-500 focus:outline-none">
            <option value="">카테고리 선택</option>
            <option value="digital">가전/디지털</option>
            <option value="fashion">패션</option>
            <option value="food">식품</option>
            <option value="etc">기타</option>
          </select>
        </div>

        <!-- 약관 동의 체크 -->
        <div class="mt-9 text-lg font-semibold">이용 약관</div>
        <div class="my-4 space-y-3 text-sm">
          <div class="flex items-center">
            <label class="ios-checkbox inline-block cursor-pointer select-none">
              <input type="checkbox" class="hidden" />
              <div class="checkbox-wrapper ease relative rounded-[8px] transition-transform duration-200 hover:scale-105 active:scale-95" style="width: var(--checkbox-size); height: var(--checkbox-size);">
                <div class="checkbox-bg ease absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200" style="width: var(--checkbox-size); height: var(--checkbox-size); border-color: var(--checkbox-border);">
                  <div class="checkbox-icon ease absolute m-auto scale-none text-white transition-all duration-200" style="width: 100%; height: 100%;">
                    <svg viewBox="0 0 24 24" fill="none">
                      <path class="check-path [stroke-dasharray:40] [stroke-dashoffset:40] [transition:stroke-dashoffset_0.3s_ease_0.1s]" d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
                    </svg>
                  </div>
                </div>
              </div>
            </label>
            <span class="ml-2.5">서비스 이용 약관 동의</span>
            <span class="ml-1 text-sm text-red-500">*</span>
            <svg id="togglefromBtn1" onclick="openModal('termsModal', 'service')" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="ml-1 size-4 text-gray-600"><path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" /></svg>
            <div id="termTooltip" class="mt-0.5 hidden pl-1 text-[13px] text-red-500">필수 이용 약관에 동의해주세요.</div>
          </div>
          <div class="flex items-center">
            <label class="ios-checkbox inline-block cursor-pointer select-none">
              <input type="checkbox" class="hidden" />
              <div class="checkbox-wrapper ease relative rounded-[8px] transition-transform duration-200 hover:scale-105 active:scale-95" style="width: var(--checkbox-size); height: var(--checkbox-size);">
                <div class="checkbox-bg ease absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200" style="width: var(--checkbox-size); height: var(--checkbox-size); border-color: var(--checkbox-border);">
                  <div class="checkbox-icon ease absolute m-auto scale-none text-white transition-all duration-200" style="width: 100%; height: 100%;">
                    <svg viewBox="0 0 24 24" fill="none">
                      <path class="check-path [stroke-dasharray:40] [stroke-dashoffset:40] [transition:stroke-dashoffset_0.3s_ease_0.1s]" d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
                    </svg>
                  </div>
                </div>
              </div>
            </label>
            <span class="ml-2.5">개인정보 수집 및 이용 동의</span>
            <svg id="togglefromBtn2" onclick="openModal('termsModal', 'privacy')" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="ml-1 size-4 text-gray-600"><path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" /></svg>
          </div>
          <div class="flex items-center">
            <label class="ios-checkbox inline-block cursor-pointer select-none">
              <input type="checkbox" class="hidden" />
              <div class="checkbox-wrapper ease relative rounded-[8px] transition-transform duration-200 hover:scale-105 active:scale-95" style="width: var(--checkbox-size); height: var(--checkbox-size);">
                <div class="checkbox-bg ease absolute inset-0 rounded-[8px] border-2 bg-white transition-all duration-200" style="width: var(--checkbox-size); height: var(--checkbox-size); border-color: var(--checkbox-border);">
                  <div class="checkbox-icon ease absolute m-auto scale-none text-white transition-all duration-200" style="width: 100%; height: 100%;">
                    <svg viewBox="0 0 24 24" fill="none">
                      <path class="check-path [stroke-dasharray:40] [stroke-dashoffset:40] [transition:stroke-dashoffset_0.3s_ease_0.1s]" d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="3"></path>
                    </svg>
                  </div>
                </div>
              </div>
            </label>
            <span class="ml-2.5">정보 수신 동의</span>
            <svg id="togglefromBtn3" onclick="openModal('termsModal', 'service')" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="ml-1 size-4 text-gray-600"><path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" /></svg>
          </div>
        </div>

        <!-- 이용 약관 상세 정보 모달 -->
        <div id="termsModal" class="fixed inset-0 z-50 flex hidden items-center justify-center">
          <div role="dialog" aria-modal="true" class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
            <h2 id="modalTitle" class="mb-4 text-lg font-semibold">서비스 이용 약관</h2>
            <p id="modalContent" class="mb-3 max-h-60 overflow-y-auto rounded-md border border-gray-300 px-2.5 py-1.5 text-sm text-gray-500 shadow-sm">이용 약관 예시 입니다.</p>
            <div class="flex justify-end">
              <button type="button" onclick="closeModal('termsModal')" class="group relative flex h-9 cursor-pointer items-center justify-center overflow-hidden rounded-full bg-blue-500 px-10 font-medium ring-2 ring-blue-500/10 transition-all">
                <span class="relative text-left text-sm font-medium whitespace-nowrap text-white transition-colors duration-200 ease-in-out group-hover:text-white">확인</span>
              </button>
            </div>
          </div>
        </div>

        <!-- 제출 버튼 -->
        <button type="submit" class="group relative mt-9 flex h-9 w-full items-center justify-center overflow-hidden rounded-full bg-blue-500 px-6 font-medium ring-2 ring-blue-500/50 transition-all">
          <span class="absolute bottom-0 left-0 h-full w-full -translate-x-full rounded-md bg-blue-600 transition-all delay-200 duration-500 ease-in-out group-hover:translate-x-0"></span>
          <span class="relative text-left text-sm font-medium whitespace-nowrap text-white transition-colors duration-200 ease-in-out group-hover:text-white">회원 가입</span>
        </button>
      </form>
    </div>

    <!-- 주소 검색 API: 다음 카카오 우편번호 서비스 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
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

      // 아이디 중복 확인 (AJAX 요청) -> 중복 확인 유무 isUsernameValid
      let isUsernameValid = false;
      function checkUsername() {
          const username = document.getElementById("username").value.trim();
          const resultDiv = document.getElementById("idCheckResult");

          if (!/^[a-z0-9_]{6,12}$/.test(username)) {
              idTooltip.style.display = "block";
              idInput.focus();
              isUsernameValid = false;
              return;
          }

          const url = "${pageContext.request.contextPath}/isDuplicateUsername?username=" + encodeURIComponent(username);
          console.log("요청 URL: ", url);

          fetch(url)
              .then(res => res.text())
              .then(data => {
              	if (parseInt(data) > 0) {
                      resultDiv.style.color = "red";
                      resultDiv.textContent = "이미 사용 중인 아이디입니다.";
                      isUsernameValid = false;
                  } else {
                      resultDiv.style.color = "green";
                      resultDiv.textContent = "사용 가능한 아이디입니다!";
                      isUsernameValid = true;
                  }
              })
              .catch(err => {
                  console.error(err);
                  resultDiv.style.color = "red";
                  resultDiv.textContent = "서버 오류가 발생했습니다.";
                  isUsernameValid = false;
              });
      }

      // 이용 약관 모달창 실행
      const termsData = {
        service: {
          title: "서비스 이용약관",
          content: `본 약관은 셀리티(Sellity)가 제공하는 모든 서비스의 이용과 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 
        	    이용자는 본 약관에 동의함으로써 셀리티가 제공하는 다양한 서비스(예: 회원 가입, 콘텐츠 이용, 고객 지원 등)를 정상적으로 이용할 수 있습니다.
        	    서비스 이용 중 발생할 수 있는 문제에 대해서는 본 약관을 기준으로 판단되며, 셀리티는 원활한 서비스 제공을 위해 사전 고지 없이 서비스를 일부 변경 또는 종료할 수 있습니다. 
        	    단, 이로 인해 이용자에게 중대한 영향을 미칠 경우 사전에 공지합니다. 
        	    본 약관에 동의하지 않는 경우, 서비스 이용이 제한될 수 있습니다.`
        },
        privacy: {
          title: "개인정보 처리방침",
          content: `셀리티(Sellity)는 회원 가입, 고객 문의, 맞춤형 서비스 제공 등을 위해 최소한의 개인정보를 수집하며, 이용자의 동의 없이 개인정보를 외부에 제공하지 않습니다.
        	    수집된 정보는 이용자의 서비스 경험을 개선하고, 고객 지원 및 법령상 의무 준수를 위한 목적으로만 사용됩니다.
        	    또한 셀리티는 이용자의 개인정보 보호를 위해 업계 표준에 부합하는 보안 조치를 적용하고 있으며, 보관 기간이 지난 개인정보는 안전하게 파기합니다.
        	    이용자는 언제든지 본인의 개인정보를 열람, 수정, 삭제 요청할 수 있으며, 이에 대한 문의는 고객센터를 통해 가능합니다.`
        },
        location: {
          title: "마케팅 정보 수신 동의",
          content: `셀리티(Sellity)는 고객에게 유용한 정보를 제공하기 위해 이메일, 문자 메시지, 푸시 알림 등의 수단으로 마케팅 정보를 발송할 수 있습니다.
        	    해당 정보는 셀리티의 서비스 품질 향상과 이용자의 만족도 제고를 위한 목적으로만 사용되며, 수신자는 언제든지 수신 거부를 선택할 수 있습니다.
        	    수신 거부는 마케팅 메시지 내 안내된 절차에 따라 간단히 처리할 수 있으며, 수신 거부 이후에는 해당 정보가 더 이상 발송되지 않습니다.
        	    마케팅 정보 수신 동의는 선택 사항이며, 동의를 하지 않더라도 기본적인 서비스 이용에는 제한이 없습니다.`
        }
      };

      function openModal(modalId, contentType) {
        const modal = document.getElementById(modalId);
        const title = document.getElementById("modalTitle");
        const content = document.getElementById("modalContent");

        // 내용 동적 변경
        title.textContent = termsData[contentType].title;
        content.textContent = termsData[contentType].content;

        // 모달 열기
        modal.classList.remove("hidden");
      }

      function closeModal(modalId) {
	  	const modal = document.getElementById(modalId);
	   	if (modal) {
	   		modal.classList.add("hidden");
	   	}
	  }

      // 페이지 로딩 후 실행
      document.addEventListener("DOMContentLoaded", function () {
          const inputs = Array.from(document.querySelectorAll("input, select"));

          const idReg = /^[a-z0-9_]{6,12}$/;
          const pwReg = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;

          // 엔터 누르면 다음 input으로 이동
          inputs.forEach((input, index) => {
              input.addEventListener("keydown", function (e) {
                  if (e.key === "Enter") {
                      e.preventDefault();
                      const next = inputs[index + 1];
                      if (next) next.focus();
                  }
              });
          });

          // 비밀번호 확인 시 일치 여부 표시
          const passwordInput = document.getElementById("password");
          const passwordCheckInput = document.getElementById("passwordCheck");
          const pwMatchMessage = document.getElementById("pwMatchMessage");

          passwordCheckInput.addEventListener("input", function () {
              pwMatchMessage.style.display = (this.value !== passwordInput.value) ? "block" : "none";
          });

          // 아이디, 비밀번호, 이용 약관 관련 DOM 요소 가져오기
          const idInput = document.getElementById("username");
          const pwTooltip = document.getElementById("pwTooltip");
          const idTooltip = document.getElementById("idTooltip");
          const termTooltip = document.getElementById("termTooltip");

          // 아이디 및 비밀번호 blur 시 유효성 툴팁 표시
          idInput.addEventListener("blur", () => {
              toggleTooltip(idReg.test(idInput.value), idTooltip, idInput);
          });

          passwordInput.addEventListener("blur", () => {
              toggleTooltip(pwReg.test(passwordInput.value), pwTooltip, passwordInput);
          });

          // 툴팁 표시/숨기기 함수
          function toggleTooltip(isValid, tooltip, input) {
              tooltip.style.display = isValid ? "none" : "block";
          }

          // 폼 제출 전 전체 유효성 검사
          const form = document.querySelector("form");
          form.addEventListener("submit", function(e) {
              const resultDiv = document.getElementById("idCheckResult");

              // 비밀번호 & 비밀번호 확인 일치 여부 검사
              if(passwordInput.value !== passwordCheckInput.value) {
                  e.preventDefault();
                  pwMatchMessage.style.display = "block";
                  passwordCheckInput.focus();
                  return;
              }

              // 아이디 중복 확인 실행 여부 체크
              if(!isUsernameValid) {
                  e.preventDefault();
                  resultDiv.style.color = "red";
                  resultDiv.textContent = "아이디 중복 확인을 해주세요.";
                  idInput.focus();
                  return;
              }

              // 아이디 유효성 검사
              if(!idReg.test(idInput.value)) {
                  e.preventDefault();
                  idTooltip.style.display = "block";
                  idInput.focus();
                  return;
              } else {
                  idTooltip.style.display = "none";
              }

              // 비밀번호 유효성 검사
              if(!pwReg.test(passwordInput.value)) {
                  e.preventDefault();
                  pwTooltip.style.display = "block";
                  passwordInput.focus();
                  return;
              } else {
                  pwTooltip.style.display = "none";
              }

              // 첫번째 이용 약관 동의 여부
              const termsCheckbox = document.querySelector('.ios-checkbox input[type="checkbox"]');
              if(!termsCheckbox.checked){
                e.preventDefault();
                termTooltip.style.display = "block";
                termsCheckbox.focus();
                return;
              } else {
                  termTooltip.style.display = "none";
              }
          });

      });
    </script>
  </body>
</html>
