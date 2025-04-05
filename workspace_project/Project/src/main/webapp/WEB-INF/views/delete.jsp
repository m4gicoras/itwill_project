<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Boldonse&family=Great+Vibes&family=Noto+Sans+KR:wght@100..900&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Satisfy&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <title>회원탈퇴</title>

    <style>

        body {
          font-family: Arial, sans-serif;

          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }

        header {
          display: flex;
          align-items: center;
          height: 100px;

          position: absolute;
          top: 20px;
          left: 30px;
          z-index: 1000;

        }

        .logo {
           height: 130px;
           width: auto;

        }

         main {
           display: flex;
           flex-direction: column;
           align-items: center;
           margin-top: 50px; /* 브랜드명과 여백 */
           padding: 20px;
         }

         .page-title {
           font-family: "Noto Sans KR", sans-serif;
           text-align: center;
           font-size: 60px;
           font-weight: bold;
           margin-bottom: 15px;
           margin-top: 20px;
           color:#2c2c2c;
         }

        .container {

          height: 700px;
          width: 800px;
          background: white;

          margin-top:80px;
          margin-bottom:50px;

          text-align: center;

          padding: 10px;

          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;

        }

        .form-row {
          display: flex;
          gap: 15px;
          justify-content: center;

          padding: 10px;
        }

        .input-field, select, textarea {
            width: 100%;
            padding: 8px;

            border: 1px solid #ccc;

            font-size: 14px;
            margin: 0 auto;
            text-align: center;

        }

        .pw-box, .reason-box {
          border: 3px solid #d1d5db;
          padding: 10px;

          border-radius: 5px;
          background-color: #f9fafb;

          font-size: 50px;

          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;

          margin-bottom: 20px;
          gap: 8px;

        }

        .pw-box {
           width: 350px; height: 300px;
           text-align:center;

        }

        .pw-box label {
          font-size: 20px;
          font-weight: bold;
        }

        .pw-box .input-field {
           width: 80%;
           height: 20px;
           padding: 10px;
           border: 1px solid #ccc;
           border-radius: 3px;
           font-size: 14px;
           text-align: left;
           background-color: white;

        }

        .reason-box {
           width: 500px; height: 300px;

        }

        .reason-box label {
            white-space: nowrap;
            font-size: 18px;
            font-weight: bold;
            text-align:left;

        }

        .reason-box textarea {
          font-family: "Noto Sans KR", sans-serif;
          resize: none;
          width: 90%;
          height: 180px;
          text-align:left;
          margin-bottom:15px;
          border-radius:3px;
        }

        .reason-box select {
            width: 80%;

            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            text-align: left;
            resize: none;
            background: white;
        }

        .warning-box {
          font-family: "Noto Sans KR", sans-serif;
          background-color:#FAF0E6;
          padding: 20px;
          border: 2px solid #DEB887;
          border-radius: 3px;
          font-size: 18px;
          text-align: center;
          margin: auto;
          width: 90%; height: 70px;

          display: flex;
          justify-content: center;
          align-items: center;

        }

        .check-container {

          display: flex;
          justify-content: center;
          text-align: center;
          align-items: center;

          margin-top: 10px;
          margin-bottom: 50px;
        }

        .check-container label {
           position: relative;
           white-space: nowrap; /* 텍스트 줄바꿈 방지 */
           font-size: 16px;

        }

        .agree {
           margin-right: 10px;

        }

        .btn-group {
          display: flex;
          justify-content: center;
          gap: 10px;
        }

        .withdraw-btn {
          background-color: #0095f6;
          color: white;
          border: none;
          padding: 15px;
          font-size: 18px;
          border-radius: 5px;
          width: 150px;
          cursor: pointer;
          transition: 0.3s;
        }

        .cancel-btn {
          background-color: #C0C0C0;
          color: white;
          border: none;
          padding: 15px;
          font-size: 18px;
          border-radius: 5px;
          width: 150px;
          cursor: pointer;
          transition: 0.3s;

        }

        .cancel-btn:hover {
          background-color: #6c757d;
        }

        /*.withdraw-btn:disabled {
          background-color: #ccc;
          cursor: not-allowed;
        }*/
    </style>

</head>
<body>

<header>
    <img src="<%= request.getContextPath() %>/resources/images/Sellity.png" alt="Sellity Logo" class="logo">
</header>
<main>

    <h1 class="page-title">회원탈퇴</h1>

    <div class="container">
        <form action="withdraw_process.jsp" method="post">

            <div class="form-row">
                <div class="pw-box">

                    <label for="pw">비밀번호</label>
                    <input type="password" class="input-field" id="pw" name="password" required><br>



                    <label for="confirm-password">비밀번호 확인</label>
                    <input type="password" class="input-field" id="confirm-pw" name="confirm-password" required>


                </div>

                <div class="reason-box">
                    <div class="reason-select-group">

                        <label for="reason">탈퇴 사유</label>

                        <select id="reason" name="reason">
                            <option value="">선택하세요</option>
                            <option value="reason1">서비스가 마음에 들지 않아서</option>
                            <option value="reason2">더 이상 사용하지 않아서</option>
                            <option value="other">기타 (직접 입력)</option>
                        </select><br>

                    </div>

                    <textarea id="other" name="other-reason" maxlength="2000" placeholder="텍스트를 입력하세요. (최대 2,000자 까지)"></textarea>

                </div>

            </div>



            <div class="warning-box">
                회원탈퇴 처리 후 회원님의 개인정보는 즉시 파기되어 복원할 수 없으며,<br>
                해당 아이디는 영구적으로 삭제됩니다.
            </div>

            <div class="check-container">

                <input type="checkbox" class="agree" onchange="checkAgreement()">
                <label for="agree">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</label>

            </div>

            <div class="btn-group">

                <button type="submit" id="withdraw" class="withdraw-btn" onclick="validateForm(event)">회원 탈퇴</button>
                <button type="button" class="cancel-btn" onclick="window.location.href='main.jsp';">취소</button>
            </div>
    </div>
    </form>
    </div>
</main>

<script>
    function validateForm(event) {
    const pwInput = document.getElementById('pw');
    const password = pwInput.value;

    // 조건1: 길이 8~20자
    if (password.length < 8 || password.length > 20) {
      alert("비밀번호는 8자 이상 20자 이하로 입력해야 합니다.");
      pwInput.focus();
      event.preventDefault();
      return false;
    }

    // 조건2: 특수문자 최소 1개 이상 포함
    const specialCharRegex = /[!@#$%^&*]/;

    if (!specialCharRegex.test(password)) {
      alert("비밀번호에는 최소 1개의 특수문자를 포함해야 합니다.");
      pwInput.focus();
      event.preventDefault();
      return false;
    }

    // 조건 모두 통과 시 제출
    return true;
  }
</script>

</body>
</html>