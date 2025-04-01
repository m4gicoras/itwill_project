<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: "맑은 고딕", sans-serif;
            background-color: #f7f8fa;
        }

        .container {
            width: 460px;
            margin: 30px auto;
            padding: 25px 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-size: 14px;
        }

        .required {
            color: red;
            margin-left: 4px;
        }

        input, select {
            width: 100%;
            padding: 6px 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 12px;
        }

        .section-title {
            margin-top: 25px;
            padding-bottom: 5px;
            font-size: 15px;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
        }

        .checkbox-group {
            margin: 15px 0;
            font-size: 13px;
        }

        .checkbox-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 10px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4a76ff;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #f1e95f;
            color: #a69f0b;
        }

        .address-row {
            display: flex;
            gap: 8px;
            margin-bottom: 10px;
        }

        .address-row input {
            flex: 1;
        }

        .tooltip {
            display: none;
            background-color: #fff4f4;
            color: #d32f2f;
            padding: 8px 10px;
            border: 1px solid #f5c6cb;
            border-radius: 6px;
            font-size: 13px;
            position: absolute;
            z-index: 100;
            margin-top: 5px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <h2><span style="color: #ffc107;">셀리티</span> 회원 가입</h2>

    <form action="${pageContext.request.contextPath}/signup" method="post">

        <!-- 사용자 정보 -->
        <div class="section-title">사용자 정보</div>

        <!-- 아이디 -->
        <div style="position: relative;">
            <label>아이디<span class="required">*</span></label>
            <div style="display: flex; gap: 6px;">
                <input type="text" name="username" id="username" required style="flex: 1;">
                <button type="button" onclick="checkUsername()" style="width: 110px;">중복 확인</button>
            </div>
            <div id="idTooltip" class="tooltip">영문 소문자/숫자/_ 포함 6~12자 입력해주세요.</div>
            <div id="idCheckResult" style="font-size: 13px; margin-top: 6px;"></div>
        </div>

        <!-- 비밀번호 -->
        <div style="position: relative;">
            <label>비밀번호<span class="required">*</span></label>
            <input type="password" name="password" id="password" required>
            <div id="pwTooltip" class="tooltip">8~20자, 특수문자 1개 이상 포함해주세요.</div>
        </div>

        <!-- 비밀번호 확인 -->
        <label>비밀번호 확인<span class="required">*</span></label>
        <input type="password" name="passwordCheck" id="passwordCheck" required>
        <div id="pwMatchMessage" style="font-size: 13px; color: red; margin-bottom: 10px; display: none;">비밀번호가 일치하지 않습니다.</div>

        <!-- 기타 사용자 정보 -->
        <label>닉네임</label>
        <input type="text" name="nickname">

        <label>연락처</label>
        <div style="display: flex; gap: 6px; margin-bottom: 12px;">
            <input type="text" name="phone1" maxlength="3" required style="flex:1;" oninput="moveToNext(this, 'phone2')">
            <span>-</span>
            <input type="text" name="phone2" maxlength="4" required style="flex:1;" id="phone2" oninput="moveToNext(this, 'phone3')">
            <span>-</span>
            <input type="text" name="phone3" maxlength="4" required style="flex:1;" id="phone3">
        </div>

        <label>이메일<span class="required">*</span></label>
        <input type="email" name="email" required>

        <!-- 사업자 정보 -->
        <div class="section-title">사업자 정보</div>

        <label>상호/법인명<span class="required">*</span></label>
        <input type="text" name="companyName" required>

        <label>대표자명</label>
        <input type="text" name="ceoName">

        <label>사업자등록번호<span class="required">*</span></label>
        <div style="display: flex; gap: 6px; margin-bott om: 12px;">
            <input type="text" name="bizNum1" maxlength="3" required style="flex:1;" oninput="moveToNext(this, 'bizNum2')">
            <span>-</span>
            <input type="text" name="bizNum2" maxlength="2" required style="flex:1;" id="bizNum2" oninput="moveToNext(this, 'bizNum3')">
            <span>-</span>
            <input type="text" name="bizNum3" maxlength="5" required style="flex:1;" id="bizNum3">
        </div>


        <label>대표 전화</label>
        <input type="text" name="companyPhone">

        <label>주소<span class="required">*</span></label>
        <div class="address-row">
            <input type="text" id="address" name="address" placeholder="기본 주소" required readonly>
            <button type="button" onclick="execDaumPostcode()" style="width: 120px;">주소 검색</button>
        </div>
        <input type="text" id="addressDetail" name="addressDetail" placeholder="상세 주소 (예: 3층, 301호)">

        <label>취급상품 카테고리</label>
        <select name="category">
            <option value="">카테고리 선택</option>
            <option value="digital">가전/디지털</option>
            <option value="fashion">패션</option>
            <option value="food">식품</option>
            <option value="etc">기타</option>
        </select>

        <!-- 약관 동의 -->
        <div class="section-title">이용 약관</div>
        <div class="checkbox-group">
            <label><input type="checkbox" required> 서비스 이용 약관 동의<span class="required">*</span></label>
            <label><input type="checkbox"> 개인정보 수집 및 이용 동의</label>
            <label><input type="checkbox"> 정보 수신 동의</label>
        </div>

        <!-- 제출 버튼 -->
        <button type="submit">회원가입</button>
    </form>
</div>

<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 주소 검색 함수
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                const fullAddr = data.roadAddress ? data.roadAddress : data.jibunAddress;
                document.getElementById('address').value = fullAddr;
                document.getElementById('addressDetail').focus();
            }
        }).open();
    }

    // 전화번호 입력 시 자동 이동
    function moveToNext(current, nextId) {
        if (current.value.length === current.maxLength) {
            document.getElementById(nextId).focus();
        }
    }

    // 아이디 중복 검사
    function checkUsername() {
        const username = document.getElementById("username").value.trim();
        const resultDiv = document.getElementById("idCheckResult");

        if (!/^[a-z0-9_]{6,12}$/.test(username)) {
            resultDiv.style.color = "red";
            resultDiv.textContent = "아이디 형식이 올바르지 않습니다.";
            return;
        }

        fetch("${pageContext.request.contextPath}/checkUsername?username=" + encodeURIComponent(username))
            .then(res => res.text())
            .then(data => {
                if (data === "duplicate") {
                    resultDiv.style.color = "red";
                    resultDiv.textContent = "이미 사용 중인 아이디입니다.";
                } else {
                    resultDiv.style.color = "green";
                    resultDiv.textContent = "사용 가능한 아이디입니다!";
                }
            })
            .catch(err => {
                console.error(err);
                resultDiv.style.color = "red";
                resultDiv.textContent = "서버 오류가 발생했습니다.";
            });
    }

    // DOM 로드 후 이벤트 바인딩
    document.addEventListener("DOMContentLoaded", function () {
        const inputs = Array.from(document.querySelectorAll("input, select"));

        // 엔터 입력 시 다음 요소로 포커스
        inputs.forEach((input, index) => {
            input.addEventListener("keydown", function (e) {
                if (e.key === "Enter") {
                    e.preventDefault();
                    const next = inputs[index + 1];
                    if (next) next.focus();
                }
            });
        });

        // 비밀번호 & 비밀번호 확인 일치 검사
        const passwordInput = document.getElementById("password");
        const passwordCheckInput = document.getElementById("passwordCheck");
        const pwMatchMessage = document.getElementById("pwMatchMessage");

        passwordCheckInput.addEventListener("input", function () {
            pwMatchMessage.style.display = (this.value !== passwordInput.value) ? "block" : "none";
        });

        // 아이디 & 비밀번호 유효성 검사 툴팁
        const idInput = document.getElementById("username");
        const pwTooltip = document.getElementById("pwTooltip");
        const idTooltip = document.getElementById("idTooltip");

        idInput.addEventListener("blur", () => {
            const idReg = /^[a-z0-9_]{6,12}$/;
            toggleTooltip(idReg.test(idInput.value), idTooltip, idInput);
        });

        passwordInput.addEventListener("blur", () => {
            const pwReg = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
            toggleTooltip(pwReg.test(passwordInput.value), pwTooltip, passwordInput);
        });

        function toggleTooltip(isValid, tooltip, input) {
            tooltip.style.display = isValid ? "none" : "block";
            if (!isValid) {
                tooltip.style.top = (input.offsetTop + input.offsetHeight + 3) + "px";
                tooltip.style.left = input.offsetLeft + "px";
            }
        }
    });
</script>
</body>
</html>
