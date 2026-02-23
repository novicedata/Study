<details> 
  <summary> 상권 데이터 전처리 해보기 </summary>

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
</details>

<details> 
  <summary> AARRR 퍼널 대시보드 </summary>

## 1. 필드 만들기
- 영역 계산식 만들기
- 아래와 같은 계산식을 각 4개의 속성에 따라 step 1 ~ 4로 만들어
<img width="937" height="334" alt="image" src="https://github.com/user-attachments/assets/cdec69bc-6268-41f9-824d-c26730a3d316" />

## 2. 만든 측정값을 열로
- 만든 측정값 열로 넣은뒤 각 step별 계산 기준을 테이블(아래로)
<img width="691" height="710" alt="image" src="https://github.com/user-attachments/assets/f46f803b-4f1a-4f0e-8079-032a21216730" />

## 3. 한쪽 축을 반전
- 축 설정에서 반전을 이용해 깔때기 모양으로
<img width="453" height="667" alt="image" src="https://github.com/user-attachments/assets/00777e23-92af-4599-b8cd-a7ae9e454280" />

## 4. 퀵 테이블 비율 차이를 확인
- 아래와 같이 기준을 처음으로 하여, 사이트 입장부터 실제 구매까지의 비율을 확인
<img width="317" height="467" alt="image" src="https://github.com/user-attachments/assets/5c84db58-8004-4a40-bb1f-67cc06d18615" />
<img width="1364" height="656" alt="image" src="https://github.com/user-attachments/assets/aebf7602-7ec8-4dc9-bfc2-f60315912f6b" />

</details>

<details> 
  <summary> 코호트 별 고객 유지율 분석 </summary>

## 1. 첫 구매 쿼터 계산
- 아래와 같이 계산식 사용
- 해당 식을 행에 넣고, 분기/불연속형으로 확인

<img width="939" height="361" alt="image" src="https://github.com/user-attachments/assets/19eae8ee-79b9-4ccc-a4ac-518185a356be" />
<img width="436" height="797" alt="image" src="https://github.com/user-attachments/assets/48afdc6d-f426-4416-b5dd-7ae160d677a4" />

## 2. 쿼터 별 첫 구매자 확인, 유지율 확인
- 쿼터 별 첫 구매자 수식 만든 후 행에 넣기
- 후 유지율 계산식 만들어 확인

<img width="929" height="216" alt="image" src="https://github.com/user-attachments/assets/550594c6-511c-4c79-8e4a-3fe916d91575" />
<img width="461" height="71" alt="image" src="https://github.com/user-attachments/assets/60edcca8-cb18-433b-a054-704bc7eb262b" />
<img width="523" height="112" alt="image" src="https://github.com/user-attachments/assets/b987fae7-6a99-4799-9b65-b4307ad29267" />

## 3. 히트 맵 후 주문까지 얼마나 걸렸는가.
- 마크를 이용하여 히트맵으로 보기 쉽게 확인 후
- 아래와 같은 계산식으로 확인

<img width="617" height="122" alt="image" src="https://github.com/user-attachments/assets/dea46927-dd5a-4044-aea3-b36c1145bfed" />
<img width="1532" height="845" alt="image" src="https://github.com/user-attachments/assets/5a3b6687-5269-4e06-884e-376f98df6323" />



</details>
