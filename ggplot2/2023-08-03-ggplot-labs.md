---
excerpt: "ggplot2 부제목, 태그를 설정해보자."

categories:
  - ggplot2

tags:
  - [그래프 기본 시각화 설정]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-03
last_modified_at: 2023-08-03

title: "[ggplot2] labs() : 제목, 부제목, 태그 등 설정"
---

<br>

저번 포스팅 때 이미 축의 이름 변경, legend 수정 등 포스팅을 했었습니다.([[ggplot2] x축, y축 범위, 이름, 간격 설정 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/ggplot2/ggplot-axis/))
굳이 이렇게 세세한 변경말고, 간단한 변경을 할 수 있는 코드를 찾아서 가져와 봤습니다 :)
우선 앞으로 쓸 그래프 입니다. **graph**로 할당해서 사용할 겁니다.

```r
graph = ggplot(Orange, aes(x = age,
                   y = circumference, fill = Tree)) +
  geom_area()
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/6bdafb7b-26fd-4733-bcc4-97af0ff8f2f3){: .align-center}

<br>

# 📌 labs()
---

**`labs()`**는 ggplot에서 제공하는 제목, 부제목, 레이블 변경 등 지원하는 함수입니다. 여러 옵션이 있는데 우선 많이 쓰이는 것 위주로 봅시다.

## ◾ 제목 및 x, y축 제목 : labs(title = , x = , y = )

제목 및 x축과 y축의 제목을 바꿔줍니다.

- **`labs(title = '제목', x = 'x축 제목', y = 'y축 제목'`**
  
```r
graph + labs(title = '오렌지 나무', x = '나무 나이',
             y = '나무 둘레')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/fab8135e-bd85-4e0a-ae75-f4b307e9924c){: .align-center}

**제목**을 오렌지나무로, **x축**을 나무 나이로, **y축**을 나무 둘레로 바꾸어 주었습니다.

<br>

## ◾ 부제목, 표제, 태그 : labs(subtitle = , caption = , tag = )

- **`labs(subtitle = '부제목')`** : 제목 마래에 부제목을 설정해줍니다.
- **`labs(caption = '표제')`** : 그래프 오른쪽 하단에 표제를 설정해줍니다.
- **`labs(tag = '태그')`** : 그래프 왼쪽 상단에 태그를 설정해줍니다.
  
```r
graph + labs(title = '오렌지 나무',
             subtitle = '나무별로 색 지정',
             caption = 'novicedata.github.io',
             tag = '_R')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/9e6e4b76-c30e-44c2-9d6f-c3c70cc7aaba){: .align-center}

**`이상 ggplot labs() 였습니다! ☠️`**

---

- **다른 ggplot 옵션 보기** : [그래프 기본 시각화 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/tags/#그래프-기본-시각화-설정)
