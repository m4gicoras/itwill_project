# 아이티윌 프로젝트 2팀

## 프로젝트 소개 - Sellity

- Sellity는 B2B 물류 거래 자동화 서비스입니다.
- 기업의 보유하고 있는 물품의 재고를 보다 효율적으로 관리할 수 있습니다.
- 다른 기업의 다양한 물품을 조회하고 자유롭게 거래할 수 있습니다.
- 복잡하지 않아, 빠르게 서비스를 이용할 수 있습니다.

- 프로젝트 개발 기간: 2025-03-19 ~ 2025-04-22

<br>

  [Sellity 바로가기](http://34.168.32.224:8080/web/main)

<br>

## 팀원 목록

- 팀장 : 김범호 
- 팀원 : 김수빈
- 팀원 : 도정민
- 팀원 : 오예림

## 역할 분담

### 김범호

- 대시보드 페이지 설계 & 템플릿 제작
- 대시보드 내 스크롤 방식 구현 (페이지 기반 -> 테이블 기반)
- 프로젝트 내 공용 스타일 및 리소스 제작
- 로그인 및 회원가입 로직 구현
- 아이디 찾기 및 비밀번호 찾기 로직 구현
- 이메일 인증 기능 구현 (OAuth, Gmail API 사용)
- 이메일 인증 관련 인증번호 템플릿 페이지 제작
- MyBatis를 이용한 DB 상호작용 구현
- 프로젝트 내 파일 업로드 시스템 구현 (GCS API 사용)
- 프로필 이미지 변경 시스템 구현 (GCS API 사용)
- 상품 목록 페이지 제작
- 상품 등록 페이지 - 상품 등록 로직 구현
- 배포 서버 연동 (CI/CD)
- 프로젝트 총괄

### 김수빈


### 도정민
- 관리자 화면 설계 및 검색창 구현
- 물품 관리 페이지: 회원 DB 연동, 물품 리스트 출력, 페이징(10개 단위), 물품번호 기준 정렬(오름차/내림차순)
- 회원 관리 페이지: 회원 클릭 시 팝업창 표시 및 '함께한 지 N일' 계산 기능 구현
- 기업 마이페이지에 입고/출고 현황 기능 구현
- 입고 상태: 입고 준비 → 입고 진행 → 입고 완료 단계별 상태 처리
- 출고 상태: 출고 준비 → 출고 진행 → 출고 완료 + 상태 동기화 및 출고 완료 시 알림 전송
- 입고 완료 시 자동으로 완료 일시 기록
- 기업 구매 페이지(shop): 기본 UI 구성, 상품 목록 출력, 카테고리 필터, 검색 기능 구현
- 견적 요청 기능: 상대 기업에게 상품 수량/단가 입력 후 견적 전송
- 견적 수신 기능: 상대 기업은 '견적 현황' 페이지에서 수락/거절 처리 가능
- 견적 상태 변경 시 양측 기업에 알림 메시지 전송 (새 알림이 도착하였습니다.)
- 견적을 보낸 기업은 수락/거절 여부를 실시간으로 확인 가
- 견적 수락 시 '정산 현황'에 결제대기 상태 표시
- 결제하기 버튼 마우스오버 시 카카오페이 결제 연동 (PortOne API 사용)
- 견적 기준으로 받아야 할 금액(수입)과 내야 할 금액(지출) 항목을 색상으로 구분하여 표시



### 오예림


<br>

## ⚙️ 개발 환경

<table>
      <thead align="center">
        <tr>
          <th colspan="4" style="text-align:center;"><span style="font-size:16px;">프론트엔드</span></th>
          <th style="text-align:center;"><span style="font-size:16px">백엔드</span></th>
          <th style="text-align:center;"><span style="font-size:16px">서버</span></th>
          <th colspan="2" style="text-align:center;"><span style="font-size:16px;">DB</span></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td align="center" style="text-align:center;">
            <a href="https://reactjs.org/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1657314490/noticon/ur8spzfcq4acw7ijp68v.png" alt="TailWindCSS" height="50" /></a>
            <br>
            <code>TailWindCSS</code>
          </td>
          <td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1566995514/noticon/jufppyr8htislboas4ve.png" alt="HTML5" height="50" /></a>
            <br>
            <code>HTML5</code>
          </td>
          <td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1629279836/noticon/qopgwljhqw2ezqxnfjpe.png" alt="JS" height="50" /></a>
            <br>
            <code>JavaScript</code>
          </td>
          <td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1623252802/noticon/dwhdor3qcwlynwmnqsxy.png" alt="AJAX" height="50" /></a>
            <br>
            <code>AJAX</code>
          </td>
          <td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1566778017/noticon/ytjm1rralodyhvuggrpu.png" alt="AJAX" height="50" /></a>
            <br>
            <code>Spring 3</code>
          </td>
          <td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1576681183/noticon/cytfygu8ycqcg2vm7tte.png" alt="서버" height="50" /></a>
            <br>
            <code>Tomcat 9</code>
          </td>
<td align="center" style="text-align:center; margin: 0 auto;">
            <a href="https://styled-components.com/" target="_blank"><img style="margin: 10px" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1603423163/noticon/az0cvs28lm7gxoowlsva.png" alt="MySQL" height="50" /></a>
            <br>
            <code>MySQL</code>
          </td>
</table>

<br>

## 🤝 협업 방식</a>

1. 디스코드로 소통하여 필요한 부분에 대해 의논합니다.
2. 해당하는 부분에 대한 브랜치를 생성하여 작업합니다.
3. 기능 구현 단위로 commit을 진행합니다.
4. 작업 도중 완료된 부분에 대해 **PR(Pull Request)** 을 생성합니다.
- Commit, PR, Issues가 발생하면 다른 팀원들이 확인할 수 있도록 디스코드 봇이 관련 채널로 메시지를 보내게 하여 팀원이 모두 알 수 있게 했습니다.
5. 팀장이 해당 PR에 대해 확인하고 충돌이 나는 부분이 있는지, 없다면 dev 브랜치에 병합하여 작업을 반영합니다.
6. 작업이 끝난 부분에 대해 main 브랜치에 병합하여 외부 서버에서 정상 작동 유무를 확인합니다.
    <img style="margin: 10px" width=60% src="./preview/discord.png" alt="디스코드 깃허브 알람"/>

## 🔀 브랜치 전략

- 프로젝트 기간 동안 팀원들이 모두 각기 다른 작업을 진행하기 때문에 작업 별로 브랜치를 나누고 dev 브랜치에 병합한 뒤, 문제가 없는 부분에 대해서는 main 브랜치에 병합하도록 진행했습니다.

<br>

## 📐 컨벤션

팀원 간의 원활한 소통과 협업을 위해 프로젝트 내에서 사용할 컨벤션을 정의했습니다.

### [🔗 브랜치 컨벤션](https://github.com/nailedReact/bokgungom-market/wiki/%F0%9F%93%A8-%EC%BB%A4%EB%B0%8B-%EC%BB%A8%EB%B2%A4%EC%85%98)

- 브랜치 명을 본인 이니셜로 작성하여 어떤 작업중인지 알 수 없어, 프로젝트 내에 다음과 같은 컨벤션을 따르도록 했습니다.

    ```
        - 브랜치는 영어로 작성하며, dev_로 시작합니다.
        - 반드시 대략적인 기능을 포함하도록 했습니다. (dev_product)
        - 선택에 따라 브랜치 이름 마지막 부분에 본인 식별자를 했습니다. (dev_product_oyl)
    ```

<br>

### [🔗 코드 컨벤션]
- 프로젝트 내에서 사용할 코드 컨벤션을 정의했습니다.

    ```
        - 클래스명은 PascalCase, 메서드명은 camelCase으로 작성합니다.
        - 변수 및 상수는 반드시 의미가 있고, 의미를 알 수 있는 이름으로 작성합니다.
        - 연산자와 피연산자 사이에는 항상 1칸의 공백을 삽입합니다.
        - 메서드 호출 시, 매개변수 사이에는 항상 1칸의 공백을 삽입합니다.
        - 생성한 클래스, 메소드에는 주석으로 설명을 표시합니다.
        - Test 클래스일 경우, 클래스 이름은 반드시 마지막에 Test가 붙도록 작성합니다.
    ```

## 페이지 미리보기

<table width="100%">
<tr>
    <th colspan="1">메인 페이지</th>
</tr>

<tr align="center">
    <td valign="top" width="100%">
    메인 페이지
    </td>
</tr>

</table>

<br>


