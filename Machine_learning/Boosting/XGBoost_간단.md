전 글들이 좀 읽기 어려운 것 같아 쉽게 써보려고 합니다.

전 글들 :

 [XGBoost에 대해(원리와 공식)

저번 포스팅에 이어서 XGBoost의 원리와 왜 확장성이 높은 알고리즘인가에 대해서 포스팅 하려고 합니다! 공식의 유도와 원리에 대한 이야기이기 때문에 전 포스팅을 보고 와주세요. XGBoost: A Scalab

datanovice.tistory.com](https://datanovice.tistory.com/entry/XGBoost%EC%97%90-%EB%8C%80%ED%95%B4%EC%9B%90%EB%A6%AC%EC%99%80-%EA%B3%B5%EC%8B%9D)

 [XGBoost: A Scalable Tree Boosting System(Carlos & Tianqi. 2016) 리뷰

이번엔 XGBoost를 다루려고 합니다. 해당 논문을 읽고 정리한 내용이니 좀더 자세하고 이해하기 쉬운 설명은 다음 포스팅을 참고해주세요! 1️⃣ 서론 기계 학습과 데이터 기반 접근법이 많은 분

datanovice.tistory.com](https://datanovice.tistory.com/entry/XGBoost-A-Scalable-Tree-Boosting-SystemCarlos-Tianqi-2016-%EB%A6%AC%EB%B7%B0)

XGboost : Extreme Gradient Boosting입니다. 말 그래도 Gradient Boosting의 업그레이드 버전이라고 보시면 될 것 같습니다.

혹시 GBM에 대해 아직 모르신다면 아래 글을 보고와주세요.

 [2\. Boosting : Gradient Boosting(왜 Gradient인가?)

📌 Gradient Boosting Gradient Boosting은 Gradient descent와 boosting을 합친 것으로, 경사하강법과 부스팅 기법을 사용합니다. 경사하강법에서 loss인 $L(\\theta)$를 최소화하기 위해 아래와 같은 방법으로 $\\theta$

datanovice.tistory.com](https://datanovice.tistory.com/entry/2-Boosting-Gradient-Boosting%EC%99%9C-Gradient%EC%9D%B8%EA%B0%80)

천천히 시작해 봅시다.

## 📌 최적화해야 하는 목적 함수

**우리가 최적화해야 하는 목적 함수는 손실함수와 정규화항의 합으로 나타내고 아래와 같습니다. 여기서 $\\theta$는 우리가 추정해야 하는 매개변수입니다.**

$$  
F(\\theta) = L(\\theta) + \\Omega(\\theta)  
$$

여기서 손실함수인 $L(\\theta)$는 회귀의 경우 가장 흔한 square loss function이 될 수도 있고, 분류의 경우 logistic loss function이 될 수도 있겠네요.

### 1\. 손실 함수 정리

#### ◼️ 가법 모형

부스팅 모델은 여러 약한 학습기를 더해 강하게 만드는 것이라고 했습니다. **이렇듯 부스팅 모델은 하나의 가법 모형으로 아래와 같이 나타낼 수 있습니다.**

$$  
\\hat{y}\_i = \\sum\_{k=1}^K f\_k(\\textbf{x}\_i)  
\\ where \\ f\_k \\in \\mathcal{F}  
$$

예측값 $\\hat{y}$는 여러 모델의 예측값 $f\_k(\\textbf{x}\_i)$의 합으로 나타납니다.

이를 나무 $t$의 단계에 따라 써본다면 아래와 같을 겁니다.

$$  
\\begin{align\*} \\hat{y}i^0 &= 0  
\\\\ \\hat{y}\_i^1 &= \\hat{y}\_i^0 + f\_1(\\mathbf{x}\_i) = f\_1(\\mathbf{x}\_i)  
\\\\ \\hat{y}\_i^2 &= \\hat{y}\_i^1 + f\_2(\\mathbf{x}\_i) = f\_2(\\mathbf{x}\_i) + f\_1(\\mathbf{x}\_i)  
\\\\ &\\vdots  
\\\\ \\hat{y}\_i^t &= \\hat{y}\_i^{t-1} + f\_t(\\mathbf{x}\_i) = \\sum\_{k=1}^t f\_k(\\mathbf{x}\_i)  
\\end{align\*}  
$$

그럼 이 가법 모형을 통해 $t$번째 모델에서의 목적함수를 봅시다.

$$  
\\begin{align}  
F(\\theta)^t &= \\sum\_{i=1}^n l(y\_i, \\hat{y}\_i^t) + \\sum\_{k=1}^K \\omega (f\_k)  
\\\\ &= \\sum\_{i=1}^n l(y\_i, \\hat{y}\_i^{t-1} + f\_t(\\textbf{x}\_i)) + \\omega(f\_t) + constant  
\\end{align}  
$$

#### ◼️ 테일러 급수

**테일러 급수**를 이용해 봅시다. **손실함수를 쉬운 것을 사용하면 계산식도 쉽습니다. 예를 들어 loss squre function의 경우 식이 굉장히 간단하죠. 하지만 다른 function의 경우 식이 매우 계산하기 복잡하고 어려워 집니다. 그래서 테일러 급수를 사용한다고 합니다.**(제가 알기론 그렇습니다만 틀렸다면 알려주세요.)

한번 봅시다. 아래와 같이 $g\_i, h\_i$를 정의했을 때(테일러 1차식, 2차식)

$$  
g\_i = \\dfrac{\\partial}{\\partial \\hat{y}^{t-1}}l(y\_i, \\hat{y}^{t-1})  
\\ h\_i = (\\dfrac{\\partial}{\\partial \\hat{y}^{t-1}})^2 l(y\_i, \\hat{y}^{t-1})  
$$

목적 함수는 아래와 같아집니다.

$$  
\\begin{align}  
F(\\theta)^t = \\sum\_{i=1}^n\[l(y\_i, \\hat{y}\_i^{t-1}) + g\_i f\_t(\\textbf{x}\_i) + \\frac12 h\_i f\_t^2(\\textbf{x}\_i)\] + \\omega(f\_t) + constant  
\\end{align}  
$$

여기서 상수들을 제거하면 아래와 같은 식을 얻게 되네요.

$$  
\\begin{align}  
F(\\theta)^t = \\sum\_{i=1}^n\[ g\_i f\_t(\\textbf{x}\_i) + \\frac12 h\_i f\_t^2(\\textbf{x}\_i)\] + \\omega(f\_t)  
\\end{align}  
$$

### 2\. 정규화항 정리

**이번엔 정규화항을 정리해 봅시다.**

#### ◼️ final nodes

f를 $T$개의 final nodes(tree의 맨 아래 node)로 이루어진 트리라고 할 때

$$  
f(x) = w\_{q(x)}  
$$

정규화항 $\\omega(f)$는 아래와 같다고 합니다.

$$  
\\omega(f) = \\gamma T + \\frac12 \\lambda \\sum\_{j=1}^T w\_j^2  
$$

**그럼 위에서 정의한 두식 $f(x), \\omega(f)$를 식(9)에 대입해 봅시다.**

$$  
\\begin{align}  
F(\\theta)^t = \\sum\_{i=1}^n\[ g\_i w\_{q(\\textbf{x}\_i)} + \\frac12 h\_i w^2\_{q(\\textbf{x}\_i)}\] + \\gamma T + \\frac12 \\lambda \\sum\_{j=1}^T w\_j^2  
\\end{align}  
$$

### 3\. whole form

**이어서 $t$번째 트리에서, $I = { i:q(\\textbf{x}\_i)=j }$를 $j$번째 final node에 속하는 인덱스 집합이라고 합시다.**

**여기서 $G\_j = \\sum\_{i \\in I\_j} g\_i, H\_j = \\sum\_{i \\in I\_j} h\_i$라 하고 식(10)에 대입하면 아래와 같습니다.**

$$  
\\begin{align}  
F(\\theta)^t &= \\sum\_{j=1}^T\[ (\\sum\_{i \\in I\_j}g\_i) w\_j + \\frac12 (\\sum\_{i \\in I\_j}h\_i + \\lambda) w\_j^2\] + \\gamma T  
\\\\ & = \\sum\_{j=1}^T\[ G\_j w\_j + \\frac12 (H\_j + \\lambda) w\_j^2\] + \\gamma T  
\\end{align}  
$$

이때 트리 구조 $q$에 따라 최적의 $w\_j$를 아래와 같이 정의하면

$$  
w\_j = -\\dfrac{G\_j}{H\_j+\\lambda}  
$$

최종 목적함수는 아래와 같습니다.

$$  
\\begin{align}  
F(\\theta)^t & = -\\frac12 \\sum\_{j=1}^T \\dfrac{G\_j^2}{H\_j +\\lambda} + \\gamma T  
\\end{align}  
$$

## 📌 학습

자. 식은 나왔고 그럼 학습은 어떻게 할까요??

우리가 하나의 node에서 하위 두 개의 node로 분리할 때 아래와 같은 Gain 함수를 얻을 수 있습니다.

$$  
G\_{split} = \\frac{1}{2} \\left\[\\frac{G\_L^2}{H\_L+\\lambda}+\\frac{G\_R^2}{H\_R+\\lambda}-\\frac{(G\_L+G\_R)^2}{H\_L+H\_R+\\lambda}\\right\] - \\gamma  
$$

식의 구조를 보면 분할 후의 왼쪽 node, 오른쪽 node에 해당한 값을 더한 뒤, 전체 node에 해당하는 값을 뺴줍니다.

**위 $G\_{split}$값이 크다는 것은 분할 후의 값이 크다는 것으로! 이 값을 최대화할 때를 기준으로 최적의 분할을 찾습니다.**
