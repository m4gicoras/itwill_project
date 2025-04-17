const emailInput      = document.getElementById('emailInput');
const verifyInput     = document.getElementById('verifyInput');
const noInfoMsg       = document.getElementById('noInfoMsg');
let isVerified = false;

// 1) 이메일 존재 확인 → 인증 메일 발송
function validateInputs() {
  const email = emailInput.value.trim();
  if (!email) {
    noInfoMsg.textContent = '이메일을 입력해주세요.';
    noInfoMsg.classList.remove('hidden');
    return;
  }
  noInfoMsg.classList.add('hidden');

  fetch(contextPath + '/checkEmail', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ email }),
    credentials: 'same-origin'
  })
  .then(res => {
    if (!res.ok) throw new Error(res.statusText);
    return res.json();
  })
  .then(data => {
    if (data.exists > 0) {
      // 이메일 존재 → 인증 메일 요청
      sendVerificationEmail(email);
      alert('인증 메일을 보냈습니다. 메일을 확인해주세요.');
    } else {
      noInfoMsg.textContent = '회원정보가 존재하지 않습니다.';
      noInfoMsg.classList.remove('hidden');
    }
  })
  .catch(err => {
    console.error('이메일 확인 중 오류:', err);
    alert('이메일 확인에 문제가 발생했습니다.');
  });
}

// 2) 인증 메일 전송 요청
function sendVerificationEmail(email) {
  fetch(contextPath + '/api/sendVerificationEmail', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ email }),
    credentials: 'same-origin'
  })
  .then(res => {
    if (!res.ok) throw new Error(res.statusText);
    return res.json();
  })
  .then(data => {
    if (!data.success) {
      console.warn('인증 메일 전송 실패:', data.error);
    }
  })
  .catch(err => {
    console.error('이메일 전송 중 오류:', err);
  });
}

// 3) 인증번호 검증
function checkVerificationCode() {
  const email = emailInput.value.trim();
  const code  = verifyInput.value.trim();
  if (!email || !code) {
    alert('이메일과 인증번호를 모두 입력해주세요.');
    return;
  }

  fetch(contextPath + '/api/verifyCode', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json' },
    body: new URLSearchParams({ email, code }),
    credentials: 'same-origin'
  })
  .then(res => res.json())
  .then(data => {
    if (data.success) {
      alert('인증이 완료되었습니다.');
      isVerified = true;
    } else {
      alert('인증번호가 일치하지 않습니다.');
      isVerified = false;
    }
  })
  .catch(err => {
    console.error('인증번호 검증 중 오류:', err);
    alert('인증 중 오류가 발생했습니다.');
    isVerified = false;
  });
}

// 4) 실제 아이디 찾기 요청
function requestFindId() {
  const email = emailInput.value.trim();
  fetch(contextPath + '/findId', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ email }),
    credentials: 'same-origin'
  })
  .then(res => res.json())
  .then(data => {
    if (data.success) {
      // finish_id 페이지로 이동
      location.href = contextPath + '/finish_id';
    } else {
      alert(data.error || '아이디를 찾지 못했습니다.');
    }
  })
  .catch(err => {
    console.error('아이디 찾기 오류:', err);
    alert('아이디 찾기에 실패했습니다.');
  });
}

// 5) 최종 체크 후 호출
function checkId() {
  const email     = emailInput.value.trim();
  const inputCode = verifyInput.value.trim();

  if (!email || !inputCode) {
    alert('이메일과 인증번호를 모두 입력해주세요.');
    return;
  }
  if (!isVerified) {
    alert('인증이 완료되지 않았습니다.');
    return;
  }

  // 모든 체크 통과 시 실제 요청
  requestFindId();
}

function checkPwFind() {
  const username = document.getElementById('username').value.trim();
  const email  = document.getElementById('emailInput').value.trim();

  if (!username || !email) {
    alert('아이디와 이메일을 모두 입력해주세요.');
    return;
  }
  if (!isVerified) {
    alert('이메일 인증을 먼저 완료해주세요.');
    return;
  }

  // 모두 통과하면 form 전송
  document.getElementById('pwFindForm').submit();
}

// 추가: 이메일 또는 인증번호를 바꾸면 인증 상태 초기화
[emailInput, verifyInput].forEach(el =>
  el.addEventListener('input', () => { isVerified = false; })
);
