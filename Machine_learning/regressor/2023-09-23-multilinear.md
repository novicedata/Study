---

excerpt: "R과 python으로 다중 선형 회귀를 해보자."

categories:

- Machine learning

tags:

- [파이썬, R]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-09-23
last_modified_at: 2023-09-23

title: "[Machine learning] 다중 선형 회귀 예제 with R, Python"

---

<br>

이번엔 다중 선형 회귀를 R과 Python으로 구현하려고 합니다. 최근엔 이러한 모델들이 정말 단순한 모델이 되었죠.

간단한 다중 선형 회귀에 대한 설명은 아래를 참고해주세요.

- [다중 선형회귀 - 데이터 노트 📝](https://novicedata.github.io/statistical%20learning/%EB%8B%A4%EC%A4%91-%EC%84%A0%ED%98%95%ED%9A%8C%EA%B7%80/)
  

<br>

# ◾ With Python

---

## 데이터 불러오기

```python
# 라이브러리 불러오기
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets import load_diabetes

data = load_diabetes()
data.keys()
```

sklearn의 diabetes 데이터셋을 이용하겠습니다. 구조를 한번 봅시다.

## X,y 로 나누기

```python
X = pd.DataFrame(data['data'], columns=data['feature_names'])
y = pd.DataFrame(data['target'], columns=['target'])
X
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/1339954b-ff55-4ec3-ad8b-bbe6275ce08e){: .align-center}

## Train, Test set 8:2로 나누기

```python
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2, random_state=42)
```

## model fitting 하기

```python
from sklearn.linear_model import LinearRegression
model = LinearRegression()
model.fit(X_train, y_train)
```

## intercept, coef값 확인하기

```python
print(model.intercept_, model.coef_)
> [151.34560454] 
  [[37.90402135 -241.96436231  542.42875852  347.70384391 -931.48884588
   518.06227698  163.41998299  275.31790158  736.1988589    48.67065743]]
```

## 시각화 해보기

```python
# 검은선은 실제 y값, 빨간선은 model로 예측한 y값 입니다.
# 각각 앞에서 80개의 값만 확인하겠습니다.
fig = plt.figure(figsize=(20,4))
graph = fig.add_subplot(1,1,1)
graph.plot(y[:80], color='black', marker='o', label='real y values')
graph.plot(model.predict(X)[:80], marker='^', color='red', label='prediction')
plt.legend(loc='best')
plt.show()
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/5f4ceadc-4d1f-41e6-a60b-27a42f78aad2){: .align-center}

<br>

# ◾ with R

---

## 데이터 불러오기

```r
# import
library(MASS)
Boston
```

MASS 라이브러리의 Boston 데이터를 사용해보겠습니다.

## Train, Test set 8:2로 나누기

```r
# Train set, Test set으로 나누기(8:2)
library(caTools)
set.seed(42)
split = sample.split(Boston$medv, SplitRatio=0.8)
train = subset(Boston, split==T)
test = subset(Boston, split==F)
```

## model fitting 하기

```r
# Fitting 모델
model = lm(medv~., data=train)

summary(model)
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/d6d0498c-6cda-482f-96a4-3a034bfbacb6){: .align-center}

R은 이게 참 좋은 것 같습니다 **summary면 다 볼 수 있는..** 각 p-value와 estimate도 볼 수 있습니다.

## 시각화 해보기

```r
# 시각화
library(ggplot2)

ggplot() +
  geom_line(aes(x = (1:length(test$medv)), y = test$medv, color = 'Real'), size = 1) +
  geom_line(aes(x = (1:length(y_pred)), y = y_pred, color = 'Prediction'), size = 1) +
  scale_color_manual(values = c('Real' = 'black', 'Prediction' = 'red'),
                     labels = c('Prediction', 'Real')) +
  labs(color = 'Line') +
  theme_bw() +
  xlab('x') +
  ylab('medv') +
  theme(legend.position = c(0.1,0.9))
```

![image](https://github.com/novicedata/baekjoon/assets/88019539/4da797c4-271d-4d8d-9af1-82122f798f88){: .align-center}
