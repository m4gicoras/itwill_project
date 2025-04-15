<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>Sellity - 회원 확인 페이지</title>

  <!-- TailwindCSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

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

    .kimm-bold {
      font-family: 'KIMM_Bold', sans-serif;
    }

    @keyframes bounce {
      0%, 100% {
        transform: scale(1);
      }

      50% {
        transform: scale(1.1);
      }
    }
  </style>
</head>

<body class="bg-gray-50 min-h-screen flex flex-col">

  <!-- ✅ Header -->
  <header class="bg-white shadow-[0_8px_10px_rgba(0,123,255,0.1)] h-20 flex items-center px-8">
    <a href="/" class="text-2xl logo-font text-black select-none">Sellity</a>
  </header>

  <!-- ✅ 나머지 콘텐츠를 화면 가운데로 정렬 -->

    <main class="flex flex-col items-center justify-center w-full px-4 py-20">
    <div class="flex flex-col items-center justify-center bg-white rounded-xl select-none shadow-[0_10px_20px_rgba(0,123,255,0.2)] w-full max-w-5xl p-10">

    <form action="check_process.jsp" method="post" class="flex flex-col items-center justify-center py-8 w-full space-y-8">

      <!-- 법률에 관한 네모박스 -->
      <div class="legal-box w-full max-w-4xl border-2 border-gray-200 p-4 bg-red-50 rounded-md shadow-sm mt-2 mb-6">
        <p class="text-sm text-gray-700 leading-relaxed">
          <span class="text-red-500 text-base">회원탈퇴 시 개인정보 및
            <span style="font-family: 'KIMM_Bold', sans-serif;">Sellity</span> 에서 만들어진 모든 데이터는 삭제됩니다.</span><br>
          <span class="text-red-500">(단, 아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.)</span><br>
          1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년<br>
          2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간 : 5년<br>
          3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년<br>
          4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년<br>
          5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 / 3년<br>
          6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제 2016-3호) (전자세금계산서 사용자에 한함) : 5년<br>
          (단, (세금)계산서 내 개인식별번호는 3년 경과 후 파기)
        </p>
      </div>

      <!-- ✅ 비밀번호 입력 파트 -->
      <div class="flex items-center justify-center w-full space-x-4 max-w-md">
        <!-- 비밀번호 라벨과 입력창 나란히 배치 -->
        <label for="password" class="text-lg font-semibold text-gray-700 w-auto">*비밀번호 확인</label>
        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."
          class="w-1/2 h-10 p-2 text-sm border border-gray-200 rounded-md bg-white text-sm text-black focus:outline-none focus:ring-2 focus:ring-blue-300">

      </div>

      <!-- 버튼 영역 -->
      <div class="flex justify-center space-x-6">
        <a href="/mypage" class="px-6 py-2 mt-10 bg-gray-400 text-white rounded-full shadow-lg mt-10 transition-all hover:bg-gray-500 focus:outline-none">
          이전
        </a>
        <a href="/delete" class="px-6 py-2 mt-10 bg-blue-500 text-white rounded-full shadow-lg mt-10 transition-all hover:bg-blue-600 focus:outline-none">
          다음
      </a>
     </form>
    </div>
  </main>
</body>

</html>
