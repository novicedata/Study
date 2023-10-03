---
excerpt: "ggplot2의 geom_density 옵션을 알아보자"

categories:
  - ggplot2

tags:
  - [geom]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-21
last_modified_at: 2023-07-21

title: "[ggplot2] geom_density 코드 옵션"
---

<br>

이번엔 geom_density의 옵션들을 보겠습니다.

<br>

# geom_density()

---

우선 **`geom_density()`**에 대한 설명입니다! 이름 처럼 이는 **`밀도 그래프`** 입니다. 분포를 눈대중으로 파악할 수 있게 도와줍니다. **히스토그램과 유사하지만 마치 산처럼 표현한데서 차이가 있네요.**

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density()
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/7f8e416a-aaf7-4839-9474-f4a40ddfe48e){: .align-center}

<br>

## fill 옵션(영역 색상)

**<u>영역의 색상을 입혀줍니다.</u>**

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(fill = 'red')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/01a34e26-017e-4364-85e4-a9c7bd2bea6b){: .align-center}

## ◾ alpha 옵션(투명도)

해당 옵션은 **`투명도`**를 조정합니다. **`0부터 1까지로 0에 가까울수록 투명하고, 1에 가까울수록 진해집니다.`**

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(fill = 'red', alpha = 0.3)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/687be84f-0338-4714-b774-2afa0e2b5ad3){: .align-center}

## ◾ color 옵션(데이터 포인트 색상)

해당 옵션은 **<U>데이터 포인트들의</U>** **`색상`**을 조정합니다. geom_density()의 경우 **`선`**이 되겠네요.

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(color = 'blue', fill = 'red', alpha = 0.3)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/4b823855-7487-4aac-ab1a-4dc7c458773e){: .align-center}

## ◾ linetype 옵션(선의 종류)

해당 옵션은 **`선의 종류`**를 바꿔줍니다. 선의 종류에는 아래와 같이 존재합니다.

![image](https://github.com/novicedata/colab_practice/assets/88019539/7bd8a8ff-4bd6-4a25-9386-a5773afe6c3f){: .align-center}{: width="40%", height="40%"}

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(color = 'blue', fill = 'red', alpha = 0.3,
               linetype = 'dotdash')
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/6f1a822d-3c50-4822-9566-eb35c6abfed6){: .align-center}

## ◾ size 옵션

해당 옵션은 **`선의 크기`**를 바꿔줍니다. 바로 보시죠.

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(color = 'blue', fill = 'red', alpha = 0.3,
               linetype = 'dotdash', size = 2)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/b150e466-a660-4086-8bf6-96324efc611d){: .align-center}

## ◾ adjust 옵션

해당 옵션은 **`선의 곡선의 정도`**를 바꿔줍니다. 숫자가 커질수록 평평해집니다.

**검정 : 기본값, 파랑 : adjust = 0.5, 빨강 : adjust = 4**

```python
ggplot(data = mpg, aes(x = hwy)) +
  geom_density(color = 'red', size = 1,adjust = 4) +
  geom_density(color = 'blue', size = 1, adjust = 0.5) +
  geom_density(color = 'black', size = 1)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/c92c0d87-5347-48dc-ae8e-83e04c192be3){: .align-center}

## ◾ fill = group(그룹별로 색상 다르게)

해당 옵션을 그룹마다 데이터 영역을 표시해주며 색도 다르게 표해줍니다.

```python
ggplot(data = Wage, aes(x = wage, fill = race)) +
  geom_density()
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/26a3fa96-98c2-4c70-a1eb-0f7d05c6ce28){: .align-center}

## ◾ position 옵션

위 그림을 보면 다 겹쳐보이죠? 이걸 조정해줄겁니다. 바로 **`position`** 옵션으로요. position의 값으로는 **`stack, identity, fill`** 이 있는데 각각 보시죠.(**dodge**도 있긴한데 아직 정확히 어떤 옵션인지 모르겠네요.)

```python
ggplot(data = Wage, aes(x = wage, fill = race)) +
  geom_density(position = 'identity', alpha = 0.4)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/d2cf1666-a6c6-449d-ad62-792b289a891a){: .align-center}

```python
ggplot(data = Wage, aes(x = wage, fill = race)) +
  geom_density(position = 'stack', alpha = 0.4)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/1052fcfb-3fea-4394-8016-3b52516a2697){: .align-center}

```python
ggplot(data = Wage, aes(x = wage, fill = race)) +
  geom_density(position = 'fill', alpha = 0.4)
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/e2a3f927-1484-43fc-a6af-e97edc84e3c1){: .align-center}

**`이상 geom_density 옵션이었습니다! ☠️`**
