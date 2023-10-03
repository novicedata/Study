---
excerpt: "Grid search, Random search에 대해 알아보자."

categories:
  - Machine learning

tags:
  - [파이썬, 최적화]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-28
last_modified_at: 2023-08-28

title: "[Machine learning, Python] 그리드 서치(Grid search), 랜덤 서치(Random search)에 대해서, 파이썬 코드"
---
<br>

# 📌 Grid search vs Random Search
---

- **그리드 서치(Grid search)**
  
  하이퍼 파라미터를 여러 값을 지정해주어 각 값의 조합들을 **`모두`** 확인하여 값을 비교하는 방식으로 작동합니다.
  
  **`단점`**이 확실합니다. 우선 **가장 최적의 파라미터를 찾는다는 보장이 없습니다.** 결국 모델을 구성할 때 여러 파라미터를 넣어주는 것은 모델을 만드는 사람이기 때문에 실제로 가장 최적의 파라미터를 넣어 주지 못한다면 당연히 어느 조합으로도 가장 최적의 조합을 찾아주지 못합니다. 그저 보인이 넣은 파라미터들의 조합을 이용해서 최적의 조합을 찾아주는 것이죠.
  또한, **쓸데 없는 파라미터 조합을 모두 확인합니다.** 결국 모든 조합을 계산하기 때문에 최적의 값에서 먼 거리에 있는 조합도 확인해야합니다. 이는 **`자원 소모가 심하다`** 라는 단점과 직결됩니다. 시간이 정말~~~~ 오래 걸립니다.
  
  해보신 분들은 알겠지만, 조합을 조금만 늘려도 시간이 코드를 돌리는데 시간이 너무 오래걸립니다.
  
- **랜덤 서치(Random search)**
  
  주어진 하이퍼 파라미터 범위 안에서 **랜덤으로** 뽑아서 값을 비교합니다. 그리드 서치와는 다르게 구간과 시도 횟수를 지정해주면, 랜덤으로 진행해줍니다.
  
  **`장점`**이라 하면, 우선 그리드 서치보다 당연히 **빠릅니다.** 지정해준 파라미터 조합을 모두 사용하는게 아니기 때문에 빠르고 효율적입니다. **`단점`**이라 하면 그리드 서치와 비슷하게 랜덤이라도 결국 최적의 파라미터를 못찾을 가능성이 존재한다는 점 정도겠네요.
  
<br>

## ◾ 그리드 서치 in Python (Gride search code)

데이터는 iris, 모델을 xgboost를 이용했습니다.

```python
from sklearn.datasets import load_iris
from sklearn.model_selection import GridSearchCV, train_test_split
from sklearn.metrics import accuracy_score
import xgboost as xg

# 데이터 불러오기
iris = load_iris()
X = iris.data
y = iris.target

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
xg_train = xg.DMatrix(data=X_train, label=y_train)
xg_test = xg.DMatrix(data=X_test, label=y_test)

# xgboost 모델 설정
model = xg.XGBClassifier(objective='multi:softmax', num_class=3)
```

xgboost를 위해 DMatrix에 맞추어 데이터를 구성하고 다중 분류이기 때문에 **`multi:softmax`**를 지정해줍시다.(근데 하고 나서 보니까 알아서 지정되어 주는거 같아요. 처음에 오타났는데 실행됐음.. 결과도 같고)

**그다음 그리드 서치를 위해 XGboost의 파라미터 값들을 지정해줍니다.**

```python
# 그리드 서치 파라미터 정하기
param_grid={'n_estimators':[100, 200], # 나무 개수,
            'learning_rate':[0.01, 0.1], # 학습률
            'max_depth':[2,4], # 나무 깊이
            'gamma':[0,1], # 가지를 칠지 결정하는 최소손실감속 조정 값. 클수록 과적합 감소
}
```

그럼 그리드 서치는 2x2x2x2 총 16개의 조합을 사용해주는 겁니다. **`이는 예시일 뿐 실제로 우리가 모델을 연구할 때는 더많은 조합이 사용되어서 시간이 엄청 걸립니다.`**

다음 그리드 서치 파라미터를 설정해줍니다. cv=3으로 cross validation을 3으로 지정해준겁니다.

```python
# 그리드 서치 파라미터 설정
gcv=GridSearchCV(model, param_grid=param_grid, cv=3)
```

```python
# 모델 피팅 및 결과
gcv.fit(X_train,y_train)
result = gcv.best_params_
score = gcv.best_score_
print(result, score) 

>> {'gamma': 0, 'learning_rate': 0.01, 'max_depth': 2, 
    'n_estimators': 100} 0.9333333333333332
```

이렇게 결과를 보여줍니다. 조합결과 **감마 : 0, 학습률 : 0.01, 나무 깊이 : 2, 나무 개수 100**일 때 **0.933**의 성능을 보여줍니다.

그럼 test set를 이용해 정확도를 확인해볼게요.

```python
# 최적 파라미터 학습 모델
best_model = gcv.best_estimator_

# 분류 성능 확인
y_pred = best_model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(accuracy) 

>> 0.933333333333
```

<br>

## ◾ 랜덤 서치 in Python (Random seach code)

딱히 크게 달라지는 건 없습니다. **`랜덤 서치를 위한 xgboost의 파라미터 설정과 랜덤 서치 파라미터 설정만 바꿔줍시다.`**

```python
from sklearn.model_selection import RandomizedSearchCV

# 랜덤 서치 파라미터 정하기
param_dis={'n_estimators': np.arange(50,200), # 나무 개수,
            'learning_rate':[0.01, 0.5], # 학습률
            'max_depth':[2,4,6], # 나무 깊이
            'gamma':[0,1], # 가지를 칠지 결정하는 최소손실감속 조정 값. 클수록 과적합 감소
}

# 랜덤 서치 파라미터 설정
rcv=RandomizedSearchCV(model, param_distributions=param_dis,
                       n_iter=50, cv=3)
```

결과를 보면

```python
# 모델 피팅 및 결과
rcv.fit(X_train,y_train)
result = rcv.best_params_
score = rcv.best_score_
print(result, score) 

>> {'n_estimators': 192, 'max_depth': 2,
     'learning_rate': 0.5, 'gamma': 0} 0.9500000000000001
```

이번엔 **나무 개수: 192, 깊이 :2, 학습률 : 0.5, 감마:0** 일 때 성능이 **0.95**가 나오네요. **`grid search보다 살짝 높습니다.`**

```python
# 최적 파라미터 학습 모델
best_model = rcv.best_estimator_

# 분류 성능 확인
y_pred = best_model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(accuracy) 

>> 0.9666666666666667
```

test set를 이용한 정확도 결과 0.966정도가 나옵니다. 결과적으로 grid search 보다 높게나오네요!!

물론 데이터의 구조, 파라미터를 어떻게 넣어주느냐 등에 따라 변할 수는 있지만 grid search의 끔찍한 시간을 생각하면... random search를 쓰는게 아직은 효율적인 것 같습니다..

**`혹시나 틀린 부분에 대해서는 댓글로 남겨주세요!`**
