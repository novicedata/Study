---

excerpt: "R과 python으로 단순 선형 회귀를 해보자."

categories:

- Machine learning

tags:

- [파이썬, R]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-09-18
last_modified_at: 2023-09-18

title: "[Machine learning] 단순 선형 회귀 with R, Python"

---

<br>

단순 선형회귀를 R과 python으로 구현해봅시다. 사실 단순 선형회귀는 Machine learning으로 보기도 어렵지만.. 제일 처음 기초인 부분이니까요. 한번 봅시다.

<br>

# 📌 단순 선형 회귀 간단 설명

---

**종속변수 y와 독립변수 x에 대해 선형 상관관계를 이용한 모델링 방법 입니다.**

$$
Y = b_1X + b_0
$$

문제는 여기서 $b_1, b_0$을 어떻게 구하느냐겠죠. 이를 위해 우리는 **`least squares method`**를 이용합니다.

**최소제곱법으로 실제 $y$값과 예측한 $\hat{y}$값 간의 차이가 최소가 되도록 $b_1, b_0$을 추정하는 겁니다.** 아래와 같은 식이 최소가 될 경우를 찾는 것입니다.

$$
E(b_1, b_0) = \sum_{i=1}^n(y_i-(b_1 x_i+b_0))^2
$$

실제 값과 추정한 값의 거리의 제곱을 최소화하는 것이죠.

> 본 포스팅은 R, Python으로 구현하는 것이 목적입니다. 좀 더 자세한 모델에 대한 설명은 다루지 않습니다.

<br>

## `◾ With Python`

```python
# 라이브러리 불러오기
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# data 만들기. 임의로 제가 만든 것입니다.
x = 2*np.random.randn(30,1)
y = 3*x + np.random.randint(10, 50, size = x.shape)
plt.scatter(x,y)
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/4fc5a7a0-8f18-455f-a936-da2ea71eae11){: .align-center}

- **Train, Test set으로 나누기**
  

```python
# Train : test = 8:2 로 나누기 
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(x,y, test_size=0.2, random_state=42)
```

- **모델 학습시키기**
  

```python
from sklearn.linear_model import LinearRegression
model = LinearRegression()
model.fit(X_train,y_train)
```

- **Test set 결과 예측하기**
  

```python
y_pred = model.predict(X_test)
```

- **결과 시각화(Train set)**
  

```python
plt.scatter(X_train, y_train, color='red')

# 회귀선의 경우 y값에 모델로 train set를 예측한 값을 넣어준다.
plt.plot(X_train, model.predict(X_train), color='blue')

plt.title('Train')
plt.xlabel('x값')
plt.ylabel('y값')
plt.show()
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/c19936aa-575c-4d6f-942d-ddbf37871950){: .align-center}

- **결과 시각화(Test)**
  

```python
plt.scatter(X_test, y_test, color='red')
plt.plot(X_train, model.predict(X_train), color='blue')

plt.title('Test')
plt.xlabel('x')
plt.ylabel('y')
plt.show()
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/4fce9555-7fe0-4ac9-b642-7a27b8624fd4){: .align-center}

<br>

## `◾ With R`

```r
# 데이터 임의로 만들기
x = rnorm(30)
y = 3*x + sample(10:50, 30, replace=T)
data =data.frame(x,y)

plot(x,y)
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/1b92dcaa-6c97-45b8-99dd-817f14260f14){: .align-center}

- **Train, Test set으로 나누기**
  

```r
library(caTools)
set.seed(42)
split = sample.split(data$y, SplitRatio = 0.8)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)
```

잠시 설명해보자면. **`caTools의 sample.split`**으로 y값을 넣어주고, 비율을 설정해주면 TRUE값과 FALSE값을 통해 분할한 데이터를 알려줍니다. TRUE값의 경우 train set, FALSE값의 경우 test set으로 할당해줄 수 있습니다.

- **모델 학습시키기**
  

```r
# Fitting
model = lm(y~x, data=train)
summary(model)
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/982c6d8e-21e4-4462-9dae-dfdd4f32b54a){: .align-center}

x의 palue를 보니 망한 데이터네요.

- **Test set 결과 예측하기**
  

```r
# predicting the test set results
y_pred = predict(model, newdata=test)
y_pred
>>
       2       13       16       17       23       24 
29.98741 30.57082 29.69560 29.59722 30.21095 30.82765
```

각각 y에 대해 model이 예측한 값들입니다.

- **결과 시각화(Train set)**
  

```r
# visualising the train set results
# line그릴때 y값에 predict를 넣는게 중요
library(ggplot2)
ggplot() +
  geom_point(aes(train$x, train$y),
             colour = 'red') +
  geom_line(aes(train$x, predict(model, newdata=train)),
            colour = 'blue') +
  ggtitle('Train') +
  xlab('x') +
  ylab('y') +
  theme_bw()
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/cd4d018e-bbd7-411c-94ec-ff69c8f79ebc){: .align-center}

- **결과 시각화(Test set)**
  

```r
ggplot() +
  geom_point(aes(test$x, test$y),
             colour = 'red') +
  geom_line(aes(train$x, predict(model, newdata=train)),
            colour = 'blue') +
  ggtitle('Train') +
  xlab('x') +
  ylab('y') +
  theme_bw()
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/93210dae-9fdc-4207-89ad-cdca37c96b3f)

<br>

저는 noise를 주어 random한 변수를 만들어 했기 때문에 회귀선이 잘 나오지 않았습니다. 어찌보면 이게 단순 선형회귀의 문제가 아닐까 싶습니다. 너무나 단순한 모델이기 때문에 사실 상관계수만 보아도 알수 있는 데이터의 내용을 그저 선으로 표시해준거에 지나지 않는 것 같아요.
