---
excerpt: "python의 dictionary를 알아보자."

categories:
  - python basic

tags:
  - [파이썬]

toc: true
toc_sticky: true

date: 2023-08-05
last_modified_at: 2023-08-05

title: "[python] 딕셔너리 타입"
---

<br>

오늘은 파이썬의 **딕셔러니** 타입에 관해서 볼겁니다!

<br>

# 📌 Dictionary type

---

앞서 튜플, 리스트 등은 순서를 이용해서 인덱싱해왔습니다. 예를들어 **list[0]** 등의 명령어를 입력하여 list의 첫 번째 요소에 가곤 했죠. 편하도록**`key`를 만들어 각 요소에 편하게 접근하도록 만드는것이 바로 딕셔너리 타입입니다.**

- **Dictionary naem = {element1, element2, element3, ...}**
- **element = key : value**
  
를 통해 만들어줍니다. 쉽게 볼게요. 예를 들어 우리가 게임의 몬스터를 하나 만든다 해봅시다. 몬스터에 **체력, 공격력, 스피드, 마나** 등이 있겠죠? 이를 딕셔너리형으로 만들어 봅시다.

```python
# 딕셔너리형 몬스터 만들기

monster1 = {'hp' : 500, 'power' : 23, 'speed' : 2.5, 'mana' : 50}
monster1 

>> {'hp': 500, 'power': 23, 'speed': 2.5, 'mana': 50}
```

이렇게 딕셔너리형으로 지정해 놓으니 보기 편하죠? 직관적으로 체력이 몇이구나, 마나가 몇이구나 볼 수가 있는겁니다.

<br>

## ◾ 딕셔너리 인덱싱

인덱싱에는 두가지 방법이 있습니다.**첫 번째는 똑같이 `딕셔너리명['요소']`를 이용하는 방법, 두 번째는 `딕셔너리명.get('요소')`함수를 이용하는 방법입니다.**

```python
# 딕셔너리 인덱싱 1
monster1['hp']
>> 500

# 딕셔너리 인덱싱 2 
monster1.get('hp')
>> 500
```

## ◾ 요소 추가하기, 변경하기, 제거하기

- 요소 추가 : **`리스트명['추가할 요소 key'] = 추가할 요소 value`**
- 요소 변경 : **`리스트명['변경할 요소 key'] = 변경항 요소 value`**
- 요소 제거 : **`del 리스트명['제거할 요소 key']`**
  

```python
# 딕셔너리 만들기
score = {'수학' : 90, '국어' : 100, '사회' : 78}

# 요소 추가
score['영어'] = 65
score 
>> {'수학': 90, '국어': 100, '사회': 78, '영어': 65}

# 요소 변경
score['수학'] = 10
score 
>> {'수학': 10, '국어': 100, '사회': 78, '영어': 65}

# 요소 제거
del score['국어']
score 
>> {'수학': 10, '사회': 78, '영어': 65}
```

**`이상 python 딕셔너리였습니다! ☠️`**

---

**다른 python 기초 보기** : [Python basic - 데이터를 파고파기 ⛏️](https://novicedata.github.io/categories/#python-basic)
