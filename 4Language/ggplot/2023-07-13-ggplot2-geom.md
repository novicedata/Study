---
excerpt: "ggplot2의 geom 명령어를 알아보자"

categories:
  - ggplot2

tags:
  - [geom]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-13
last_modified_at: 2023-07-13

title: "[ggplot2] 데이터 시각화 문법(geom 모음)"
---
<br>

포스팅도 하고 슬슬 연구를 하며 데이터를 보아야할 일이 생기는데 ggplot2를 자주 쓰게되네요.. 원래는 gpt에게 물어보곤 했는데 솔직히 맘에 안들게 가르쳐주는 경우가 더 많습니다. 그래서 공부할겸! 블로그에 정리해 놓고 제가 필요할 때마다 찾아보려고 합니다 ㅎㅎ..

**`각각의 그래프에 대한 색상, 크기 등등 변경법도 포스팅 해놓을 터이니 블로그 내 포스팅을 이용해주시면 감사하겠습니다!!`**

**`또, 마지막 표에 각각 명령어에 대한 그림이 어떻게 나오는지 만들어놨습니다`**

<br>

> 기본 문법

```python
ggplot(data = 데이터 명,
        mapping = aes(x = x축에 쓸 변수
                      y = y축에 쓸 변수))
```

위 문법은 `무조건` 써주셔야 해요. 당연히 데이터 보는데 데이터를 안넣어주면 안되겠죠?

산점도, 히스토그램, 선그래프 등등 여러 데이터 시각화 방법이 있는데, 본 포스팅에 간단하게 한번에 정리하려고해요.(*제가 보기 편하려구..*)

<br>

# 1️⃣ 변수 하나일 때
---
## 변수가 이산, 연속 상관없다.

여기서 데이터는 ISLR 패키지에 있는 Auto를 사용했습니다. 제일 위에 있길래 ㅎㅎ

### geom_area : 색 채워진 면적그래프

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_area(stat='bin')
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/31eed350-c214-47f5-8a64-080d6fc8c065)

### geom_freqpoly() : 색 비워진 면적그래프

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_freqpoly() 
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/340014f3-06f4-40b5-adf3-53497feaea09)

### geom_density : 밀도 플롯

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_density()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/f9de1ca1-d4d6-4cbc-a302-e230d983f626)

### geom_dotplot() : 점그래프

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_dotplot()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/126e2471-6d14-4a51-a344-8da8bb17254f)

### geom_histogram() : 히스토그램

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_histogram()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/a2a09c57-f5bd-4f61-ae72-3dc8f293b077)

### geom_bar() : 바 그래프

```python
ggplot(data = Auto,
        mapping = aes(x = horsepower)) +
  geom_bar()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/aee1e6ee-a52c-4ca6-9707-ac3a4127c6da)

### ➕ 모음 표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_area() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/31eed350-c214-47f5-8a64-080d6fc8c065) | geom_freqpoly() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/340014f3-06f4-40b5-adf3-53497feaea09) |
| geom_density() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/f9de1ca1-d4d6-4cbc-a302-e230d983f626) | geom_dotplot() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/126e2471-6d14-4a51-a344-8da8bb17254f) |
| geom_histogram() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/a2a09c57-f5bd-4f61-ae72-3dc8f293b077) | geom_bar() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/aee1e6ee-a52c-4ca6-9707-ac3a4127c6da) |

<br>

# 2️⃣ 변수 두개일 때
---

## ◾ X : 연속 변수, Y : 연속 변수

여기서 데이터는 mpg를 사용했습니다.

### geom_jitter() : 서로 겹치지 않도록 랜덤으로 노이즈를 추가한 산점도

```python
ggplot(data = mpg,
        mapping = aes(x = displ,
                      y = hwy)) +
  geom_jitter()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/aabac144-4254-4da3-ac04-c7ce7193c08d)

### geom_point() : 산점도

```python
ggplot(data = mpg,
        mapping = aes(x = displ,
                      y = hwy)) +
  geom_point()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/8ace47f6-620e-4435-a8ac-6534471602b7)

### geom_quantile() : 분위수 그래프(그래프에 분위수선 표시)

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_quantile()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/67cebb4d-c27c-40c8-9b0d-cfb58b4b69af)

### geom_rug() : 러그 플롯(축에 표시해주는 역할)

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_rug()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/5dc42f9d-a7d4-4af4-890b-28488f61c8fd)

### geom_smooth() : 추세선 그래프(데이터에 추세선 표시해주는 역할)

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_smooth()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/9a910128-8dc3-4357-976f-a8f2b443fcbf)

### geom_text() : 텍스트 산점도(지정한 변수 값 표시해주는 역할)

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_text(aes(label=displ))
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/71d4d41c-6050-4898-8edc-c10468c13213)

### ➕ 모음 표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_jitter() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/aabac144-4254-4da3-ac04-c7ce7193c08d) | geom_point() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/8ace47f6-620e-4435-a8ac-6534471602b7) |
| geom_quantile() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/67cebb4d-c27c-40c8-9b0d-cfb58b4b69af) | geom_rug() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/5dc42f9d-a7d4-4af4-890b-28488f61c8fd) |
| geom_smooth() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/9a910128-8dc3-4357-976f-a8f2b443fcbf) | geom_text() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/71d4d41c-6050-4898-8edc-c10468c13213) |

<br>

## ◾ X : 이산 변수, Y : 연속 변수

여기서 데이터는 Impg를 사용했습니다.

### geom_bar() : 바형 그래프

```python
ggplot(data = mpg,
       mapping = aes(x = class,
                     y = hwy)) +
  geom_bar(stat='identity')
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/4b5ec570-b6c1-4b82-8819-c5365aeeea56)

### geom_boxplot() : 박스플롯

```python
ggplot(data = mpg,
       mapping = aes(x = class,
                     y = hwy)) +
  geom_boxplot()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/89e7a398-e851-4355-a13c-cd930813da57)

### geom_dotplot() : 점 플롯

```python
ggplot(data = mpg,
       mapping = aes(x = class,
                     y = hwy)) +
  geom_dotplot(binaxis = 'y',
               stackdir = 'center')
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/62cea68e-9385-4de5-99c6-740d23b73fb8)

### geom_violin() : 바이올린 형태 그래프

```python
ggplot(data = mpg,
       mapping = aes(x = class,
                     y = hwy)) +
  geom_violin()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/2c87115a-682f-4fe2-bf68-d24ea0207340)

### ➕ 모음 표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_bar() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/4b5ec570-b6c1-4b82-8819-c5365aeeea56) | geom_boxplot() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/89e7a398-e851-4355-a13c-cd930813da57) |
| geom_dotplot() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/62cea68e-9385-4de5-99c6-740d23b73fb8) | geom_violin() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/2c87115a-682f-4fe2-bf68-d24ea0207340) |

<br>

## ◾ 두변수 모두 연속일 때 관계 확인

두 변수 모두 연속일 때 서로의 관계를 확인해줄 수 있는 명령어 입니다. 데이터는 mpg를 사용했습니다.

### geom_bin2d() : 2차원 히스토그램

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_bin2d()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/a417d7d0-2c97-4ba7-9ad4-3f67b8940150)

### geom_density2d() : 관계 히트맵

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_density2d()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/82c3abe5-aa40-432d-8fc7-77808e48a44a)

### geom_hex() : 2차원 히스토그램 육각형

```python
ggplot(data = mpg,
       mapping = aes(x = displ,
                     y = hwy)) +
  geom_hex()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/3e1c67f5-08f4-40c8-bf76-36de13e67e99)

### ➕ 모음 표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_bin2d() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/a417d7d0-2c97-4ba7-9ad4-3f67b8940150) | geom_density2d() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/82c3abe5-aa40-432d-8fc7-77808e48a44a) |
| gemo_hex() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/3e1c67f5-08f4-40c8-bf76-36de13e67e99) |     |     |

<br>

## ◾ 데이터 포인트를 연결된 선으로 표시

데이터를 연결된 선으로 표시하는 명령어들입니다. 사용한 데이터는 economics입니다.

### geom_line() : 선형 그래프

```python
ggplot(data = economics,
       mapping = aes(x = date,
                     y = unemploy)) +
  geom_line()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/f5e1d7d0-2181-4b16-9860-88d29d81f67b)

### geom_step() : 계단형 그래프

모양은 그런데.. 계단형 그래프입니다.

```python
ggplot(data = economics,
       mapping = aes(x = date,
                     y = unemploy)) +
  geom_step()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/af3dab6c-df95-4076-8505-b395d98e58c1)

### ➕ 모음 표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_line() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/f5e1d7d0-2181-4b16-9860-88d29d81f67b) | geom_step() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/af3dab6c-df95-4076-8505-b395d98e58c1) |

<br>

## ◾ 에러 시각화

error를 시각화하는 명령어 입니다. **해당 함수는 y의 최대, 최소값을 지정해주어야해요.**

### geom_crossbar() : 크로스바 형식

```python
df <- data.frame(grp = c('A','B'), fit =  4:5, se =1:2)

ggplot(data = df,
       mapping = aes(x = grp,
                     y = fit,
                     ymin = fit-se,
                     ymax = fit+se)) +
  geom_crossbar()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/e05a838d-6a9e-41ba-8a95-4b0432f96517)

### geom_errorbar() : 에러바

```python
df <- data.frame(grp = c('A','B'), fit =  4:5, se =1:2)

ggplot(data = df,
       mapping = aes(x = grp,
                     y = fit,
                     ymin = fit-se,
                     ymax = fit+se)) +
  geom_errorbar()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/d0bfb00a-4ece-488c-910a-c0cfc2a1294b)

### geom_linerange() : 라인 범위 그래프

```python
df <- data.frame(grp = c('A','B'), fit =  4:5, se =1:2)

ggplot(data = df,
       mapping = aes(x = grp,
                     y = fit,
                     ymin = fit-se,
                     ymax = fit+se)) +
  geom_linerange()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/a7386a8e-2f27-4c8f-900c-5d096cbe64cb)

### geom_pointrange() : 점 범위 그래프

```python
df <- data.frame(grp = c('A','B'), fit =  4:5, se =1:2)

ggplot(data = df,
       mapping = aes(x = grp,
                     y = fit,
                     ymin = fit-se,
                     ymax = fit+se)) +
  geom_pointrange()
```

![image](https://github.com/novicedata/scrap-comment/assets/88019539/8ee0b28d-bfc9-40b8-b798-9b4bb978da47)

### ➕ 모음표

| 명령어 | 모양  | 명령어 | 모양  |
| --- | --- | --- | --- |
| geom_crossbar() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/e05a838d-6a9e-41ba-8a95-4b0432f96517) | geom_errorbar() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/d0bfb00a-4ece-488c-910a-c0cfc2a1294b) |
| geom_linerange() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/a7386a8e-2f27-4c8f-900c-5d096cbe64cb) | geom_pointrange() | ![image](https://github.com/novicedata/scrap-comment/assets/88019539/8ee0b28d-bfc9-40b8-b798-9b4bb978da47) |

<br>

변수가 세개일 때도 있는데.. 나중에 다루게 되면 포스팅해볼까합니다.

**`이상 geom 명령어 모음이었습니다! ☠️`**

> https://sdsf.kr/?page_id=218&mod=document&uid=16[Cheatsheet/R/ggplot2 &#8211; 서울데이터과학연구회](https://sdsf.kr/?page_id=218&mod=document&uid=16)
