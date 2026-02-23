## Tableau Prep

[`Practice`](https://github.com/novicedata/Study/tree/main/2DA/Visualization/Tableau/practice)

- 데이터 정리, 변형하여 분석/시각화에 적합한 형태로 돕는 data prep 도구
- 분석/시각화 작업 시작 전 사용

<details>  
  <summary>  👉 Join, Union </summary>
  
- Left join: 왼쪽 테이블의 모든 레코드와 일치하는 오른쪽 테이블의 레코드 출력
- Inner join: 두 테이블 교집합 출력
- Right join: 오른쪽 테이블의 모든 레코드와 일치하는 왼쪽 테이블의 레코드 출력
- Full join: 두 테이블의 모든 레코드 반환
- Union: 두 개 이상의 테이블 수직으로 연결

<img width="850" height="295" alt="image" src="https://github.com/user-attachments/assets/9238777a-61b6-4435-9209-a44986ad2a9b" />

- In tableau prep
  - <img width="340" height="214" alt="image" src="https://github.com/user-attachments/assets/2ffa929b-7957-4188-bc79-c84154f6edd4" />
  - <img width="170" height="270" alt="image" src="https://github.com/user-attachments/assets/bddcabd9-cff4-4bac-b3fb-23bbbc048a5c" />
</details>

<details>  
  <summary>  👉 Data cleaning </summary>
  
- 하나의 컬럼을 여러 컬럼으로 분리
- 불필요한 공백, 특정 문자열 삭제 대체
- 데이터 그룹화 및 필터 사용
</details>

<details>  
  <summary>  👉 Data Pivoting </summary>
  
- rows to columns(pivot): 긴 형태 -> 넓은 형태
- columns to rows(unpivot): 넓은 형태 -> 긴 형태

<img width="441" height="243" alt="image" src="https://github.com/user-attachments/assets/ba588de5-8413-400a-baae-3d1068877595" />

- In tableau prep
  - <img width="223" height="308" alt="image" src="https://github.com/user-attachments/assets/0d165052-18f1-48bf-ab36-9842d7fbfe62" />
  - <img width="441" height="230" alt="image" src="https://github.com/user-attachments/assets/3ec39517-6ada-4763-8e3f-1011a2e6ec41" />
  - <img width="1188" height="628" alt="image" src="https://github.com/user-attachments/assets/bc0a4d6a-4297-4119-b74c-f304daad06fd" />
</details>

<details>  
  <summary>  👉 데이터 집계 </summary>
  
- 주의할 점
  - 데이터 집계하며 한 행에 무엇을 나타낼지, 세부화 수준 결정
  - 여러 데이터 포인트를 어떻게 하나의 값으로 집계할 지(sum, average, count, max, min)

- In tableau prep
  - <img width="213" height="291" alt="image" src="https://github.com/user-attachments/assets/0f48a22a-cd10-49ba-a6a2-a288f028c5a7" />
  - <img width="1709" height="618" alt="image" src="https://github.com/user-attachments/assets/133a7638-75fa-4981-8695-5f7507d09dea" />
  - <img width="1716" height="624" alt="image" src="https://github.com/user-attachments/assets/826ecb9e-53e1-4820-9a63-4b98f46048c2" />
</details>

## Tableau

[`퍼널 대시보드`](https://github.com/novicedata/Study/blob/main/2DA/Visualization/Tableau/practice/README.md)

[`코호트 별 고객 유지율`](https://github.com/novicedata/Study/blob/main/2DA/Visualization/Tableau/practice/README.md)

### 그래프 종류

<details>  
  <summary>  👉 히트맵(heatmap) </summary>
  
- 행과 열로 구성된 테이블 형태의 데이터를 색상 또는 그라데이션을 활용해 시각화
- 여러 변수의 상호작용이나 패턴 쉽게 파악

<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/b8ccc983-a67c-44ae-b39c-14464fe8d9ae" />
</details>

<details>  
  <summary>  👉 누적 막대 그래프 </summary>
  
- 다양한 범주에 대한 총합 또는 서브 구성 요소들의 비교
- 상/하단에 위치하지 않는 항목들 간의 상대적 비교가 어려움

<img width="799" height="314" alt="image" src="https://github.com/user-attachments/assets/677959a4-a06f-4887-80d7-ea60d81bae02" />
</details>

<details>  
  <summary>  👉 Box plot </summary>
  
- 데이터 분포 파악 용이
- 아웃라이어 쉽게 파악 가능
- 다른 변수, 그룹 간 분포 차이 쉽게 확인 가능

<img width="799" height="314" alt="image" src="https://github.com/user-attachments/assets/faf88b8c-5363-4d3c-8a63-8293bf438070" />
</details>

<details>  
  <summary>  👉 Sankey chart </summary>
  
- 한쪽에서 다른 쪽으로 흐르는 선을 통해 두 개 이상의 범주 간의 전환을 보여주며 데이터 흐름 설명
- 상황에 따라 더 간단한 차트 유형이 효과적일 수 있음

<img width="633" height="297" alt="image" src="https://github.com/user-attachments/assets/9624f0e5-dd94-4335-8a14-a18d1a17ed19" />
</details>

<details>  
  <summary>  👉 이중축 그래프 </summary>
  
- 한 차트 내에서 두 개의 서로 다른 축을 가지는 그래프 표시 방법
  - 두 가지 서로 다른 변수의 관계 시각화하고 비교
- 두 번째 Y축 이해하는 데 시간이 필요

<img width="760" height="245" alt="image" src="https://github.com/user-attachments/assets/cfe59b42-ff2c-471b-92c1-30a99f281ad5" />
</details>


### 기본 차트 기능

<details>  
  <summary>  👉 집계방식, 세분 </summary>
  
- 태블로에서 default는 총 합임. 아래와 같이 나옴.
  > <img width="380" height="400" alt="image" src="https://github.com/user-attachments/assets/7d41edbb-6aef-420d-87f8-36154c8d4ebd" />
- 우클릭을 통해 집계 방식 선택 가능
  > <img width="300" height="350" alt="image" src="https://github.com/user-attachments/assets/039d40bf-5550-42b8-8c32-a411c2b21c41" />
- 마크부분에 카테고리를 가져와 세분화가 가능
  > <img width="393" height="238" alt="image" src="https://github.com/user-attachments/assets/f32b74ec-10c8-476f-b4fd-40f9bcf63544" />
  > <img width="380" height="380" alt="image" src="https://github.com/user-attachments/assets/cccc025d-abc7-4ba7-8f57-6d766bb9bc01" />
- 여러개의 마크를 사용할 시. 여러 표시간 차이를 통해 시각화 가능
  > <img width="380" height="380" alt="image" src="https://github.com/user-attachments/assets/791fed70-f031-49cc-a087-35a80cea5655" />
</details>

<details>  
  <summary>  👉 자동 계층, 사용자 지정 계층 </summary>
  
- 자동으로 계층 별 나눠진 데이터는 아래 +버튼을 눌러 세분화 할 수 있음.
  > <img width="333" height="523" alt="image" src="https://github.com/user-attachments/assets/f93fcc71-5280-4190-bd3d-54e36793e3c1" />
  > <img width="600" height="500" alt="image" src="https://github.com/user-attachments/assets/7da601c8-7042-44bb-881b-627df8a7066e" />

- 사용자가 지정하는 계층은 아래 그림과 같이 feature를 끌고와 위에 덧대면 됨
  > <img width="219" height="67" alt="image" src="https://github.com/user-attachments/assets/da57759b-b5f8-460b-a229-26af519ec753" />
  > <img width="209" height="67" alt="image" src="https://github.com/user-attachments/assets/3f07d1de-5c0a-4141-acd3-c728873dee9e" />
- 자동 계층처럼 세분화 할 수 있고, 피벗 테이블과 같은 형태로 표현이 가능
  > <img width="600" height="400" alt="image" src="https://github.com/user-attachments/assets/0c65b52f-8560-4215-b3f9-44e8c034de29" />
</details>

<details>  
  <summary>  👉 필터 </summary>

- '일반'탭에서는 원하는 파트만 고르거나 제거할 수 있음
  > <img width="587" height="447" alt="image" src="https://github.com/user-attachments/assets/0ad25816-1a72-4de6-a86e-e3ce144deed2" />

- '와일드카드'탭에서는 특정 문자 포함할 경우만 가져올 수 있음
  > <img width="315" height="360" alt="image" src="https://github.com/user-attachments/assets/75bfc43f-15c2-4081-8512-2b1087bceef0" />

- '조건'탭에서는 각 feature별 조건을 걸어서 가져올 수 있음
  > <img width="336" height="361" alt="image" src="https://github.com/user-attachments/assets/1618dfb1-f81e-477f-94b2-5185dabf7e26" />

- '상위'탭에서도 상위 기준 조건을 걸어서 가져올 수 있음.
  > <img width="319" height="356" alt="image" src="https://github.com/user-attachments/assets/3a58f6c2-eae4-4a91-b08f-0584c81a6959" />
</details>

<details>  
  <summary>  👉 구간차원 생성하기 </summary>

- 아래와 같이 직접 구간차원 설정 가능
  > <img width="480" height="270" alt="image" src="https://github.com/user-attachments/assets/cbb44d32-4406-4261-a94b-32788f509e2d" />
  > <img width="700" height="600" alt="image" src="https://github.com/user-attachments/assets/de170280-6e46-4f79-a740-15aed4ca16e0" />
</details>

<details>  
  <summary>  👉 다중 측정값에 대한 축 추가 </summary>

- 측정값에 대한 개별 축: 행이나 열에 보고싶은 feature 여러개 놓으면 됨
  > <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/c99a18d6-4128-4554-a5df-5e8c4a6aec80" />

- 여러 측정값 단일 축: 시트의 레이블 부분에 끌어다 놓으면 됨
  > <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/bdbe929c-54a6-4630-9bf9-f1da6e1f865b" />
  > <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/cd5bcaa1-cb68-4897-bda0-d976a570faa7" />

- 이중 축: 오른쪽 부분에 끌어다 놓으면 x축 만 공유하는 이중 축 생성
  > <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/cdf87cf5-ab7b-4d86-a9b7-d4c852e9f700" />
  > <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/d0d19444-7860-4f4c-a9b0-05c1c9e7624a" />
  - 축 편집 -> 이중축 동기화로 스케일 맞춰줄 수 있음
    - <img width="800" height="600" alt="image" src="https://github.com/user-attachments/assets/fb15452d-c7dd-4fed-b786-b1951a24ec98" />
</details>

<details>  
  <summary>  👉 계산된 필드 만들기 </summary>

- 데이터 원본에 있는 데이터에서 새 데이터 생성
  - 데이터 분할, 유형 변환, 집계, 비율 계산 등등
 
- 3가지 타입 계산 유형
  - 기본 계산
  - LOD(level of details) 세부 수준 식
    - 1. 세분화된 수준(INCLUDE)
      2. 덜 세분화된 수준(EXCLUDE)
      3. 완전히 독립적인 수준(FIXED)
  - 테이블 계산: 그래프에 표시된 항목 기반 계산
 
- 아래를 통해 만들기 가능
  > <img width="231" height="185" alt="image" src="https://github.com/user-attachments/assets/b84c8d62-fbde-46ca-a5a5-ba25bc6866c4" />
  > <img width="508" height="292" alt="image" src="https://github.com/user-attachments/assets/20f9bce4-782e-4d24-94ae-792acb732a86" />
</details>

<details>  
  <summary>  👉 테이블 계산 </summary>

- 원본 데이터 기반이 아닌 현재 비주얼라이제이션에 표시된 항목을 기반으로 계산함
  - 파티션, 방, 레이아웃, 필터가 영향을 줌
  - <img width="444" height="254" alt="image" src="https://github.com/user-attachments/assets/f4bf9b39-17f5-4937-b224-b020525c7c00" />

- 아래와 같이 계산 방식, 대상을 변경 가능
  > <img width="406" height="540" alt="image" src="https://github.com/user-attachments/assets/7a35dbdd-7105-44d4-bbc2-7bfe1cda3f25" />

</details>

<details>  
  <summary>  👉 박스플롯 </summary>

- 오른쪽 위 표현방식을 이용해 가능
  > <img width="232" height="662" alt="image" src="https://github.com/user-attachments/assets/116fd368-436a-4faf-9997-08aad1b2f08c" />
</details>

<details>  
  <summary>  👉 LOD(level of details) </summary>

- lod 계산 (데이터 원본 수준 + visualization수준)
  : 계산할 세부 수준을 제어 가능

- lod type
  - 1. 완전히 독립 수준 (FIXED): 뷰의 차원 참조 X, 식으로 지정된 차원을 사용하여 계산
    2. 더 세분화된 수준 (INCLUDE): 지정된 차원 + 뷰의 모든 차원 사용하여 값 계산
    3. 덜 세분화된 수준 (EXCLUDE): 세부 수준에서 생략할 차원 선언. 구성 비율 or 전체 평균에 대한 차이가 필요한 경우 유용
  > <img width="486" height="349" alt="image" src="https://github.com/user-attachments/assets/5befad1d-3570-4d2d-957a-872c9c275698" />

- lod 식 구조문
  - {[FIXED | INCLUDE | EXCLUDE] \<dimension declaration>:\<aggregate expression>}
  - 위 그림 예시: {Fixed(or INCLUDE or EXCLUDE) [Region]: sum(Sales)}
</details>

<details>  
  <summary>  👉 태블로 작업 순서 </summary>

- 아래와 같은 순서로 진행되기 때문에, 원하는 시각화를 위해서는 순서에 맞게 사용해야함
- 원하는 단계에 적절한 lod, 필터, 컨텍스트를 사용해야 함
  > <img width="435" height="304" alt="image" src="https://github.com/user-attachments/assets/bd51edaf-cc36-45a0-80ae-30b7dfba0cca" />
</details>

<details>  
  <summary>  👉 매개변수 </summary>

- 사용자가 직접 선택 입력하는 값
- 매개변수 만드는 단계
  - 1. 매개변수 만들기
    2. 뷰의 측정값을 변경하는 계산된 필드 만들기
    3. 뷰 설정
   
- 예시
  > <img width="249" height="273" alt="image" src="https://github.com/user-attachments/assets/6701e05c-fac9-4c6a-8dc3-883bba63b192" />
  
  > <img width="400" height="500" alt="image" src="https://github.com/user-attachments/assets/c6fc4ffd-83c9-4191-a863-ec368d8ac301" />
  
  > <img width="236" height="122" alt="image" src="https://github.com/user-attachments/assets/f2027daa-c4ae-4264-bd63-7fa8afd2e53a" />
  
  > <img width="510" height="297" alt="image" src="https://github.com/user-attachments/assets/2dd87e5f-40d8-447c-87e5-04b40155ea69" />
  
  > <img width="209" height="406" alt="image" src="https://github.com/user-attachments/assets/2b0e8a64-319b-4038-b106-f14aa6ee15ca" />
</details>

<details>  
  <summary>  👉 매개변수2 (시트 간 매개변수) </summary>

- 시트 간에도 매개변수화가 가능
- 아래 처럼 먼저 매개변수 만든
  > <img width="559" height="662" alt="image" src="https://github.com/user-attachments/assets/0030d4e9-c69e-45eb-99ad-d597949fa490" />

- 계산된 필드에 제목만 입력해서 확인
  > <img width="511" height="299" alt="image" src="https://github.com/user-attachments/assets/cb9c4d24-99b9-4a71-a56a-602a4a2a8fc2" />

- 필터칸에 옮긴후 사용자 지정 값에 해당 시트에 해당하는 값만 입력. 해당 방법을 시트마다 반복
  > <img width="479" height="579" alt="image" src="https://github.com/user-attachments/assets/8d01b65b-c267-4f23-9408-dfd9fecc3ac9" />

- 워크시트에서 사용
</details>

<details>  
  <summary>  👉 지리정보 시각 </summary>

- 이중 레이어 지도: 아래처럼 경도 혹은 위도를 하나 더 끌어오면 레이어 두개가 생김
- 새로 넣은 경도 마크를 원하는 차트로 변경
- 마지막으로 우클릭, 이중축 클릭하면 겹쳐짐
  > <img width="475" height="79" alt="image" src="https://github.com/user-attachments/assets/8a82c81c-84f1-465d-a2a6-14dff2a37d12" />
  > <img width="162" height="413" alt="image" src="https://github.com/user-attachments/assets/afede15d-57ac-45ca-9065-6550b515f57d" />
  > <img width="352" height="292" alt="image" src="https://github.com/user-attachments/assets/4d26c010-158e-4bc4-b691-ba61bcbdb311" />
  > <img width="983" height="530" alt="image" src="https://github.com/user-attachments/assets/799dbf1f-1118-4f65-8a0e-50e8b9827999" />




</details>
