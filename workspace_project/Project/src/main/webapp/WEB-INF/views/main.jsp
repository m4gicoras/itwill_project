<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>셀리티 - 메인페이지</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Boldonse&family=Great+Vibes&family=Satisfy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Boldonse&family=Great+Vibes&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&family=Satisfy&display=swap" rel="stylesheet">

    <style>
    
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            
            color: #555555;
            text-align: left;
            padding: 45px;
            font-size: 50px;
            font-family: "Great Vibes", cursive;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
                
        }
                
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
            font-family: Arial, sans-serif;
        }
            
        #bg-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -1;
        }

        .login-container {
            position: absolute;
            top: 50%; left: 50%; 
            transform: translate(-50%, -50%);
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid #dbdbdb;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease-in-out;
            
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            
        }
                
        @media (max-width: 768px) {
          .login-container {
            width: 70%;
            padding: 20px;
            
          }
        }


       @media (max-width: 480px) {
         .login-container {
           width: 85%;
           padding: 10px;
           
          }
        }

        .logo {
            font-family: "Roboto Mono", monospace;
          
            font-size: 25px;
            margin-bottom: 40px;
        }

        .input-field {
            width: 80%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #dbdbdb;
            border-radius: 3px;
            background: #fafafa;
        }
        
        .remember-container {
            
            position: relative;
            display: flex;
            align-items: center;
            justify-content: flex-end;
          
            width: 80%; 
            font-size: 15px;
            margin-bottom: 15px;
            
            padding-right: 10px;
        }
        
        .rememberId {
             margin-right: 2px; /* 체크박스와 텍스트 간격 조정 */       
             
        }
         
        .remember-container label {
           position: relative;
           right: -45px;  /* 비밀번호 입력칸의 끝과 정렬 조정 */
           white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    
           font-size: 14px; /* 텍스트 크기 조절 */
           line-height: 1.5; /* 높낮이 균형 조절 */
        
        }
       
        .login-btn { /*로그인 버튼*/
            width: 85%;
            padding: 15px;
            background-color: #0095f6;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
        }
                
        .options { /*아이디, 비밀번호 찾기*/
            /* display: flex;
            justify-content: center; 
            margin-top: 10px;
            
            gap: 50px; */
            
            margin-top: 10px;
            font-size: 12px;
            display : block;
        }
        
        .options a {
            color: #555;
            text-decoration: none; 
 
            
        }
        
        .options a:first-child {
             margin-right: 20px; /* 첫 번째 링크 오른쪽에 여백 추가 */
        }
        
        .signup-box { /*회원가입*/
            width: 85%;
            text-align: center;
            border: none;
            background: #C0C0C0;
            padding: 13px;
            margin-top: 10px;
            border-radius:3px;
        }
  
        
    </style>
    
</head>
<body>

    <header id="dynamic-header">Sellity</header>

    <video autoplay muted loop id="bg-video">
        <source src="${pageContext.request.contextPath}/resources/forest.mp4" type="video/mp4">
        브라우저가 비디오 태그를 지원하지 않습니다.
    </video>

        <div class="login-container">
          <form id="loginForm" action="${pageContext.request.contextPath}/main" method="post">
            <div class="logo">Sign in</div>
            
            <input type="text" class="input-field" placeholder="사용자 이름 또는 이메일">
            <input type="password" class="input-field" placeholder="비밀번호">
            </br>
            
            
            <div class="remember-container">
              <label>
               <input type="checkbox" class="rememberId"> 아이디 저장
              </label> 
            </div>
            
            
            <button type="submit" class="login-btn">로그인</button>
            <button type="button" class="signup-box" onclick="location.href='${pageContext.request.contextPath}/signup'">회원가입</button>
            
            
            <div class="options">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
            
            </form>
            
        </div>
        
        
     <script>
        document.getElementById("loginForm").addEventListener("submit", function(e) {
            e.preventDefault(); // 기본 폼 제출 동작 방지

            const form = e.target;
            const formData = new FormData(form);
            const params = new URLSearchParams(formData);

            fetch(form.action, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: params.toString()
            })
            .then(response => response.json())
            .then(data => {
                // 응답 받은 메시지와 타입에 따라 메시지 컨테이너 업데이트
                const messageContainer = document.getElementById("messageContainer");
                messageContainer.innerText = data.message;
                messageContainer.className = data.messageType;
            })
            .catch(error => {
                console.error("Error:", error);
            });
        });

    </script>   
        
     <script>
     
     //<script src="${pageContext.request.contextPath}/resources/js/script.js">
     
        function adjustHeader() {
    	    let header = document.getElementById("dynamic-header");
    	    let width = window.innerWidth;

    	    if (width < 600) {
    	        header.style.fontSize = "30px"; // 모바일 화면에서는 크기 줄이기
    	        header.style.padding = "25px";
    	    } else {
    	        header.style.fontSize = "50px"; // PC 화면에서는 원래 크기로
    	        header.style.padding = "45px";
    	    }
    	}
        
           document.addEventListener("DOMContentLoaded", adjustHeader);
           window.addEventListener("resize", adjustHeader);
        
   </script>


</body>
</html>
