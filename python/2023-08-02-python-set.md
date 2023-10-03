---
excerpt: "python의 set를 알아보자."

categories:
  - python basic

tags:
  - [파이썬]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-02
last_modified_at: 2023-08-02

title: "[python] 세트 타입, set type"
---

<br>

오늘은 **`set type`**입니다.

<br>

# 📌 Set type
---

세트 타입의 특징으로는
- **집합과 비슷한 개념으로 요소들의 순서는 무시합니다.**
- **중복된 요소를 사용할 수 없습니다.**
- **집합과 비슷한 만큼 교집합, 합집합 같은 연산이 가능합니다.**
  
한번 선언해봅니다. 선언법은 **`{}`**, **`중괄호`**를 이용합니다. : **set name = {element1, element2, element3, ...}**

```python
# 세트 선언 1

a = {'hi', 1, 1.2}
a

>> {1, 1.2, 'hi'}
```

이렇게 중괄호로 선언해주면 됩니다. 또 다른 방법을 봅시다.

- **set() 함수로 선언하기**

**`set()`** 함수를 이용하여 선언할 수도 있습니다.

```python
# 세트 선언 2 : set()

b = set('tomato')
b

>> {'a', 'm', 'o', 't'}
```

여기서 보아야할 점은 **`중복이 된 요소는 하나로 나온다는 것입니다.`** 앞서 특징 중에 중복된 요소는 사용할 수 없다고 하였죠? t와 o가 하나씩만 나오는 이유입니다.

<br>

## ◾ 세트 인덱싱

앞서 설명할 때 **`순서는 무시한다고 하였죠.`** 그래서 튜플과 리스트와 다르게 **[]를 이용한 인덱싱이 불가합니다.**

```python
# 세트 인덱싱

b = set('tomato')
b[2] 

---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-6-31446f9b2675> in <cell line: 2>()
      1 b = set('tomato')
----> 2 b[2]

TypeError: 'set' object is not subscriptable
```

이처럼 에러가 나오는 것을 볼 수 있습니다.

<br>

## ◾ 요소 찾기 : element in set

순서가 안되지만 요소가 있는지는 찾을 수 있습니다. **`찾을 요소 in 세트명`**을 통해 사용할 수 있습니다.

```python
# 요소 찾기

c = {'red', 'blue', 'green', 'white', 'black'}
print('red' in c, 'pink' in c)


>> True False
```

세트 c안에 red가 있기 때문에 True를 pink는 없기 때문에 False를 반환하는 걸 볼 수 있습니다.

<br>

## ◾ 세트 연산 : 합집합 | , 교집합 & , 차집합 - , 여집합 ^

앞서 말한 것 처럼 세트의 경우 **집합**과 같기 때문에 집합 연산이 가능합니다.

```python
# 세트 연산

set1 = {1, 2, 3, 4, 5}
set2 = {3, 4, 5, 6, 7}

set1 | set2 # 합집합  
>> {1, 2, 3, 4, 5, 6, 7}

set1 - set2 # 차집합
>> {1, 2}

set1 & set2 # 교집합
>> {3, 4, 5}

set1 ^ set2 # 여집합
>> {1, 2, 6, 7}
```

<br>

## ◾ 요소 추가, 제거 : add(), remove(), update()

요소를 추가하고 제거할 수 있습니다.

```python
# 요소 추가, 제거

a = {1, 2, 3}

a.add(4) # 요소 하나 추가하기 
a
>> {1, 2, 3, 4}

a.remove(3) # 요소 제거하기  
a 
>> {1, 2}

a.update((4,5)) # 요소 한번에 많이 추가하기
a 
>> {1, 2, 3, 4, 5}
```

**`이상 python 세트였습니다! ☠️`**

---

**다른 python 기초 보기** : [Python basic - 데이터를 파고파기 ⛏️](https://novicedata.github.io/categories/#python-basic)
