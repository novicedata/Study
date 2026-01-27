# 상권 데이터 전처리 해보기

## 1. 원하는 필드값 만 확인
<img width="1011" height="682" alt="image" src="https://github.com/user-attachments/assets/05fa1bc2-1dc0-4130-b4ef-bed43df74e49" />

## 2. 상권 코드 기준 조인
<img width="1292" height="856" alt="image" src="https://github.com/user-attachments/assets/ef417ce4-609e-4d8a-838e-fbff69989b41" />

## 3. 인구수 기준 피봇
<img width="534" height="412" alt="image" src="https://github.com/user-attachments/assets/bd78842e-e0ac-479b-b74c-67246fa41637" />
<img width="1701" height="669" alt="image" src="https://github.com/user-attachments/assets/77d9d6c8-cf2c-4d4b-8787-c073f662a9eb" />

- 중복 상권 코드 제거

## 4. 상권 영역 테이블 조인
<img width="270" height="150" alt="image" src="https://github.com/user-attachments/assets/6c9eebcf-44b0-4173-ae36-4f513a9e2848" />

## 5. 행정동 코드 정보 알기 위해 행정동_정보 테이블 조인
<img width="241" height="156" alt="image" src="https://github.com/user-attachments/assets/8092d492-e049-4fbd-a904-69e4122aa900" />

- 매핑이 아래처럼 되지 않아 행정동_정보 테이블의 값 00을 빼줘야함
<img width="405" height="401" alt="image" src="https://github.com/user-attachments/assets/85fa3ce6-11a7-41ca-9c3b-3d33b71d1e8f" />
<img width="465" height="607" alt="image" src="https://github.com/user-attachments/assets/d2288059-201f-4028-8a5d-574a1b121d0e" />
<img width="433" height="114" alt="image" src="https://github.com/user-attachments/assets/840d3367-a9b8-450e-9928-bc134abc0f54" />

- 적용된 조인 절 조정하고 각 조인 열의 타입이 맞게 조정
<img width="355" height="126" alt="image" src="https://github.com/user-attachments/assets/2816f0ca-9388-4c3d-a264-030bd7b0bc50" />
<img width="418" height="367" alt="image" src="https://github.com/user-attachments/assets/c7e165fa-e5b6-434a-a79b-0f3a6d762f16" />


## 6. 행정동 코드별 인구수 타입 확인
<img width="230" height="326" alt="image" src="https://github.com/user-attachments/assets/a1e4dde0-9435-4cc7-8626-5d024c140366" />
<img width="1575" height="645" alt="image" src="https://github.com/user-attachments/assets/a1993e1b-6a68-4e79-ade4-307f6c5c3e98" />

## 7. 추출
<img width="249" height="345" alt="image" src="https://github.com/user-attachments/assets/68b8392e-4679-4292-a630-e902f72db13f" />
<img width="915" height="568" alt="image" src="https://github.com/user-attachments/assets/25d29675-0555-49f3-b30e-ea896498f202" />

