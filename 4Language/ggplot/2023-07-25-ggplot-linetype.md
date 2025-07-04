---
excerpt: "ggplot2의 linetype 옵션을 알아보자"

categories:
  - ggplot2

tags:
  - [그래프 기본 시각화 설정]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-25
last_modified_at: 2023-07-25

title: "[ggplot2] linetype, 선 모양 옵션"
---
<br>

이번엔 ggplot의 linetype, 선 모양을 바꾸어 보겠습니다.

<br>

# 📌 linetype 종류
---

R에서 지원하는 선의 종류 입니다.
![image](https://github.com/novicedata/colab_practice/assets/88019539/7bd8a8ff-4bd6-4a25-9386-a5773afe6c3f){: .align-center}{: width="40%", height="40%"}

우선 표로 정리한 다음, 하나하나 살펴보겠습니다.


## ➕ 표 정리

| type | shape | type | shape |
| --- | --- | --- | --- |
| **`twodash`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/6da064ad-88ec-4a93-8d04-19d7af676436) | **`dotted`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/6ae8e056-5b2a-4da5-9960-5f5a3c45704d) |
| **`solid`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/c51d148d-485e-4b93-bfea-3c46aef1089e) | **`dotdash`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/c88374b9-859a-4d21-bedc-7047571d6fc2) |
| **`longdash`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/b8b40bbb-70fb-46aa-a624-197a1051bd90) | **`dashed`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/80c8e0a5-2d65-4573-b185-3f711a7e7c6e) |
| **`blank`** | ![image](https://github.com/novicedata/colab_practice/assets/88019539/1119791b-0908-4047-856f-7d8eb87a5a14) |     |     |

<br>

### **twodash**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'twodash', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/c4b4ea58-0626-4f2d-be39-b1eae7f8ad27){: .align-center}

### **solid**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'solid', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/763acc9a-6380-4732-9190-3f432d3bf252){: .align-center}

### **longdash**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'longdash', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/786614f4-1dfd-4a9e-832d-8f58ba2e090d){: .align-center}

### **dotted**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'dotted', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/385f78b2-2e6b-4bee-9bb7-3555214e2065){: .align-center}

### **dotdash**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'dotdash', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/d092a399-50b7-4828-9f9c-943aeb640ec4){: .align-center}

### **dashed**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'dashed', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/c8f15121-7b4b-4d8a-9b07-692fc47e3af4){: .align-center}

### **blank**

```python
ggplot(data = Orange, aes(x = age,
                        y = circumference,
                       color = Tree)) +
  geom_line(linetype = 'blank', size = 1)
```
![image](https://github.com/novicedata/colab_practice/assets/88019539/1119791b-0908-4047-856f-7d8eb87a5a14){: .align-center}

<br>

**`이상 ggplot linetype 이었습니다! ☠️`**

<br>

---

- **다른 ggplot 옵션 보기** : [그래프 기본 시각화 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/tags/#그래프-기본-시각화-설정)
