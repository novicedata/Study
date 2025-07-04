---
excerpt: "ggplot2의 축 설정을 알아보자"

categories:
  - ggplot2

tags:
  - [그래프 기본 시각화 설정]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-01
last_modified_at: 2023-08-01

title: "[ggplot2] x축, y축 범위, 이름, 간격 설정"
---
<br>
오늘은 ggplot2의 **`축 설정`**에 대해 알아보려고 합니다.
<br>
앞으로 사용할 그래프 코드입니다. 해당 그래프를 graph라고 지정한뒤 사용할게요.

```r
graph = ggplot(data = mpg, aes(x = cty,
                       y = hwy)) +
  geom_point()
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/13947c6c-29e8-47d8-8942-fb048cc7129d){: .align-center}
<br>

# 📌 x축, y축 설정 표 정리
---

대부분의 x축과 y축의 설정은 **`scale_x or y_continuous()`**로 정의할 수 있습니다. 주요 문법을 표로 정리한 후, 그림과 함께 봅시다.


중요한점 !! **scale_x_continuous()**는 말 그대로 변수가 연속변수 일때 가능합니다. 아래에 있는 모든 코드들을 이산변수에 적용하고 싶다면 **scale_x or y_discrete()**로 바꾸어 적용해주시면 됩니다!
{: .notice--warning} 

| argument | 기능  |
| --- | --- |
| limits = c(n1,n2) | 축의 표시 범위를 n1~n2까지 지정 |
| 'name' | 각 축의 이름 설정 |
| breaks = c(n1, n2, n3...) | n1, n2, n3..로 눈금에 숫자로 표시 |
| labels = c('str1', 'str2', 'str3'...) | str1, str2, str3...로 눈금에 이름으로 표시 |
| position = '위치' | 해당 위치에 축 표기(x 축  : top or bottom, y축 : lefr of right) |

추가로 scale이 아닌 **`theme`** 문법을 이용하여 x축과 y축의 글자 크기 등 테마를 변경할 수도 있습니다.

<br>

## 1️⃣ x,y 축 범위 설정

x축과 y축의 범위를 설정해줍니다.

- **`scale_x_continous(limits = c(최소, 최대))`** : x축의 범위 지정
- **`scale_y_continous(limits = c(최소, 최대))`** : y축의 범위 지정

```r
graph + 
  scale_x_continuous(limits = c(0,50)) +
  scale_y_continuous(limits = c(-10, 60))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/e8d223bf-e5f8-44a3-99c3-a06ac600f01d){: .align-center}

<br>

## 2️⃣ x,y 축 이름 변경

x축과 y축의 이름을 변경해줍니다.

- **`scale_x_continuous('x축 이름')`** : x축 이름 변경
- **`scale_y_continuous('y축 이름')`** : y축 이름 변경
  
```r
graph + 
  scale_x_continuous('테스트 : x 축') +
  scale_y_continuous('테스트 : y 축')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/68235829-1197-4563-bbe3-fdd0815b4996){: .align-center}

<br>

## 3️⃣ x,y 축 눈금 표시 : 숫자

x축과 y축의 눈금을 숫자로 표시해줍니다.

- **`scale_x_continuous(breaks = c(숫자1, 숫자2, 숫자3, ...))`** : x축 눈금 표시(숫자)
- **`scale_y_continuous(breaks = c(숫자1, 숫자2, 숫자3, ...))`** : y축 눈금 표시(숫자)
  
```r
graph + 
  scale_x_continuous(breaks = c(10, 20, 30)) +
  scale_y_continuous(breaks = c(30))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/ff50fc15-8ad4-4f1e-b408-b050b6b80c30){: .align-center}

<br>

## 4️⃣ x,y 축 눈금 표시 : 문자

x축과 y축의 눈금을 문자로 표시해줍니다. **`단! 단독으로 사용 불가합니다. 꼭 숫자를 표시해 주는 breaks와 맞춰서 눈금을 지정해줘야합니다.`**

- **`scale_x_continuous(labels = c('문자1', '문자2', '문지3', ...))`** : x축 눈금 표시(문자)
- **`scale_y_continuous(labels = c('문자1', '문자2', '문지3', ...))`** : y축 눈금 표시(문자)
  
```r
graph + 
  scale_x_continuous(breaks = c(10, 20, 30),
                     labels = c('십', '이십', '삼십')) +
  scale_y_continuous(breaks = c(30),
                     labels = c('삼십'))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/12f2e32c-29ad-4853-a993-dd3d1f085494){: .align-center}

<br>

## 5️⃣ x, y 축 위치 변경

x축과 y축의 위치를 변경해줍니다. default값으로 x축은 bottom, y축은 left입니다.

- **`scale_x_continuous(position = 'top or bottom')`** : x축의 위치를 위 혹은 아래로 변경
- **`scale_y_continuous(position = 'right or left')`** : y축의 위치를 오른쪽 혹은 왼쪽으로 변경
  
```r
graph + 
  scale_x_continuous(position = 'top') +
  scale_y_continuous(position = 'right')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/0daefcbc-04c9-45a5-b85b-74e3a00166f6){: .align-center}

<br>

## 6️⃣ x, y 축 글자 크기, 색상, 모양 변경

x축과 y축의 글자 크기 혹은 색상 변경을 위해서는 scale이 아닌 theme을 건드려야합니다. 당연하게도 scale = 크기, theme = 테마 느낌이기 때문에..

- **`theme(axis.text.x = element_text(size = 크기, color = 색상, face = 모양))`** : x축 **눈금**의 글자 크기, 색상, 굵기를 변경합니다.
- **`theme(axis.text.y = element_text(size = 크기, color = 색상, face = 모양))`** : y축 **눈금**의 글자 크기, 색상, 굵기를 변경합니다.
  
추가로 face에는 **plain(기본), italic(기울임), bold(굵게), bold.italic(굵은 기울임)** 등이 있습니다.

```r
graph + 
  theme(axis.text.x = element_text(size = 20,
                                   color = 'red',
                                   face = 'bold'))+
  theme(axis.text.y = element_text(size = 10,
                                   color = 'blue',
                                   face = 'italic'))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/9b8984e7-1101-4277-af7b-4175f4dd4139){: .align-center}

- **`theme(axis.title.x = element_text(size = 크기, color = 색상, face = 모양))`** : x축 **제목**의 글자 크기, 색상, 굵기를 변경합니다.
- **`theme(axis.text.y = element_text(size = 크기, color = 색상, face = 모양))`** : y축 **제목**의 글자 크기, 색상, 굵기를 변경합니다.
  
```r
graph + 
  theme(axis.title.x = element_text(size = 20,
                                   color = 'green',
                                   face = 'plain'))+
  theme(axis.title.y = element_text(size = 20,
                                   color = 'purple',
                                   face = 'bold.italic'))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/7cafd840-d077-4923-98b0-dfb2146a31a3){: .align-center}

**`이상 ggplot 축 설정이었습니다! ☠️`**

---

- **다른 ggplot 옵션 보기** : [그래프 기본 시각화 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/tags/#그래프-기본-시각화-설정)
