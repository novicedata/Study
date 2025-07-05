이번 포스팅은 경사 하강법입니다. 굳이 Deep learning 카테고리에 추가 안 해도 됐지만.. 뉴럴 네트워크와 연결되니 여기에 포스팅하는 걸로!

## 📌 Batch Gradient Descent(배치경사하강법)

---

앞선 포스팅에서 뉴럴네트워크에 대해 알아보았는데, 경사하강법이 등장했었습니다.

배치 경사 하강법은 신경망에서 사용되는 최적화 알고리즘 중 하나로, **학습 프로세스 에서 모델 파라미터를 업데이트하는데 전체 훈련 데이터 셋을 사용합니다.**

전체 훈련 데이터셋을 사용하여 비용함수의 기울기를 모델 파라미터에 대해 계산합니다.

**이때 에포크라는 것이 등장하는데 이 에포크란 전체 훈련 데이터셋을 한 번 훑는 것이라고 생각하시면 되겠습니다. 업데이트 규칙으로서 모델 파라미터는 에포크 마다 한 번 업데이트됩니다.**

**장점**은 다른 방법들보다 계산의 효율성이 높고(업데이트 횟수가 적기 때문에), 안정적이고 병렬계산이 가능하다는 점입니다.

**단점**이라면 당연하게도 전체 데이터셋을 이용하기 때문에 크기가 클수록 계산 비용이 높습니다. 그만큼 필요한 메모리도 많습니다. 또한, 한 에포크마다 업데이트를 하기 때문에 너무 일찍 수렴할 수 있습니다.

요약하면 전체 훈련 데이터셋의 각 example에 대한 오차 $\\nabla E\_i(\\textbf{w}^r)$을 계산하는데, 모델을 업데이트하는 것은 모든 훈련 example이 평가된 후에 이루어지는 것입니다. 이 때 이 전체 데이터셋을 한번 훑는 과정을 에포크라고 하는 것입니다. (가중치 업데이트)

$$  
\\textbf{w}^{r+1} = \\textbf{w}^r - \\eta \\sum\_{i=1}^N \\nabla E\_i(\\textbf{w}^r)  
$$

![](file://C:%5CUsers%5Catlsw%5CAppData%5CRoaming%5Cmarktext%5Cimages%5C2023-12-13-19-39-33-image.png?msec=1702463973521)[##_Image|kage@dG96w0/btsBRS0bz0J/AxNywZzumQky4gn1v87VK1/img.png|CDM|1.3|{"originWidth":645,"originHeight":311,"style":"alignCenter","caption":"출처 :&amp;nbsp; Stanford&amp;rsquo;s Andrew Ng&amp;rsquo;s MOOC Deep Learning Course"}_##]

## 📌 Stochastic Gradeint Descent(확률적 경사 하강법)

---

위 배치 경사 하강법의 한계를 극복하기 위해 변형된 방법입니다. 전체 데이터 셋이 아닌 각 훈련 데이터 포인트에 대해 개별적(**하나의 데이터 포인트)으로** 기울기를 계산하여 모델 파라미터를 업데이트합니다. 매 훈련 데이터 포인트마다 모델 파라미터를 업데이트하기 때문에 전체 데이터셋에 대한 계산이 필요 없습니다.

**확률적이란 이름이 붙는 이유는 전체 데이터 중 랜덤 하게 선택된 하나의 데이터로 학습을 하기 때문입니다.**

**장점**은 이해하기 쉽고 직관적입니다(데이터 포인트에 대해 개별적으로 계산하기 때문에). 학습속도가 빠릅니다.

중요한 장점은 로컬 최솟값으로 수렴하는 문제가 적어집니다.

우리가 모델을 학습할 때 손실 함수를 최소화하여 최적의 모델 파라미터를 찾는 것인데, 이때 손실 함수는 전역(global) 최솟값이 존재합니다. 이 주변에는 여러 로컬(local) 최소값이 존재할 수 있습니다.

noiszy 한 업데이트를 함으로써 모델이 특정 로컬 최솟값에 갇히는 것을 방지할 수 있는데, 다양한 방향으로 조금씩 움직이기 때문에 더 좋은 전역 최솟값을 찾을 가능성이 높아지는 것입니다.

**단점**은 메모리 사용량이 낮지만 여전히 계산 비용이 높습니다. 그리고 오히려 noisy 한 업데이트로 인해 때로는 수렴이 불안정하게 이루어질 수 있습니다.

$$  
\\textbf{w}^{r+1} = \\textbf{w}^r - \\eta \\nabla E\_i(\\textbf{w}^r)  
$$

![](file://C:%5CUsers%5Catlsw%5CAppData%5CRoaming%5Cmarktext%5Cimages%5C2023-12-13-19-39-42-image.png?msec=1702463982339)[##_Image|kage@KoABL/btsBY3MbTRM/cu5noicX0NyS27Z3En3XS1/img.png|CDM|1.3|{"originWidth":625,"originHeight":307,"style":"alignCenter","caption":"출처 :&amp;nbsp; Stanford&amp;rsquo;s Andrew Ng&amp;rsquo;s MOOC Deep Learning Course"}_##]

## 📌 Mini batch Gradient Descent(미니 배치 경사하강법)

---

미니 배치 경사 하강법은 **전체 데이터셋을 작은 미니 배치로 나누어 각 미니 배치에 대해 기울기를 계산하여 모델 파라미터를 업데이트하는 방식입니다.** 확률적 경사 하강법과 배치 경사하강법의 중간정도로 각각의 특성을 반영하여 일부 데이터만을 사용하면서도 전체 데이터셋의 특성을 반영할 수 있습니다.

구현에 따라 미니 배치의 기울기를 합산하여 기울기의 분산을 더 줄일 수 있습니다.

**장점**은 배치 경사 하강법에 비해 robust 한 수렴이 가능하고 로컬 최솟값을 피하는데 도움이 됩니다. 또한 계산적으로 더 효율적입니다.

**단점**은 결국 미니 배치의 크기의 조정에 따라 성능이 달라지기에 좋은 크기를 선정하는 것이 중요합니다.

$$  
\\textbf{w}^{r+1} = \\textbf{w}^r - \\eta \\sum\_{i=1}^{i\_m} \\nabla E\_i(\\textbf{w}^r)  
$$

[##_Image|kage@ykwEa/btsBR9G86jK/Gn1uYDYjJ4z6v3CFmsUSuk/img.png|CDM|1.3|{"originWidth":624,"originHeight":289,"style":"alignCenter","caption":"출처 :&amp;nbsp; Stanford&amp;rsquo;s Andrew Ng&amp;rsquo;s MOOC Deep Learning Course"}_##]
