---
excerpt: "부트스트랩에 대해 알아보자"

categories:
  - Resampling

tags:
  - [통계 분석]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-09-15
last_modified_at: 2023-09-15

title: "Bootstrap. 부트스트랩과 신뢰구간"

---


# 📌 Bootstrap
---

## **`부트스트랩? 최대우도?`**

resampling 기법 중 하나로 **original data set with replacement. 즉, 복원 추출 입니다,** 쉽게 그림으로 보면

![image](https://github.com/novicedata/colab_practice/assets/88019539/d02e8345-27a1-4152-b8c4-7c6729112b23){: .align-center}

우리는 실제 모수에 대한 정보를 알 수 없습니다. 그래서 sampling을 하는데, 쉽게 data set가 더 필요한 상태인데 상황이 안된다고 가정해봅시다. **그때 우리가 가지고 있는 sample에서 복원 추출을 통해 data set을 만드는 겁니다. 재밌는 점은 sample size가 충분히 크다면 누적분포 함수가 실제 모수의 누적분포 함수에 거의 수렴하게 됩니다.**

한번 분포에 대해 알아봅시다.

- 표본 크기 : $N$
- $\hat{F}$ : 실제 분포 $F$에 대한 추정치
  

$$
\hat{F}(x) = \dfrac1N \sum^N_{i=1} I(X_i \leq x) 
$$

최대 우도 추정(Maximum Likelhood Estimation)은 모수를 추정하기 위해서 모수 공간에서 log-likelihood function을 최대화하는 과정인데. 확률 변수 $X$에 대한 분포 함수를 아래와 같다고 합시다.

$$
F(x) = F_X(x)
$$

어떠한 고정된 $x$값에 대해 확률 변수 $X$가 $X \leq x$임을 **'성공'**이라고 부르며 이 때의 확률을 아래와 같이 표시합니다.

$$
F(x) =Pr(X \leq x)
$$

랜덤 샘플 $X_1,...,X_N$이 선택되엇을 때, $F(x)$의 MLE는 샘플 $X_1,...,X_N$에서 $X \leq x$인 경우의 수를 전체 샘플 크기 $N$으로 나눈 것이고 아래와 같습니다.

$$
\hat{F}_N(x) = \dfrac{\{i: X_i \leq x\}}{N} = \frac1N \sum^N_{i=1} I(X_i \leq x)
$$

### **`중요한 점`**

여기서 추정된 분포 함수 $\hat{F}_N$은 $N \rightarrow \infty$일 때, **즉, sample 수가 많다면** 어떠한 한정된 집합 $A \subset \mathbb{R}$에서 $\|\hat{F}_N-F(x)\| \rightarrow 0$로 상한됩니다.

**이는, large sample에서 추정된 분포 함수는 실제 분포 함수에 근사한다는 뜻입니다.**

## **`그래프로 보자`**

이를 그래프로 한번 봅시다.

- $x=(1, 5,10)$
  

이 때 추정된 확률 분포 $\hat{F}$를 계산해봅시다.

$$
\begin{align}
&\hat{F}(1) = \dfrac{\{i: X_i \leq x\}}{N} = \dfrac{1}{3}
\\ &\hat{F}(5) = \dfrac{\{i: X_i \leq x\}}{N} = \dfrac{2}{3}
\\ &\hat{F}(10) = \dfrac{\{i: X_i \leq x\}}{N} = \dfrac{3}{3}
\end{align}
$$

$\hat{F}(5)$을 설명해보자면 $x=5$일 때 $(X \leq 5)$를 만족하는 확률 변수 $X$는 $1,5$이기 때문에 $\hat{F}(5) = \frac23$이 됩니다.

![image](https://github.com/novicedata/colab_practice/assets/88019539/831f3800-cad7-4112-a9f4-3b061bba9509){: .align-center}

<br>

## ➕ 신뢰 구간(부트스트랩을 왜 사용할까?)

우선 가정을 한번 해봅시다.

- $\theta$ : 실제 분포 $F$에 대한 평균 파라미터
- $\hat{\theta}$ : 추정된 분포 $\hat{F}$에 대한 평균 파라미터
- $B(F)(= E(\hat{\theta}\|F)-\theta)$ : 추정치에 대한 편향
- $v(F)(=var(\hat{\theta}\|F))$ : 추정치에 대한 분산
  
  자 여기서 우리는 아래이 점진적으로 정규분포에 수렵하길 원합니다.
  
$$
H = \dfrac{\hat{\theta}-\theta-B(F)}{\sqrt{v(F)}} \approx N(0,1)
$$

이 때 **신뢰구간**을 구하면 아래와 같습니다.

$$
\hat{\theta}-B(F)-h_{1-\alpha/2}\sqrt{v(F)} < \theta < \hat{\theta}-B(F)-h_{\alpha/2}\sqrt{v(F)}
$$

문제는 **$F$를 모르기 때문에 이 식을 사용할 수가 없습니다.**

**`바로 이를 위해 bootstrap을 사용합니다.`**

**추정된 분포 $\hat{F}$로부터 크기가 $n$인 $A$개의 무작위 표본을 추출합니다. 이렇게 추출한 각각의 표본을 a번째 부트스트랩 랜덤 샘플이라고 합시다. : $\{y_{a1},...,y_{an}\}$**

여기서 분산(v)과 편향(B)를 구해보면

$$
\begin{align}
&B(\hat{F}) = E(\hat{\theta_a}|\hat{F})-\hat{\theta}
\\ &\hat{B}_a (\hat{F}) = \frac{1}{A}\sum^A_{i=1}\hat{\theta}_{ai}-\hat{\theta} = \bar{\hat{\theta}_a} - \hat{\theta}
\\ &v(\hat{F}) = var(\hat{\theta}_a|\hat{F})
\\ &\hat{v}_a(\hat{F}) = \frac{1}{A-1}\sum^A_{i=1}(\hat{\theta}_{ai}-\bar{\hat{\theta}_a})^2
\end{align}
$$

### **◾ normal method**

normal한 방법에서는 **부트스트랩으로 얻은 샘플에서**위에서 구한 분산과 편향을 대입해줍니다.

$$
\hat{\theta}-\hat{B}_a(\hat{F})-h_{\alpha/2}\sqrt{\hat{v}_a(\hat{F})} < \theta <\hat{\theta}-\hat{B}_a(\hat{F})-h_{1-\alpha/2}\sqrt{\hat{v}_a(\hat{F})}
\\ = 2\hat{\theta}-\bar{\hat{\theta_a}}-h_{1-\alpha/2}\sqrt{\hat{v}_a(\hat{F})} < \theta < 2\hat{\theta-\bar{\hat{\theta_a}-h_{\alpha/2}\sqrt{\hat{v}_a(\hat{F})}}}
$$

### **◾ Basic(Residual) method**

문제는 **normal approximation 방법에서 $\hat{\theta}-\theta$가 정규 분포와 유사하지 않다면 사용하기 어렵습니다.** 이 때, 부트스트랩 샘플을 사용하여 $\hat{\theta}_a-\hat{\theta}$의 resampling distribution을 이용하여 $\hat{\theta}-\theta$의 분포에 근사할 수 있습니다.

$$
\hat{\theta_a}_{((B+1)\alpha/2)} - \hat{\theta} < \hat{\theta}-\theta < \hat{\theta_a}_{((B+1)(1-\alpha/2))} - \hat{\theta}
\\ = 2\hat{\theta}-\hat{\theta_a}_{((B+1)(1-\alpha/2))} < \theta < 2\hat{\theta}-\hat{\theta_a}_{((B+1)(\alpha/2))}
$$

### **◾ Percentile method**

분위수를 사용할 경우 굉장히 simple해 집니다.

$$
\hat{\theta_a}_{((B+1\alpha/2))} < \theta < \hat{\theta_a}_{((B+1)(1-\alpha/2))}
$$
