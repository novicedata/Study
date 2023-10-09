## 📌 Classification tree

기본적인 tree에 대해서는 아래 포스팅을 확인해주세요. 아래 내용과 이어서 설명할 것입니다.

[CART 1. 회귀나무(Regression tree)\[재귀적 이진 분할 알고리즘\] — 데이터 노트 📝](https://datanovice.tistory.com/entry/CART-1-%ED%9A%8C%EA%B7%80%EB%82%98%EB%AC%B4Regression-tree%EC%9E%AC%EA%B7%80%EC%A0%81-%EC%9D%B4%EC%A7%84-%EB%B6%84%ED%95%A0-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98)

 [CART 1. 회귀나무(Regression tree)\[재귀적 이진 분할 알고리즘\]

📌 Regression Trees ML에 있어서 우리는 데이터를 사용하여 모델을 훈련시킵니다. 이 모델을 사용하여 새로운 데이터에 대한 예측을 하려하죠. 이때 예측하려는 데이터의 공간을 작은 부분들로 나

datanovice.tistory.com](https://datanovice.tistory.com/entry/CART-1-%ED%9A%8C%EA%B7%80%EB%82%98%EB%AC%B4Regression-tree%EC%9E%AC%EA%B7%80%EC%A0%81-%EC%9D%B4%EC%A7%84-%EB%B6%84%ED%95%A0-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98)

기본적으로 회귀와 다르게 $Y$가 Categorical일 때 쓰는 '분류'입니다.

위 포스팅의 regression tree와 비슷한 맥락입니다. 차이가 있다면 분류한 클래스 비율을 보는 것 입니다.

$Y =i$일 때 비율

$$  
\\hat{P}(Y=i|\\textbf{x}) = \\sum\_j \\dfrac{n\_{R\_j,i}}{n\_{R\_j}} I (\\textbf{x} \\in R\_j)  
$$

전체 공간에서 $i$의 비율을 봅니다.

### ◼️ 재귀적 이진 분할 알고리즘(recursive binary splits algorithm)

우선 회귀 트리의 경우 RSS를 이용하여 나누는 기준을 정하였습니다.

분류 트리의 경우 보통 아래 3가지 기준을 사용합니다.

#### ◾ Classification error rate(분류 오류율)

$$  
E = 1- \\max\_k (\\hat{p}\_{mk})  
$$

위 식과 같이 전체 1에서 $m$번째 영역에 속한 관측치 중 $k$번째 클래스의 비율을 빼주는 것입니다. 쉽게 트리의 맨 끝 노드 $m$에서 클래스 $k$에 속해 있는 관측치의 비율을 빼주는 겁니다.

경우에 따라 좋은 기준일 수 있지만, 식이 단순한 만큼 트리를 만드는데 그리 민감하지는 않습니다.

대신 아래 두 가지를 사용합니다.

#### ◾ Gini index(지니 계수)

$$  
G = \\sum\_{k=1}^K \\hat{p}\_{mk}(1- \\hat{p}\_{mk})  
$$

이처럼 지니계수는 0부터 1사이의 값을 가지며, 지니 계수가 낮을 수록 잘 분류되었다고 볼 수 있습니다.

[##_Image|kage@Fl533/btsxrXqoRkl/EPQsPSh8xYYCg1Q31cQqZ0/img.png|CDM|1.3|{"originWidth":942,"originHeight":400,"style":"alignCenter"}_##]

위 그림을 보시면 분류가 더 잘된 부분의 지니계수가 더 낮음을 볼 수 있습니다.

#### ◾ Cross-entropy(엔트로피)

$$  
D = - \\sum\_{k=1}^K \\hat{p}\_{mk} \\log(\\hat{p}\_{mk})  
$$

엔트로피는 데이터 집합의 동질적인 정도를 측정합니다. 지니계수와 같이 엔트로피가 낮을 수록 잘 분류되었다고 볼 수 있습니다.

## 📌 R로 구현해보기

구현을 위한 데이터는 Heart 데이터를 사용하겠습니다. 따라하실 분은 첨부파일을 다운로드 해주세요.

[##_File|kage@dBRdEe/btsxLjeFkIC/cyJLHUMkmReuJJNEkwsBi1/tfile.csv|filename="Heart.csv" size="0.02MB" data-ke-align="alignCenter"|_##]

데이터 불러오기

```
library(tree)
hdata = read.csv('Heart.csv', header=T, stringsAsFactors=T)
str(hdata)
```

[##_Image|kage@byogmy/btsxq2MfFu0/lDqKU6XorDYYDKKkrecyJ0/img.png|CDM|1.3|{"originWidth":538,"originHeight":304,"style":"alignCenter"}_##]

결측치 제거

```
sum(is.na(hdata))
hdata = na.omit(hdata)
```

필요없는 행 제거 및 train, test set 나누기

```
n = dim(hdata)[1]
hdata$X = NULL

set.seed(42)
train = sample(n, n/2)

htrain = hdata[train,]
htest = hdata[-train,]
```

분류 tree 모델 학습하기

```
htree = tree(AHD~., data=htrain)
htree
```

[##_Image|kage@7x5iF/btsxiez5oYi/BPAagTATGKZsdl23mqGW60/img.png|CDM|1.3|{"originWidth":601,"originHeight":499,"style":"alignCenter"}_##]

트리 그려보기

```
plot(htree)
text(htree)
```

[##_Image|kage@sNSDQ/btsxUbN6Xfu/pJy7bdCyuDgKThkN2clK91/img.png|CDM|1.3|{"originWidth":628,"originHeight":442,"style":"alignCenter"}_##]

혼동행렬 보기

```
library(caret)
confusionMatrix(hpred, htest$AHD)
```

[##_Image|kage@dTT1s1/btsxtmDgqp7/xtL7IkLPkeX6dlVVyh779k/img.png|CDM|1.3|{"originWidth":327,"originHeight":450,"style":"alignCenter"}_##]
