---
excerpt: "왜 validation set를 이용할까?"

categories :
  - Statistical learning

tags :
  - [통계 학습]

toc: true
toc_sticky: true

date: 2023-09-10
last_modified_at: 2023-09-10

title: "validation set와 MSE. validation set를 사용하는 이유"
---

<br>

보통 우리가 알기론 **train set, test set**로 나누어 모델을 학습, 평가합니다. 그런데 이를 제외하고 **`validation set`**를 추가하는 경우가 있습니다. 왜 일까요?

<br>

# MSE 그리고 validation set

---

우선 우리가 모델 학습의 성능을 보기위해 보는 **`MSE(Mean square error)`**에 대해 봅시다. 식과 같은 경우

$$
MES(\hat{f}) = \frac1n\sum^n_{i=1}(y_i - \hat{f}(\textbf{x}_i))^2
$$

이렇게 이루어 집니다. 즉, 예측을 잘 못할수록 값이 커지는 구조이죠.

자 여기서 우리가 training data와 이와 관련 없는 test data가 있다고 해봅시다.

- training data : ${(y_1,\textbf{x}_1),...,(y_n,\textbf{x}_n)}$
  
- testing data : $(y_0, \textbf{x}_0)$
  

이 때 각각 **training MSE, Test MSE**를 아래와 같이 봅시다.

$$
training \ MSE(\hat{f}) = \frac1n\sum^n_{i=1}(y_i - \hat{f}(\textbf{x}_i))^2 \\
test \ MSE(\hat{f}) = Ave(y_0-\hat{f}(\textbf{x}))^2
$$

다르게 썻지만 사실 같은 걸 알수있습니다!. 만약 모델이 **상대적으로 유연하다면 당연히 training MSE는 작은 값을 지닐 것 입니다.** 예측을 그만큼 잘한다는 뜻이니까요. 하지만 우리는 **`과적합`**에 대해서 볼 필요가 있습니다. training set에서 꾸준히 MSE가 좋게 나올수 밖에 없습니다. 모델을 위해 **어떠한 파라미터를 추가로 넣어준다면** 당연히 training set에 한해서 분산을 더욱 많이 설명할 것이고, 이는 MSE의 감소로 나타납니다.

**하지만 test MSE의 경우 그렇지 못합니다.** 일정 수준이 넘어가면 training set에 과적합 되어버려서 test data의 분산은 설명하기 어려워 지는 것이죠. 그러니까 결국 우리는 **`train MSE가 가장 작은 값을 찾는 모델을 볼 것이 아니라 test MSE를 가장 작게 만드는 모델을 보아야 합니다.`**

이를 위해서 **`validation set`**를 이용하는 겁니다. train set로 모델을 학습시키고, **validation set를 이용하여 성능을 평가하며하이퍼 파라미터를 조정합니다.** test set로 최종 모델의 성능을 평가합니다.

![image](https://github.com/novicedata/scrap-comment/assets/88019539/bc680e51-a531-4407-941d-a8f5c6138ea3){: .align-center}{: width="50%", height="50%"}
*{사진 출처 : https://kashikayadav.medium.com/how-to-predict-which-statistical-method-is-best-for-a-model-f5069cd08ad9}*

그래프를 한번 보겠습니다. **회색선이 training MSE, 빨간선이 validation MSE입니다.** Flexibility가 증가함에 따라 training MSE는 계속해서 낮아지지만, validation MSE의 경우 대략 5~에서 다시 올라가는 것을 볼 수 있습니다. 이를 통해 우리는 Flexibility가 대략 5일 때의 모델 하이퍼 파라미터를 사용한다고 결정하는 겁니다.
