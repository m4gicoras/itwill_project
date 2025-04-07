<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SELLITY - 로그인</title>
  <link rel="stylesheet" href="style.css" />

  <style>

  * { box-sizing: border-box; }

  @font-face {
    font-family: 'KIMM_Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
  }

  body {
    font-family: 'KIMM_Bold', sans-serif;
    height: 100vh;
    margin: 0;
    overflow: hidden;
    position: relative;
  }

  /* ✅ 배경 블러 처리 영역 */
  .background-blur {
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background-image: url('<%= request.getContextPath() %>/resources/images/SELLITY3.png');
    background-size: cover;
    background-position: center;
    filter: blur(8px);
    z-index: -1;
  }

  .login-container {
    position: absolute;

    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(4px);

    border-radius: 12px;
    color: white;
    width: 100%; height: auto;
    max-width: 400px;   /* 너무 넓어지지 않도록 최대 한도 지정 */
    min-width: 250px;   /* 너무 좁아지지 않도록 최소 한도도 설정 가능 */
    padding: 2rem; /* rem은 전체적으로 일관된 크기 유지 */
    text-align: center;
    padding: 2rem;

  }

  .title {
    font-size: 2.5em;
    font-weight: bold;
    margin-bottom: 1em;
    user-select: none;
  }

  .subtitle {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2em;
    margin-bottom: 1.5em;
    color: white;
    user-select: none;
  }

  .subtitle .line {
    flex: 1;
    height: 1px;
    background-color: white;
    margin: 0 10px;
    opacity: 0.5;
  }

  .form-element {
    width: 90%;
    padding: 12px;
    font-size: 15px;
    border-radius: 6px;
    box-sizing: border-box;
    margin-bottom: 1em;
    line-height: 1.2;
    height: 44px;

  }
    input.form-element {
      border: none;
      background-color: #f5d3b4;
    }

    button.form-element {
      background-color: #e5b288;
      color: #fff;
      border: none;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s;
      margin-bottom: 5px;
      margin-top: 15px;
    }

    button.form-element:hover {
      background-color: #c98e5e;
    }


  .remember-container {
    user-select: none;

    display: flex;
    align-items: center;
    justify-content: flex-end;

    width: 80%;

    margin-bottom: 25px;

    padding-right: 10px;

  }

  .rememberId {
     margin-right: 3px; /* 체크박스와 텍스트 간격 조정 */

  }

  .remember-container label {
     position: relative;
     right: -50px;

     white-space: nowrap;

     font-size: 12px; /* 텍스트 크기 조절 */
     line-height: 1.0; /* 높낮이 균형 조절 */

}

  button { /* 페이지 안의 모든 버튼에 적용 */
    background-color: #e5b288;
    color: #fff;
    border: none;
    width: 100%;
    font-size: 15px;

    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
    padding: 12px;

    font-weight: bold;

  }


  button:hover {
    background-color: #c98e5e;
  }

  .find-links {
    margin-top: 1em;
    font-size: 0.9em;
    margin-bottom: 2em;

  }

  .find-links a {
    color: #fff;
    text-decoration: none;
    margin: 0 5px;

  }

  </style>
</head>

<body>
  <!-- ✅ 배경 블러 처리된 영역 -->
  <div class="background-blur"></div>

  <!-- 로그인 폼 -->
  <div class="login-container">
    <h1 class="title">SELLITY</h1>
    <h2 class="subtitle">
      <span class="line"></span>
      Login
      <span class="line"></span>
    </h2>

    <form class="login-form">
      <div class="input-group">
          <input type="email" id="email" placeholder="Email" class="form-element">
        </div>

      <div class="input-group">
          <input type="password" id="password" placeholder="Password" class="form-element">
        </div>

      <div class="remember-container">
        <label>
        <input type="checkbox" class="rememberId">아이디 저장
        </label>
      </div>

      <button type="submit" class="form-element">Enter</button>
    </form>

    <div class="find-links">
      <a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a>
    </div>
  </div>
</body>
</html>
