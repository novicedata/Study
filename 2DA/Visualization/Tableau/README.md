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
