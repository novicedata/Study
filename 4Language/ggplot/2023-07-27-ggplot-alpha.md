---
excerpt: "ggplot2의 alpha 옵션을 알아보자"

categories:
  - ggplot2

tags:
  - [그래프 기본 시각화 설정]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-27
last_modified_at: 2023-07-27

title: "[ggplot2] alpha, 투명도 옵션"
---

<br>

이번엔 ggplot의 alpha 옵션입니다. 정말 별거 없어요..

<br>

# 📌 alpha
---

**`alpha`**는 **0~1** 사이 값으로 지정할 수 있고 0에 가까울수록 투명하고 1에 가까울수록 진하게 보여줍니다.

- **alpha = 0.8**
```r
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       fill = Tree)) +
  geom_area(alpha = 0.8)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/accd072d-c955-417f-be73-74aaabfe7b07){: .align-center}

- **alpha = 0.3**
```r
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       fill = Tree)) +
  geom_area(alpha = 0.3)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/af7fad22-fe15-4dc4-9522-17c4a0a26f6c){: .align-center}

## 언제 쓰면 좋을까?

흔히 쓰이는지는 모르겠지만.. **`그래프가 겹쳐있는 형태`**일 경우 당연히 쓰이면 좋겠죠? 예시로 보면

![image](https://github.com/novicedata/colab_practice/assets/88019539/7811e554-0e78-4995-a159-7e9551f3db57){: .align-center}

이와 같은 그래프가 있다고 합시다. 좀 보기가 그렇죠? 이때 alpha를 이용해줍시다.

![image](https://github.com/novicedata/colab_practice/assets/88019539/f5da9e0a-c9af-4097-9508-8460e73f3a01){: .align-center}

뭐... 색이 좀 그렇긴 하지만 보기는 좀더 괜찮습니다!

**`이상 ggplot alpha 였습니다! ☠️`**

---

- **다른 ggplot 옵션 보기** : [그래프 기본 시각화 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/tags/#그래프-기본-시각화-설정)
