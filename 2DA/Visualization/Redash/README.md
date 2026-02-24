# Redash

## Graph

- [`연습용 데이터`]
- [`연습용 지표 쿼리`]

<details>  
  <summary>  👉 Counter </summary>

- 매출 1 지표 사용

- **주요 옵션**
  - Counter Value: 메인 값
  - Target Value: 비교할 값
  - Formatting Demical: 소수점 등 설정
  - Formatting String: 단위 설정

> <img width="896" height="501" alt="image" src="https://github.com/user-attachments/assets/43648253-3226-41e5-ae76-dd0ecfd5eccf" />
> <img width="896" height="684" alt="image" src="https://github.com/user-attachments/assets/e7151c85-445b-43f0-9f71-604706cd528c" />
</details>

<details>  
  <summary>  👉 Bar, Pie, Area, Box plot 등등 대부분의 차트가 유사 </summary>

- 매출 1 지표 사용

- **주요 옵션**
  - Errors column: 신뢰구간
  - Legends: 범례
  - Y Axis Scale: 선형, 로그 등 가능
  - Min/Max Scale: Y축 범위 곡정
  - Align Y Axes at Zero: 좌/우 축을 0 기준으로
  - Series: 칼럼들의 표시 순서, 이름, 축 방향, 축 종류 등 설정 가능
  - Lables: 값 표기법 관련

> <img width="883" height="740" alt="image" src="https://github.com/user-attachments/assets/51d19c7a-38f5-4712-9c90-30d721b81918" />
> <img width="891" height="332" alt="image" src="https://github.com/user-attachments/assets/31138a63-da9d-41f4-ac8b-5b2f8f160145" />
> <img width="893" height="748" alt="image" src="https://github.com/user-attachments/assets/5b39e845-788d-41f4-8a39-99b33d06466c" />
> <img width="880" height="253" alt="image" src="https://github.com/user-attachments/assets/1eec8985-af49-4428-b7dd-31f6bb3d6365" />
> <img width="889" height="269" alt="image" src="https://github.com/user-attachments/assets/5d46e818-47d5-4cb0-a65f-a8b9fddcc9d7" />
> <img width="888" height="380" alt="image" src="https://github.com/user-attachments/assets/a29dbdde-1a07-4716-991b-065905a5ac0e" />

</details>

<details>  
  <summary>  👉 Pivot </summary>

- 매출 2 지표 사용

- **주요 옵션**
  - 피벗 시각화를 위한 히트맵 설정 가능
  - sum, count 등 다양한 지표를 설정해 활용 가능
  - 행과 열 데이터는 드래그로 조정 가능

> <img width="879" height="737" alt="image" src="https://github.com/user-attachments/assets/e7bd8c99-7a5f-41b7-b121-4bd62a418e0d" />
> <img width="645" height="162" alt="image" src="https://github.com/user-attachments/assets/921e10bf-70ba-4ec0-85e2-be3bbdf52868" />
> <img width="704" height="548" alt="image" src="https://github.com/user-attachments/assets/aae2794f-d1b2-4177-bd5d-297fdbb66fcf" />
</details>

<details>  
  <summary>  📑 [실습] 가장 매출에 많이 기여한 카테고리/브랜드는? (Pivot, Pie, Bar, Table) </summary>

- 매출 2, 4 지표 사용
- **시각화에 정답은 없으나 목적에 맞는 정보를 얻기 위해 어떤걸 써야하는 고민해야함**


- 파이 차트(시계열에는 적합하지 못함)
  > <img width="866" height="390" alt="image" src="https://github.com/user-attachments/assets/188a5420-9d49-4dcc-8c18-0658d3de732a" />

- 피벗 테이블(시계열, 히트맵으로 확인이 가능)
  > <img width="647" height="776" alt="image" src="https://github.com/user-attachments/assets/47c46862-36c2-4b59-805c-a17ca6d1f92e" />

- 순위 바 그래프(Redash 사용법 자체는 쉬움. **쿼리 사용가능하냐가 중요**)
  > <img width="878" height="408" alt="image" src="https://github.com/user-attachments/assets/d3a4aa94-039f-4b92-ac48-5447de72423d" />

- 테이블
  - URL 사용가능, Display 방식 조정하여 이미지 가능
    > <img width="861" height="765" alt="image" src="https://github.com/user-attachments/assets/37144871-90c7-442e-af6e-3150ebdeb9ab" />
    > <img width="856" height="660" alt="image" src="https://github.com/user-attachments/assets/0e5b416d-7bd4-4e9d-8c01-3feab92d97ec" />
</details>
