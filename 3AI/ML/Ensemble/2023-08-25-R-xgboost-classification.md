---
excerpt: "R로 XGboost를 해보자."

categories:
  - Machine learning

tags:
  - [Boost, R]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-25
last_modified_at: 2023-08-25

title: "[Machine learning, R] R로 하는 XGboost"
---

<br>

R로 XGboost를 해볼 겁니다. 찾아보니까 python으로 돌리는 분들은 많은데 R에 대한 정보는 많지 않더라구요. 그래서 한번 연습 겸 올려봅니다.

<br>

# ◾ 데이터 준비

```r
data = read.csv('C:/Users/jin/Desktop/data/archive/mushrooms.csv')
str(data)
```

저는 Kaggle의 **`mushrooms`**데이터를 이용했습니다. 많이들 쓰시더라구요. 데이터를 불러와 데이터를 **str()**로 대충 살펴봅시다.

![image](https://github.com/novicedata/colab_practice/assets/88019539/3957d00d-6ca2-4327-a8e8-14d63785fa34){: .align-center}

class의 p는 독성 버섯, e는 먹을 수 있는 버섯입니다. 이를 분류 해줄거에요.

<br>
# ◾ label을 0과 1로 변경

분류할 label인 p와 e를 1과 0으로 변경해줄겁니다.

```r
# label을 0과 1로 변경. 독 : 1, 독x : 0
data[data$class == 'p', 'class'] = 1
data[data$class == 'e', 'class'] = 0
```
<br>
# ◾ train, test set로 나누기.

train set와 test set로 나눕시다. 저는 8:2 비율로 나누었습니다.

```r
# train, test셋 나누기
library(caret)
set.seed(0)
part = createDataPartition(data1$class, p = .8, list = F)
train = data[part, ]
test = data[-part, ]

summary(train) # 트레인셋 e : 3367, p : 3133
summary(test) # 테스트셋 e : 841, p : 783
```

<br>
# ◾ DMatrix로 바꾸어주기

우리가 편하게 xgboost를 하기 위해 지원하는 데이터 형식으로 바꾸어 줍시다. DMatrix를 train과 test로 나누어 주어야 합니다. 이 때 **`data = 입력 변수, label = 예측할 변수`**로 넣어 주는 겁니다.

```r
# xgboost 함수 형식에 맞게 데이터 세트 변경
train_x = data.matrix(train[, -1])
train_y = data.matrix(train[, 1])

test_x = data.matrix(test[, -1])
test_y = data.matrix(test[, 1])

library(xgboost)
xg_train = xgb.DMatrix(data = train_x, label = train_y)
xg_test = xgb.DMatrix(data = test_x, label = test_y)
```
<br>
# ◾ 모델 적합

xgboost의 파라미터를 정하고 모델 적합을 해줍니다.

```r
# 워치리스트 생성
watchlist = list(train = xg_train, test = xg_test)

params = list(max_depth = 4,
            eta = 0.01,
            objective = 'binary:logistic',
            verdose = 0)
model = xgb.train(params = params, data = xg_train, 
                  watchlist = watchlist,
                  nrounds = 300)
```

좋은 파라미터를 찾는 알고리즘도 있지만 후에 적용할 것이고
![image](https://github.com/novicedata/colab_practice/assets/88019539/1e87c5bd-c0d5-4dbc-93c8-615b13dc3448){: .align-center}
시행하면 이렇게 로그로스가 보입니다. 좋은 로스를 찾을 때까지 파라미터를 한번 조정해보세요(일일이 하는 것을 추천드리지는 않습니다만 우선 코드가 이런식이다 보여주는거니까요.) 주의할 점은 **`logloss가 낮아졌다가 올라간다면 과적합의 문제가 있을 겁니다.`**

## ➕ 파라미터

사실 모델에 있어서 데이터를 확인하는 것도 굉장히 중요합니다.(본문에서는 다루지 않았지만요.) 또한, 중요한게 파라미터 입니다. 제가 보여드린 모델의 파라미터는 적은 편입니다. 파라미터가 무엇이 있고, 어떻게 활용해야하는지는 링크를 확인해주세요.
 [XGBoost Parameters &mdash; xgboost 1.7.6 documentation](https://xgboost.readthedocs.io/en/stable/parameter.html)
 
<br>
# ◾ 성능확인

```r
# 성능 확인
test_pred = predict(model, xg_test)
test_pred = ifelse(test_pred >= 0.5, 1, 0)
confusionMatrix(as.factor(test_pred), as.factor(test_y))
```

만든 모델을 test set에 적용하여 성능을 확인해봅시다. **`confusionMatrix()`**를 이용해줄거에요.

![image](https://github.com/novicedata/colab_practice/assets/88019539/53d83804-f403-45d5-b666-016ad97b0463){: .align-center}

보시면 **정확도는 0.992, 민감도는 1.00, 정밀도는 0.983**이 나오네요. 근데 민감도와 정밀도 값이 바뀐건지.. 제가 아는 개념과 달라서 헷갈리네요..? 근데 여기서 정확도를 떠나 본질적 문제가 있습니다. 독버섯이 아닌것은 100% 분류해내는데, **`독버섯인 것을 13개 맞추지 못하였습니다.`** 생명과 직결되는 것이니 조금 치명적일수도..!

<br>
# ◾ 요인 중요도 확인

```r
# 요인 중요도 확인
xgb.importance(colnames(xg_train), model = model) %>%
  xgb.plot.importance(top_n = 10)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/60e30fe5-5283-4dbe-bf77-e41147d8447f){: .align-center}
train set을 통해 학슬 할 때 어떠한 요인이 중요했는지 알아보는 코드입니다. 중요한 점은 모델을 만드는데 영향을 준 순위정도이지 **`영향 요인으로서의 영향으로 보아선 안됩니다.`**

이렇게 코드를 보았는데요. 이것은 단순히 이런식으로 흘러간다 정도로 보아주면 될것같습니다. 실제 분석은 데이터 전처리 부터, 데이터 간 상관 등 관계 확인, 파라미터 선택 까지 많은 부가적인 힘이 들어갑니다.
