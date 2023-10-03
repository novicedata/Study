---
excerpt: "ggplot2의 legend을 알아보자"

categories:
  - ggplot2

tags:
  - [그래프 기본 시각화 설정]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-31
last_modified_at: 2023-07-31

title: "[ggplot2] legend, 범례 설정"
---
<br>
오늘은 ggplot2의 **`legend`**에 대해서 알아보려고 합니다.
<br>
- **예제 그래프**

앞으로 사용할 그래프의 코드입니다. 해당 그래프를 **graph**라고 지정한뒤 사용해줄겁니다.

```r
graph = ggplot(data = Orange, aes(x = age,
                          y = circumference,
                          fill = Tree)) +
  geom_area(alpha = 0.8)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/b75ab6c3-f3bf-4885-a2cd-a344fd4d054e){: .align-center}

# 1️⃣ legend 위치 옮기기 : + theme(legend.position = )
---

기본적으로 위치를 옮기기 위한 코드는 **`+ theme(legend.position = '위치')`**입니다. 추가로 '위치'에 들어갈 것은 **top, bottom, left, right이며 이들을 조합하여 사용할 수도 있습니다.**

```r
# 순서대로 위, 아래, 오른쪽, 왼쪽

graph + theme(legend.position = 'top')
graph + theme(legend.position = 'bottom')
graph + theme(legend.position = 'right')
graph + theme(legend.position = 'left')
```

| top, right | bottom, left |
| --- | --- |
| ![image](https://github.com/novicedata/colab_practice/assets/88019539/e64d2b5c-f069-4010-9f85-e6f990e93c52) | ![image](https://github.com/novicedata/colab_practice/assets/88019539/92b7585e-2c68-47f0-86e1-fa94e23f4b3b) |
| ![image](https://github.com/novicedata/colab_practice/assets/88019539/e86d09ae-5cc3-4dbe-8fe6-b61ee8d85243) | ![image](https://github.com/novicedata/colab_practice/assets/88019539/8ec8f131-2b28-4438-8229-ec74f0f6ca54) |

## ◼️ 좌표로 설정하기

x축과 y축 각각 맨 왼쪽과 아래를 0, 맨 오른쪽과 위를 1이라고 설정하여 정해주는 방법입니다. **만약 왼쪽 위에 넣어주고 싶다하면 왼쪽인 0과 가깝게, 위쪽인 1과 가깝게 설정해주면됩니다.** 대략 0.1, 0.7로 설정해볼게요.

```r
graph + theme(legend.position = c(0.1, 0.7))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/f7dac312-3f64-4834-9c13-af7693226b4e){: .align-center}

<br>

# 2️⃣ 항목 순서 변경 : + scale_fill_discrete(breaks = )
---

위 그래프를 보았을 때 나무가 3번, 1번, 5번, 2번, 4번 순서로 되어있습니다. 그래프를 보았을 때 해당 순서가 높은 값 순으로 나열되어 있기 때문에 보기 편하지만 우리는 1~5까지 정렬해보겠습니다.

**`+ scale_fill_discrete(breaks = 원하는 순서)`**를 이용해주면 됩니다.

```r
graph + scale_fill_discrete(breaks = c(5,4,3,2,1))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/e78f4175-bc63-48e9-9acf-e50f6843a52e){: .align-center}

색이 좀.. 이상해지긴 했지만 순서대로 정렬된 것을 볼 수 있습니다.

<br>

# 3️⃣ legend 제목, 요소 이름 바꾸기 : + scale_fill_discrete(name =, labels =)
---

legend의 제목을 Tree가 아닌 **나무**로, 번호가 아닌 **x번 나무**로 바꾸어 주겠습니다.

**`+ scale_fill_discrete(name = 제목, labels = 요소 이름)`**을 이용해주면 됩니다.

```r
graph + scale_fill_discrete(name = '나무',
                            breaks = c(5,4,3,2,1),
                            labels = c('5번 나무','4번 나무',
                                       '3번 나무','2번 나무','1번 나무'))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/5253c801-b471-4fa0-937f-d761e9a27697){: .align-center}

<br>

# 4️⃣ legend 방향 설정(가로, 세로) : + theme(legend.direction = )
---

위에서 만든 그래프의 legend를 아래로 옮긴후, 세로는 너무 기니까 가로로 만들어 보겠습니다.

**`+ theme(legend.direction = horizontal(가로) or vertical(세로))`**를 이용해주면 됩니다.

```r
graph + scale_fill_discrete(name = '나무',
                            breaks = c(5,4,3,2,1),
                            labels = c('5번 나무','4번 나무',
                                       '3번 나무','2번 나무','1번 나무')) +
  theme(legend.position = 'bottom',
        legend.direction = 'horizontal')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/f15ec964-333e-4e6f-be0c-30351981a7f6){: .align-center}

<br>

# 5️⃣ legend 배경 설정: theme(legend.background = element_rect())
---

legend의 배경 설정입니다.

**`+ theme(legend.background = element_rect())`**를 사용해주면 됩니다. 해당 코드에는
- **fill = 배경색**
- **color = 각 변의 색**
- **size = 각 변의 두께**
- **linetype = 각 변의 모양**
을 적용할 수 있습니다.

```r
graph + theme(legend.background = element_rect(fill = 'red',
                                               color = 'black',
                                               size = 2,
                                               linetype = 'dotted'))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/acf69678-7783-4cf7-b99d-a97b5980052b){: .align-center}

<br>

# 6️⃣ legend 제목 설정(크기, 색 등) : + theme(legend.title = element_text())
---

legend 제목의 크기나 색을 설정할 수 있습니다.

**`+ theme(legend.title = element_text())`**해당 코드에는
- **face = 글씨체**
- **color = 색**
- **size = 글자 크기**
등을 적용할 수 있습니다.

```r
graph + theme(legend.title = element_text(face = 4,
                                          color = 'blue',
                                          size = 15))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/4ff7d9a8-1734-47f4-b151-1825041f23f6){: .align-center}

<br>

# 7️⃣ legend 요소 설정(크기, 색 등) : + theme(legend.text = element_text())
---

위 title의 변경과 같은 맥락입니다.

**`+ theme(legend.text = element_text())`**로 위 코드에서 title을 text로 바꿔준 것 뿐입니다.

```r
graph + theme(legend.text = element_text(face = 3,
                                          color = 'red',
                                          size = 10))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/c2b3f635-ef5a-42a5-bdd9-c9febd9329fc){: .align-center}

외에도 여러 legend 관련 코드가 있습니다만 우선 필요하고 많이 쓸 것 같은 코드들만 가져왔습니다.

> 참조
> 
> [Legends (ggplot2)](http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/)

**`이상 ggplot legend 였습니다! ☠️`**

---

- **다른 ggplot 옵션 보기** : [그래프 기본 시각화 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/tags/#그래프-기본-시각화-설정)
