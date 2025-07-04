---
excerpt: "python의 tuple를 알아보자."

categories:
  - python basic

tags:
  - [파이썬]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-08-01
last_modified_at: 2023-08-01

title: "[python] 튜플 타입과 패킹, 언패킹"
---
<br>
오늘은 파이썬의 리스트 타입에 대해서 알아보려 합니다. 별거없어요!
리스트와 비슷한 점이 많으니 리스트 포스팅을 보고 와주세요.

- [[python] 리스트 타입과 인덱싱 - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/python%20basic/python-list/)

<br>

# 📌 Tuple type
---

튜플의 제일 중요한 점은 한번 선언하면 **`수정이 안된다는 것입니다.`** 그렇다면 리스트를 사용하지 왜 튜플을 사용하느냐?

- **리스트에 비해 실행 속도가 빠르다.**  
- **변경해서는 안되는 값을 사용할 때 좋다.**
정도가 있겠네요
  
한번 선언해봅시다. 간단합니다. 리스트와 다르게 **`[]가 아닌 ()를 사용해주면 됩니다.`** : **Tuple name = (element1, element2, element3, ...)**

```python
# 튜플 선언하기

a = ('hi', 1, 2.5, True)
a 

>> ('hi', 1, 2.5, True)
```

이와 같이 정수, 실수, 문자열, 불리언 모두 넣어줄 수 있습니다.

<br>

## ◾ 인덱싱

인덱싱은 리스트와 같습니다. **`위치의 순서가 0부터 시작하는 것 아시죠?`**

```python
# 튜플 요소 불러오기

a[0] 
a[1:3] # 1번째 요소포함 3번째 요소 미포

>> 'hi'
>> (1, 2.5)
```

이렇게 리스트와 같은 방법으로 인덱싱할 수 있습니다.

<br>

# ◾ 패킹(packing) and 언패킹(unpacking)
---

- **`패킹(packing)`** : 여러가지 타입의 요소들을 하나의 튜플이나 리스트로 묶어 선언
- **`언패킹(unpacking)`** : 하나의 튜플이나 리스트의 요소들을 여러 변수에 나누어 넣는 것.

```python
# 패킹

tuple1 = 'hi', 1.45, True
tuple1

>> ('hi', 1.45, True)
```

```python
# 언패킹

a, b, c = tuple1
print(a, b, c)

>> hi 1.45 True
```

언패킹을 보시면 **`튜플의 각 요소를 a,b,c에 넣어준겁니다.`**

**`이상 python 리스트였습니다! ☠️`**

---

**다른 python 기초 보기** : [Python basic - 데이터를 파고파기 ⛏️](https://novicedata.github.io/categories/#python-basic)
