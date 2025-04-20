document.addEventListener("DOMContentLoaded", function () {
    // --- 1) 이미지 업로드 관련 로직 (add_product.jsp 전용) ---
    const uploadBox = document.getElementById('uploadBox');
    const imageInput = document.getElementById('imageInput');
    const previewImg = document.getElementById('previewImg');
    const placeholderIcon = document.getElementById('placeholderIcon');
    const deleteBtn = document.getElementById('deleteImageBtn');

    if (uploadBox && imageInput && previewImg && placeholderIcon && deleteBtn) {
        uploadBox.addEventListener('click', (e) => {
            // input 자체 클릭 시 중복 트리거 방지
            if (e.target === imageInput) return;
            imageInput.click();
        });

        // 이미지 업로드 (input[type="file"])
        imageInput.addEventListener('change', () => {
            const file = imageInput.files[0];
            if (!file) return;
            const reader = new FileReader();
            reader.onload = e => {
                previewImg.src = e.target.result;
                previewImg.classList.remove('hidden');
                previewImg.classList.add('block');

                //previewImg.style.display = 'block';

                placeholderIcon.classList.add('hidden');
                deleteBtn.classList.remove('hidden');

                // ← 추가: 선택 후 포커스 해제
                imageInput.blur();
            };
            reader.readAsDataURL(file);
        });

        // 이미지 삭제 버튼 클릭 시 처리
        deleteBtn.addEventListener('click', () => {
            imageInput.value = '';
            previewImg.src = '';
            previewImg.classList.add('hidden');
            placeholderIcon.classList.remove('hidden');
            deleteBtn.classList.add('hidden');
        });
    }

    // 메뉴 항목 hover 효과 처리
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => {
        item.addEventListener('mouseenter', function () {
            // 부모 요소 클래스 변경 (hover 상태)
            this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 bg-zinc-950 font-semibold text-white";
            const pElement = this.querySelector('p');
            if (pElement) {
                pElement.className = "mr-auto text-sm font-semibold text-white";
            }
            const svgElement = this.querySelector('.svg-item');
            if (svgElement) {
                svgElement.className = "svg-item text mr-3 mt-1.5 font-semibold text-white";
            }
        });
        item.addEventListener('mouseleave', function () {
            // 부모 요소 클래스 원복 (hover 상태 해제)
            this.className = "menu-item flex w-full max-w-full items-center justify-between rounded-lg py-3 pl-8 font-medium text-zinc-950 ";
            const pElement = this.querySelector('p');
            if (pElement) {
                pElement.className = "mr-auto text-sm font-medium text-zinc-950 ";
            }
            const svgElement = this.querySelector('.svg-item');
            if (svgElement) {
                svgElement.className = "svg-item text mr-3 mt-1.5 text-zinc-950 ";
            }
        });
    });

    // 검색 컨테이너 active 토글 처리
    const searchContainer = document.querySelector('.search-container');
    if (searchContainer) {
        searchContainer.addEventListener('click', function (e) {
            if (e.target.closest('.search-input')) return;
            e.stopPropagation();
            this.classList.toggle('active');
            if (this.classList.contains('active')) {
                const input = this.querySelector('.search-input');
                if (input) {
                    setTimeout(() => { input.focus(); }, 300);
                }
            }
        });
        document.addEventListener('click', function (e) {
            if (!searchContainer.contains(e.target)) {
                searchContainer.classList.remove('active');
            }
        });
    } else {
        console.error("search-container 요소를 찾을 수 없습니다.");
    }

    // AJAX 호출을 통한 제품 데이터 불러오기
    const tableBody = document.getElementById("Products");
    if (tableBody) {
        fetch(contextPath + '/api/products')
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 오류: ' + response.statusText);
                }
                return response.json();
            })
            .then(products => {
                tableBody.innerHTML = ""; // 기존 내용 초기화

                products.forEach(product => {
                    console.log(product.productId);
                    console.log(product.productName);
                    const productQtty = Number(product.productQtty).toLocaleString('en-US');
                    const productPrice = Number(product.price).toLocaleString('en-US');
                    const productDate = new Date(product.createdAt).toISOString().split('T')[0];

                    let statusHtml = "";
                    switch (product.status) {
                        case 0:
                            statusHtml = '<span class="translate-x-4 transform rounded-md bg-green-100 px-2 py-1 text-xs font-medium text-green-700 inset-ring">정상</span>';
                            break;
                        case 1:
                            statusHtml = '<span class="translate-x-4 transform rounded-md bg-yellow-100 px-2 py-1 text-xs font-medium text-pink-700 inset-ring inset-ring-yellow-500">재고 없음</span>';
                            break;
                        case 2:
                            statusHtml = '<span class="translate-x-4 transform rounded-md bg-orange-100 px-2 py-1 text-xs font-medium text-orange-700 inset-ring">소진 임박</span>';
                            break;
                        case 3:
                            statusHtml = '<span class="translate-x-4 transform rounded-md bg-red-100 px-2 py-1 text-xs font-medium text-pink-700 inset-ring">단종</span>';
                            break;
                        default:
                            statusHtml = '<span class="translate-x-4 transform rounded-md bg-gray-100 px-2 py-1 text-xs font-medium text-gray-700 inset-ring">미확인</span>';
                    }

                    const rowHtml = `
          <tr class="border-b border-gray-300 hover:bg-gray-50">
            <td class="p-4 text-left"><input type="checkbox" /></td>
            <td class="p-4 text-center">${product.productId}</td>
            <td class="p-4 text-center">[이미지]</td>
            <td class="p-4 text-center">${product.productName}</td>
            <td class="p-4 text-center">${productQtty}</td>
            <td class="p-4 text-center">${productPrice}</td>
            <td class="p-4 text-center">${productDate}</td>
            <td class="flex items-center pt-4">
              ${statusHtml}
              <button class="ml-auto flex h-full items-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5h.01M12 12h.01M12 19h.01" />
                </svg>
              </button>
            </td>
          </tr>
        `;
                console.log("삽입할 행 HTML:", rowHtml);
                tableBody.insertAdjacentHTML('beforeend', rowHtml);
                console.log("현재 tableBody.innerHTML:", tableBody.innerHTML);
            });
        })
        .catch(err => {
            console.error('제품 데이터를 가져오는 도중 오류 발생:', err);
        });
    }
});