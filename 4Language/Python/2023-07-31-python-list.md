---
excerpt: "python의 list를 알아보자."

categories:
  - python basic

tags:
  - [파이썬]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-31
last_modified_at: 2023-07-31

title: "[python] 리스트 타입과 인덱싱"
---

<br>

오늘은 파이썬의 리스트 타입에 대해서 알아보려 합니다. 별거없어요!

<br>

# 📌 List type

---

리스트 타입이 좋은게 **`어떤 타입이든 들어갈 수 있습니다.`** 선언해봅시다.
선언하는 법은 간단합니다. **list name = [element1, element2, element3, ...]** 이런식으로 **괄호**로 묶어 주면 됩니다.

```python
list1 = [1, 2.4, 'pizza', True]


for i in list1:
  print(i)

>> 1
>> 2.4
>> pizza
>> True
```

위와 같이 정수, 실수, 글자, 참과 거짓 같이 어떤 타입이든 넣어줄 수 있습니다.

<br>

## ◾ 인덱싱과 수정

리스트 타입의 인덱싱입니다. 파이썬의 경우 **`시작이 1이 아니라 0입니다.`** 아래와 같이 첫 요소를 불러오기 위해서는 1이 아닌 0을 사용합니다.

```python
# 리스트 인덱싱 1

apex = [1, 2, 3, [4, 5, 6]]
apex[0] 

>> 1
```

이처럼 apex라는 이름의 list의 0번째 요소인 1을 가져오는 것입니다. apex의 리스트의 경우 **`리스트 안에 리스트가 들어가 있습니다. 해당 요소를 뽑아올 경우`**

```python
# 리스트 인덱싱 2 

apex = [1, 2, 3, [4, 5, 6]]
apex[3] 
>> [4, 5, 6]
```

이와 같이 리스트를 가져와 줍니다. **`그렇다면 [4,5,6]안에 있는 5를 가져오기 위해서는 어떻게 할까요?`**

```python
# 리스트 인덱싱 3

apex = [1, 2, 3, [4, 5, 6]]
apex[3][1] 
>> 5
```

이처럼 apex리스트 안의 **세 번째** 요소인 리스트를 가져온뒤 그 리스트의 **두 번째** 요소인 5를 가져올 수 있습니다.

수정하는 법도 간단합니다. 해당 요소를 가져온뒤 다른 값을 할당해주면 됩니다.

```python
# 리스트 요소 수정

apex = [1, 2, 3, [4, 5, 6]]
apex[3] = 'life'

apex 
>> [1, 2, 3, 'life']
```

<br>

## ◾ 연산

리스트 타입의 연산입니다. **더하기, 곱하기를 해보죠.**

```python
# 리스트 더하기

food = ['pizza', 'is']
mood = ['good', 'food']

food + mood 

>> ['pizza', 'is', 'good', 'food']
```

이와 같이 더해줍니다. 곱한다면?

```python
# 리스트 곱하기

food * 2
>> ['pizza', 'is', 'pizza', 'is']
```

이처럼 곱한 횟수 만큼 반복해줍니다.

<br>

## ◾ 관련 함수

### - append : 요소 추가 1

```python
# 리스트 요소 추가 append

a = ['red', 'green', 'blue']
a.append('black')

a 
>> ['red', 'green', 'blue', 'black']
```

**`리스트명.append(추가할 요소)`**를 통해 **요소를 추가합니다.**

### - insert : 요소 추가 2

```python
# 리스트 요소 추가 insert

a = ['two', 'three', 'four']
a.insert(0, 'one')

a
>> ['one', 'two', 'three', 'four']
```

**`리스트명.insert(자리, 추가할 요소)`**를 통해 **원하는 순서에** 요소를 추가합니다.

### - extend : 요소 확장

```python
# 리스트 요소 확장 extend

a = ['one', 'two']
a.extend(['three', 'four'])

a
```

**`리스트명.extend(추가할 리스트)`**를 통해 **원하는 리스트를** 추가하여 확장할 수 있습니다.

### - del : 요소 제거 1

```python
# 리스트 요소 제거 del

a = ['red', 'green', 'blue', 'black']

del a[0]
a 
>> ['green', 'blue', 'black']
```

**`del 리스트명[자리]`** 를 통해 **원하는 자리의 요소를 제거**합니다.

### - remove : 요소 제거 2

```python
# 리스트 요소 제거 remove
a = ['one', 'two', 'three', 'four']
a.remove('three')

a 
>> ['one', 'two', 'four']
```

**`리스트명.remove(제거할 요소)`**를 통해 **원하는 요소를 제거**합니다.

### - pop : 요소 제거 3

```python
# 리스트 요소 제거 pop

a = ['one', 'two', 'three', 'four']
a.pop(3) 
>> 'fuor'

a
>> ['one', 'two', 'three']
```

**`리스트명.pop(자리)`**를 통해 **제거한 자리의 요소를 리턴해주고** 그다음 **해당 요소를 제거해 줍니다.**

### - sort : 리스트 정렬

```python
# 리스트 정렬 sort

a = [3, 4, 2, 1]
b = ['a', 'c', 'd', 'b']
a.sort()
b.sort()

print(a, b) 
>> [1, 2, 3, 4] ['a', 'b', 'c', 'd']
```

**`리스트명.sort()`**를 통해서 **크기순, 알파벳순**으로 정렬해줍니다.

### - reverse : 리스트 거꾸로 순서 뒤집기

```python
# 리스트 거꾸로 순서 뒤집기 reverse

a = ['토마토', '기러기', '산과산']
a.reverse()

a 
>> ['산과산', '기러기', '토마토']
```

**`리스트명.reverse()`**로 **리스트의 순서를 뒤집습니다.**

### - index : 요소 위치 찾기

```python
# 리스트 요소 찾기 index

a = ['토마토', '기러기', '산과산']
a.index('기러기') 

>> 1
```

**`리스트명.index(찾으려는 요소)`**를 통해 **해당 요소의 위치를 알수있습니다.**

**`이상 python 리스트였습니다! ☠️`**

<br>

---

- **다른 python 기초 보기** : [python basic - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/categories/python-basic)
