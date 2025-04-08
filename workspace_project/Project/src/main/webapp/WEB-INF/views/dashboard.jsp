<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
	<title>대시보드</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- TailwindCSS 4.0 -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 구글 폰트 embed 코드 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap" rel="stylesheet">
  </head>
  <body class="bg-gray-100" style="font-family: 'Noto Sans KR', sans-serif;">
    <!-- 상단바 시작 -->
    <header class="w-full bg-purple-400 text-white py-4 px-6 flex items-center justify-between">
      <div class="text-2xl font-bold">셀리티</div>
      <nav class="flex space-x-4">
        <a href="#" class="hover:underline">메뉴1</a>
        <a href="#" class="hover:underline">메뉴2</a>
        <a href="#" class="hover:underline">메뉴3</a>
      </nav>
    </header>
    <!-- 상단바 끝 -->
  
    <!-- 사이드바와 메인 컨텐츠를 감싸는 영역 -->
    <div class="flex">
      <!-- 사이드바 시작 -->
      <aside class="flex flex-col w-64 h-screen px-4 py-8 bg-purple-700 text-white">
        <nav class="flex-1">
          <ul class="space-y-2">
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7l6 6-6 6M21 7l-6 6 6 6"></path>
                </svg>
                <span>상품 목록</span>
                <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">5</span>
                <c:forEach var="p" items="${products}">
			    <tr class="border-b hover:bg-gray-50">
				    <td class="p-4"><input type="checkbox" /></td>
				    <td class="p-4">${p.hashId}</td>
				    <td class="p-4">${p.productName}</td>
				    <td class="p-4">${p.productQtty}</td>
				    <td class="p-4">${p.price}</td>
				    <td class="p-4">${p.productQtty}</td>
				    <td class="p-4"><fmt:formatDate value="${p.createdAt}" pattern="yyyy-MM-dd"/></td>
				    <td class="p-4">
				      <c:choose>
				        <c:when test="${p.status == 0}"><span class="text-green-600">정상</span></c:when>
				        <c:when test="${p.status == 1}"><span class="text-yellow-600">재고없음</span></c:when>
				        <c:when test="${p.status == 2}"><span class="text-orange-600">소진임박</span></c:when>
				        <c:otherwise><span class="text-red-600">단종</span></c:otherwise>
				      </c:choose>
				    </td>
				</tr>
				</c:forEach>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a4 4 0 00-3-3.87M9 11a4 4 0 110-8 4 4 0 010 8zm6 8a6 6 0 1112 0v2H9v-2a6 6 0 016-6z"></path>
                </svg>
                <span>상품 등록</span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2H3V5h18v10h-6v2m-6 0v2H3v-2h6zm6 0v2h6v-2h-6z"></path>
                </svg>
                <span>입고 현황</span>
                <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">12</span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                </svg>
                <span>출고 현황</span>
                <span class="ml-auto bg-purple-900 text-xs px-2 py-1 rounded-full">20+</span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h10M7 16h10M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H9l-4 4v12a2 2 0 002 2z"></path>
                </svg>
                <span>견적 현황</span>
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center px-3 py-2 rounded-md hover:bg-purple-600 transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2H3V5h18v10h-6v2m-6 0v2H3v-2h6zm6 0v2h6v-2h-6z"></path>
                </svg>
                <span>정산 현황</span>
              </a>
            </li>
          </ul>
        </nav>
      </aside>
      <!-- 사이드바 끝 -->
  
      <!-- 메인 컨텐츠 시작 -->
      <main class="flex-1 p-8">
        <h1 class="text-2xl font-bold mb-6">상품 목록</h1>
  
        <!-- 검색/필터 영역 -->
        <div class="flex items-center mb-4">
          <div class="relative">
            <input type="text" class="border border-gray-300 rounded-l px-3 py-2 focus:outline-none focus:ring-1 focus:ring-purple-500" placeholder="상품명 검색">
            <button class="bg-purple-700 text-white px-4 py-2 rounded-r hover:bg-purple-600 focus:outline-none focus:ring-1 focus:ring-purple-500">
              검색
            </button>
          </div>
          <button class="ml-2 bg-white border border-gray-300 px-3 py-2 rounded hover:bg-gray-100 focus:outline-none focus:ring-1 focus:ring-purple-500">
            필터
          </button>
        </div>
  
        <!-- 테이블 영역 -->
        <div class="bg-white rounded shadow overflow-hidden">
          <table class="min-w-full text-gray-700">
            <thead class="bg-gray-400 border-b border-gray-100">
              <tr>
                <th class="p-4 text-left">
                  <input type="checkbox">
                </th>
                <th class="p-4 text-left">상품코드</th>
                <th class="p-4 text-left">상품명</th>
                <th class="p-4 text-left">수량</th>
                <th class="p-4 text-left">판매가격</th>
                <th class="p-4 text-left">재고수량</th>
                <th class="p-4 text-left">등록일</th>
                <!-- 상태 컬럼 -->
                <th class="p-4 text-left">상태</th>
                <!-- 세로 점 3개 아이콘 컬럼 -->
                
              </tr>
            </thead>
            <tbody>
              <!-- 예시 1: 정상 -->
              <tr class="border-b hover:bg-gray-50">
                <td class="p-4">
                  <input type="checkbox">
                </td>
                <td class="p-4">A0001</td>
                <td class="p-4">Washing Bottle 2</td>
                <td class="p-4">20</td>
                <td class="p-4">320,000</td>
                <td class="p-4">10</td>
                <td class="p-4">2015-03-21</td>
                <td class="p-4 flex items-center">
                    <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-700">
                      정상
                    </span>
                    <button class="h-full flex items-center ml-2">
                      <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400 hover:text-gray-600 cursor-pointer" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5h.01M12 12h.01M12 19h.01"></path>
                      </svg>
                    </button>
                  </td>
                
              </tr>
  
              <!-- 예시 2: 재고없음 -->
              <tr class="border-b hover:bg-gray-50">
                <td class="p-4">
                  <input type="checkbox">
                </td>
                <td class="p-4">A0002</td>
                <td class="p-4">Washing Bottle</td>
                <td class="p-4">32</td>
                <td class="p-4">120,000</td>
                <td class="p-4">8</td>
                <td class="p-4">2015-03-22</td>
                <td class="p-4">
                  <!-- 재고없음 배지 -->
                  <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full bg-yellow-100 text-yellow-700">
                    재고없음
                  </span>
                </td>
                
              </tr>
  
              <!-- 예시 3: 단종 -->
              <tr class="border-b hover:bg-gray-50">
                <td class="p-4">
                  <input type="checkbox">
                </td>
                <td class="p-4">A0003</td>
                <td class="p-4">Sample Product</td>
                <td class="p-4">10</td>
                <td class="p-4">90,000</td>
                <td class="p-4">0</td>
                <td class="p-4">2015-03-23</td>
                <td class="p-4">
                  <!-- 단종 배지 -->
                  <span class="inline-block px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-700">
                    단종
                  </span>
                </td>
                
              </tr>
  
            </tbody>
          </table>
        </div>
  
        <!-- 페이지네이션 영역 -->
        <div class="mt-4 flex justify-center">
          <nav class="inline-flex items-center space-x-1">
            <button class="px-3 py-1 bg-white border border-gray-300 text-gray-700 rounded-l hover:bg-gray-100 focus:outline-none">
              이전
            </button>
            <button class="px-3 py-1 bg-white border-t border-b border-gray-300 text-gray-700 hover:bg-gray-100 focus:outline-none">
              1
            </button>
            <button class="px-3 py-1 bg-white border-t border-b border-gray-300 text-gray-700 hover:bg-gray-100 focus:outline-none">
              2
            </button>
            <button class="px-3 py-1 bg-white border border-gray-300 text-gray-700 rounded-r hover:bg-gray-100 focus:outline-none">
              다음
            </button>
          </nav>
        </div>
      </main>
      <!-- 메인 컨텐츠 끝 -->
    </div>
  </body>
</html>