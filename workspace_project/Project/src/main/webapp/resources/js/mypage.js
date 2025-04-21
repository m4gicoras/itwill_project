// resources/js/mypage.js

// 다음 주소 검색 팝업 호출
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            const fullAddr = data.roadAddress || data.jibunAddress;
            document.getElementById('address').value = fullAddr;
            document.getElementById('addressDetail').focus();
        }
    }).open();
}

// 페이지 로드 후 버튼 클릭 핸들러 등록
window.addEventListener('DOMContentLoaded', () => {
    document.querySelector('.edit-btn')
        .addEventListener('click', () => {
            const btnText = document.querySelector('.btn-text');
            if (btnText.textContent === '정보 수정') infoChange();
            else if (btnText.textContent === '저장하기') updateUserInfo();
        });

    // 프로필 이미지 업로드 처리
    const uploadInput = document.getElementById("profile-upload");
    const editBtn = document.getElementById("imgEditBtn");

    fetch(contextPath + "/me")
        .then(res => {
            if (!res.ok) throw new Error("유저 정보 조회 실패");
            return res.json();
        })
        .then(user => {
            // 모든 .profile div 순회
            document.querySelectorAll(".profile").forEach(profile => {
                // 혹시 이전에 삽입된 img가 있다면 제거
                profile.querySelectorAll("img.user-photo").forEach(img => img.remove());

                if (user && user.userImg) {
                    // 이미지를 div 맨 앞(afterbegin)에 삽입
                    profile.insertAdjacentHTML(
                        "afterbegin",
                        `<img src="${user.userImg}"
                alt="프로필"
                class="user-photo aspect-square h-full w-full rounded-full" />`
                    );
                    profile.classList.remove("no-profile");
                } else {
                    profile.classList.add("no-profile");
                }
            });
        })
        .catch(err => {
            console.error("프로필 로딩 오류:", err);
            document.querySelectorAll(".profile").forEach(p => p.classList.add("no-profile"));
        });

    if (uploadInput && editBtn) {
        editBtn.addEventListener("click", () => uploadInput.click());
        uploadInput.addEventListener("change", async () => {
            const file = uploadInput.files[0];
            if (!file) return;
            const formData = new FormData();
            formData.append("file", file);
            try {
                const res = await fetch(`${contextPath}/myPage/updateImg`, {
                    method: "POST", body: formData
                });
                const result = await res.text();
                if (result === "success") {
                    alert("프로필 이미지가 업데이트되었습니다.");
                    location.reload();
                } else alert("이미지 업로드에 실패했습니다.");
            } catch (err) {
                console.error(err);
                alert("업로드 중 오류가 발생했습니다.");
            }
        });
    }
});

// 정보 수정 토글
function infoChange() {
    const btnText = document.querySelector('.btn-text');
    btnText.textContent = btnText.textContent === '정보 수정' ? '저장하기' : '정보 수정';
    document.querySelectorAll('.user-info, .user-input')
        .forEach(el => el.classList.toggle('hidden'));

    if (btnText.textContent === '저장하기') {
        const UserPhone = '${user.phone}';
        const [p1, p2, p3] = UserPhone.split('-');
        document.getElementById('userPhone1').value = p1;
        document.getElementById('userPhone2').value = p2;
        document.getElementById('userPhone3').value = p3;
    }
}

// 정보 저장
function updateUserInfo() {
    const btnText = document.querySelector('.btn-text');
    if (btnText.textContent !== '저장하기') return;
    const form = document.getElementById('updateForm');
    if (!form.checkValidity()) { form.reportValidity(); return; }

    const data = {
        userId: document.getElementById('userId').textContent,
        email: document.getElementById('email').value,
        phone: [1, 2, 3].map(i => document.getElementById(`userPhone${i}`).value).join('-'),
        productCategory: document.getElementById('category').value
    };

    fetch(`${contextPath}/myPage/update`, {
        method: "POST",
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    })
        .then(res => res.text())
        .then(result => {
            if (result === 'success') {
                openModal('UpdateSuccessModal');
                infoChange();
            } else openModal('UpdateFailModal');
        })
        .catch(() => openModal('UpdateFailModal'));
}

// 숫자 입력 + 자동 포커스 이동
function validateAndMove(current, nextId, maxLength) {
    current.value = current.value.replace(/[^0-9]/g, '');
    if (current.value.length >= maxLength && nextId) {
        document.getElementById(nextId)?.focus();
    }
}

// 모달 토글
function openModal(id) { document.getElementById(id)?.classList.remove("hidden"); }
function closeModal(id) {
    document.getElementById(id)?.classList.add("hidden");
    location.reload();
}
