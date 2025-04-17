// 이름과 이메일이 일치하는지 확인하는 함수
function validateInputs() {
  const email = document.getElementById("emailInput").value;
  const noInfoMsg = document.getElementById("noInfoMsg");

  // 이메일 또는 이름이 비어있다면 오류 메시지를 표시하고 함수를 종료
  if (email === "") {
    noInfoMsg.classList.remove("hidden");
    return;  // 더 이상 진행x
  } else {
    noInfoMsg.classList.add("hidden");  // 메시지 숨기기
  }
  sendVerificationEmail(email);
}

function checkVerificationCode() {
  const email = document.getElementById("emailInput").value.trim();
  const inputCode = document.getElementById("verifyInput").value.trim();

  // POST로 서버에 입력한 인증번호와 이메일을 전송
  fetch(contextPath + "/api/verifyCode", {
      method: "POST",
      headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/json"
      },
      body: new URLSearchParams({ email: email, code: inputCode }),
      credentials: "same-origin"
  })
  .then(response => {
      console.log("응답 Content-Type:", response.headers.get("content-type"));
      return response.json();
  })
  .then(data => {
      if (data.success) {
          alert("인증이 완료되었습니다.");
      } else {
          alert("인증번호가 일치하지 않습니다.");
      }
  })
  .catch(error => {
      console.error("인증번호 검증 중 오류:", error);
      //alert("인증번호 검증에 문제가 발생했습니다: " + error.message);
  });
}

// 인증 메일 전송을 알리는 함수 (서버에서 처리, 클라이언트에서는 호출만)
function sendVerificationEmail(email) {
  fetch(contextPath + "/api/sendVerificationEmail", {
      method: "POST",
      headers: {
          "Content-Type": "application/x-www-form-urlencoded"
      },
      body: new URLSearchParams({ email: email }),
      credentials: "same-origin"
  })
  .then(response => {
      if (!response.ok) {
          throw new Error('네트워크 오류: ' + response.statusText);
      }
      return response.json();
  })
  .then(data => {
      if (data.success) {
          //alert("인증 메일이 전송되었습니다. 메일 ID: " + data.messageId);
          // 실제 서비스에서는 verificationCode를 클라이언트에 노출하지 않음
      } else {
          //alert("인증 메일 전송 실패: " + data.error);
      }
  })
  .catch(error => {
      console.error("이메일 전송 중 오류:", error);
      //alert("이메일 전송에 문제가 발생했습니다: " + error.message);
  });
}
