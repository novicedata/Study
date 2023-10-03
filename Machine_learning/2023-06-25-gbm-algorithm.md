---
excerpt: "Gradient Boosting의 알고리즘에 대해 알아보자."

categories:
  - Machine learning

tags:
  - [Boost]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-06-26
last_modified_at: 2023-06-26

title: "[Machine learning, 머신러닝] GBM(Gradient Boosting Model) 알고리즘 분석"
---
<br>

저번 포스팅에 이어 **`GBM`**의 좀더 자세한 내용을 설명하려고 한다.

Gradient Boosting의 기본 motivation과 알고리즘의 유도법? 등을 공부해서 정리!

<br>

# ❓ 왜 Gradient 인가?

---

![image](https://github.com/novicedata/scrap-comment/assets/88019539/eecfd086-ced7-4830-925c-3e02750b1dad)

위와 같은 점들과 선형식 그리고 잔차가 있다고 합시다. GBM의 기본적인 motivation은 잔차를 y로 둘 수 있다면..? 입니다.

**즉 $y-f_1(x)$인 residual을 두 번째 모델인 $f_2(x)$로 추정할 수 있다면?**

이는 곧 **$y-f_1(x) = f_2(x)$**가 가능하다면?이 되겠고 또한 y에 대해서 표현할 수 있습니다. **$y=f_1(x)+f_2(x)$**

모델을 학습할 때 마다 맞추지 못한 잔차 부분을 y값으로 둔다!

그래서 이게 왜 gradient와 관계가 있는가? 제일 기본적인 **loss function(손실함수)인 최소자승법(Ordinary least square)로 생각**해봅시다. 해당 손실함수를 최소화하는 값을 찾아야 합니다.
$$
\min L = \frac12 \sum_{i=1}^n(y_i-f(x_i))^2
$$

이를 $f(x_i)$에 대해 미분하면 $\frac{\partial L}{\partial f(x_i)} = f(x_i) - y_i$ 이되고 양 변에 음수를 취한다면..?
$$
y_i - f(x_i) = -\frac{\partial L}{\partial f(x_i)}
$$
어디서 많이 본 식이죠? $y_i-f(x_i)$ 즉 잔차에 대한 식이 됩니다..

> **`잔차`**만큼 학습하라는 것 = **`Gradient의 반대 방향`**으로 학습하라와 같은 말이 됩니다.

<br>

# ⚙️ 알고리즘 세부 설명

---

## 알고리즘

해당 알고리즘의 전반적인 이해를 위해 전 글을 읽고와주시면 감사하겠습니다!

[[Machine learning] GBM(Greg Ridgeway. 2020) 리뷰 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/machine%20learning/gbm-greg/)

**💻 알고리즘 설명.**

> **$\hat{f}(x) to be constant$ : $\hat{f}(x) = \arg\min_p\sum_{i=1}^N\Psi(y_i,\rho).$**
> 
> **`맨 처음. 실제값과의 손실함수를 최소화 하는 상수를 찾습니다.`**
> 
> ***for* $t$ in $1,...,T$**
> 
> > ***Step 1.*** 음의 그레디언트(잔차)를 계산
> > 
> > **`해당 식은 실제값과 예측값의 손실함수를 미분한 값에 음수를 취한 값으로 -(gradient)이자 residual(잔차)입니다.`**
> > $$ z_i = -\frac{\partial}{\partial f(x_i)}\Psi(y_i,f(x_i))$$
> > 
> > ***Step 2.*** residual을 target으로 즉, $z_i$를 예측하는 회귀모델 $g(x)$를 적합
> > 
> > **`예측하는데 사용되는 입력값 x로부터 Step.1의 음의 그레디언트 값을 예측하는 함수를 만듭니다.`**
> > 
> > ***Step 3.*** 경사 하강법의 단계 크기 선택 :
> > 
> > $\gamma = \arg \min_{\gamma} \sum^N_{i=1} \Psi(y_i,\hat{f}(x_i) + \gamma g(x_i))$
> > 
> > **`음의 그레디언트 즉, 음의 기울기값으로 어느 크기만큼 진행할 것인지 위 식의 손실함수를 최소화하는 상수 값을 찾습니다.`**
> > 
> > ***Stpe 4.*** $f(x)$ 업데이트
> > 
> > $\hat{f}(x) \leftarrow \hat{f}(x) + \gamma g(x)$
> > 
> > **`다음 모델을 위해 업데이트 합니다.`**

전 글과 달라진 점은 $\rho$를 $\gamma$로 바꾼 것 뿐. 달라진 점은 없습니다.(보기 편하기 위해 변경한 것 뿐입니다!)

## 1️⃣ 알고리즘 1번. $\hat{f}(x) = \arg\min_{\rho} \sum^n_{i=1} \Psi(y_i,\rho)$

초기 모형은 상수로 설정하여 위와 같은 식으로 $\rho$를 찾습니다. $F_0(x)(=f_0(x))$를 찾는 것.

우선 보기 편하도록 $\Psi$를 $L$로 표현하겠습니다. 표현만 다를 뿐 같은 손실함수(loss function)이라는 뜻입니다.

**그라디언트 부스팅 알고리즘이 해결하고자 하는 문제를 일반화** 해보면 output인 $y$와 $p$차원 input vector $x$의 손실 함수 $L$에 대하여 기대 손실함수를 최소화 하는 함수 $\hat{F} \in H$를 찾고 싶은 것입니다.
여기서 $H = \{F|F : \mathbb{R}^p \rightarrow \mathbb{R}\}$ 즉. $H$는 $p$차원 벡터를 상수로 바꾸는 기대 함수 $\hat{F}$의 집합입니다.

$$
Eq (1). : \hat{F}=\arg\min_{F \in H} E_{x.y}[L(y,F(x))]
$$

문제는 $H$가 너무 크다는 것입니다. 그래서 $F$를 찾는 것이 어렵죠. 때문에 **`제약`**을 줍니다.

$$
H^* = \{F|F : \mathbb{R}^p \rightarrow \mathbb{R}, F = const. + \gamma_1f_1 + ... + \gamma_Mf_M, f_j \in H, \gamma_j \in R, j=1,...,M\}
$$

여기가 중요한데, **위 식은 즉 일반 함수가 아닌 상수(const)와 여러 유한한 함수의 선형 결합으로 표현되는 구조로 표현**하겠다는 뜻입니다.

자 알아본 $H^*$을 적용하여 `Eq(1)`을 표현해보면

$\hat{F} = \arg \min_{F \in H^*}\frac1n \sum_{i=1}^n[L(y,F(x))]$이 됩니다.

**이렇게 유도된 $\hat{F}$는 아래와 같은 순서로 찾게 됩니다.**

> $F_0 = \arg \min_{\rho} \sum_{i=1}^n L(y_i, \rho)$
> 
> $F_m = F_{m-1} + \arg \min_{f_m \in H} \sum_{i=1}^n L(y_i, F_{m-1}(x_i)+f_m(x_i)) ... \ Eq(2)$

`여기서 우리는 최소화하는 값을 찾는 것이기 떄문에 1/n은 버립니다.`

위 와같은 식을 1부터 대입해본다면?

$F_1 = F_0 + \arg \min_{f_1 \in H}\sum_{i=1}^nL(y_i,F_0(x_i) + f_1(x_i))$

$F_2 = F_1 + \arg \min_{f_2 \in H}\sum_{i=1}^nL(y_i,F_1(x_i) + f_2(x_i)) = F_0 + f_1 + \arg \min_{f_2 \in H}\sum_{i=1}^nL(y_i,F_0+ f_1(x_i) + f_2(x_i)) $결국 이를 반복하면?

$$
F_M = F_0(const.) + f_1 + f_2+...+f_m
$$

이 됩니다. 우리가 제약을 두었던 식과 같은 식이 되는 것이죠?

> 또한, 위 `Eq(2)`는 **알고리즘 1번의 식과 같습니다.**

<br>

## 2️⃣ 알고리즘 2번. 잔차를 구한다. $z_i=-\frac{\partial}{\partial f(x_i)}\Psi(y_i,f(x_i))$

그라디언트 부스팅에서는 **`Eq(2)`**를 최소화하는 데 경사하강법을 사용합니다.

이 말은.. **$\arg \min_{f_m \in H} \sum_{i=1}^n L(y_i, F_{m-1}(x_i)+f_m(x_i)) = -\gamma\sum_{i=1}^n \nabla L(y_i, F_{m-1}(x_i)+f_m(x_i))$**로 근사한다는 뜻입니다.

그럼 `Eq(2)`는 이와 같아 집니다. 
$$
Eq (2*): F_m = F_{m-1} -\gamma\sum_{i=1}^n \nabla L(y_i, F_{m-1}(x_i)+f_m(x_i))
$$

**`여기서 r(감마)는 경사하강법에서 쓰이는 stepwise size. 단계 크기입니다. 뒤에서 나오는 학습률과는 달라요!`**

맨 처음 설명한 것과 같이 그래디언트를 미분으로 표현하면 $Eq(3) :\nabla L(y_i, F_{m-1}(x_i)+f_m(x_i)) = \frac{\partial L(y_i,F_{m-1}(x_i)+f_m(x_i))}{\partial f_m(x_i)}$와 같이 표현되는데, 이식을 직접 계산하기는 어려워서 **1차 테일러 근사를 통해 표현**합니다.
$$
\nabla L(y_i, F_{m-1}(x_i)+f_m(x_i)) \approx L(y_i,F_{m-1}(x_i)) +f_m(x_i)[\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}]
$$

후 이를 $f_m$에 대하여 미분해주면? 앞서 살펴보았던 `Eq(3)`을 다음과 같이 근사할 수 있습니다.

$$
\frac{\partial L(y_i,F_{m-1}(x_i)+f_m(x_i))}{\partial f_m(x_i)} \approx [\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}]
$$

이를 `Eq(2*)`에 대입한다면

> $F_m = F_{m-1} -\gamma \sum_{i=1}^n[\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}]$

그리고 여기서 $\gamma$를 다음과 같이 최적화 할 수 있습니다.

> $\gamma_m = \arg \min_{\gamma>0}\sum_{i=1}^n L(y_i, F_{m-1}-\gamma \sum_{i=1}^n[\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}])$

**이 때, 음의 그라디언트($-[\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}]$)를 $z_i$라고 정의한다음 $\gamma_m$에 대입하면 `알고리즘 2번`**

> $\gamma_m = \arg \min_{\gamma >0}\sum_{i=1}^n L(y_i, F_{m-1} - \gamma z_i)... \ Eq(4)$

<br>

## 3️⃣ 알고리즘 3번. $z_i$ 즉 residual을 target으로 모델 $g(x)$적합

residual에 대한 식 **$z_i$**을 output으로, **$x_i$**를 input으로 하는 새로운 함수 모델 $g(x)$를 학습합니다.

앞 단계에서 구한 잔차를 예측하는 `base learner`를 만드는 것입니다.

<br>

## 4️⃣ 알고리즘 4번. 경사하강법의 단계 크기 선택. $\gamma = \arg \min_{\gamma} \sum^N_{i=1} \Psi(y_i,\hat{f}(x_i) + \gamma g(x_i))$

앞서 만들었던 base learner $g(x)$는 잔차 $z_i$를 예측하는 모델입니다.

이를 `Eq.(4)`에 이용하면?

> $\gamma_m = \arg \min_{\gamma>0} \sum^N_{i=1} L(y_i,F_{m-1} + \gamma g_m(x_i))$

<br>

## 5️⃣ 알고리즘 5번. 업데이트 $\hat{f}(x) \leftarrow \hat{f}(x) + \gamma g(x)$

앞 단계에서 보았던 식들과 연구자가 정한 **학습률 $l$을 이용하여 모형을 다음과 같이 업데이트 합니다**

> $F_m(x) = F_{m-1}(x) + l \times\gamma_m \times g_m(x)$

플어서 써보면 $\approx F_m = F_{m-1} -l\gamma\sum_{i=1}^n[\frac{\partial L(y_i,F(x_i))}{\partial F(x_i)}]$이 되겠네요.

다시 한번 정리해보면

- $l$ : 과적합 방지를 위한 shrinkage(학습률)
  
- $\gamma$ : 경사하강법의 stepwise size
  
- $g(x)$ : 입력벡터 $x_i$를 받아 잔차인 $z_i$를 예측하는 함수
  

# ⚓ 마치며

---

알고리즘 유도를 이해하기 좀 어렵긴 했는데.. 며칠동안 붙잡고 있으니까 조금씩 이해되더라구요? 유튜브도 좀 도움이 됐고.. 아 그리고 `chat GPT`는 별로인것 같아요. 아무래도 텍스트를 예측해서 만들어주는 알고리즘이지 수식, 연산 등 고등기능은 잘 못하더라구요 ㅜㅜ

**`이상 gbm 알고리즘 분석이었습니다! ☠️`**

> 참조
> 
> [Gradient boosting - Wikipedia](https://en.wikipedia.org/wiki/Gradient_boosting)
>
> 중앙대학교 강의
