---
excerpt: "python의 break, continue를 알아보자."

categories:
  - python basic

tags:
  - [파이썬]

toc: true
toc_sticky: true

breadcrumb: true

date: 2023-07-27
last_modified_at: 2023-07-27

title: "[python]  break, continue문"
---

<br>

이번엔 **`break, continue`**입니다. 이것도 파이썬의 반복문하면 빼놓을 수 없는 구문입니다!
**`break`**는 무한히 반복되는 **무한루프**에서 나올 수 있게 해줍니다. **`continue`**는 반복하지 않고 **건너뛰게** 해줍니다.

<br>

# 📌 break
---
```python
i = 2

while True:
  print(i,'*',i,'=', i*i)
  i = i + 1 

>> 2 * 2 = 4
>> 3 * 3 = 9
     ...
>> 2494 * 2494 = 6220036
     ...
```

위 코드를 보면 **무한히 실행**되는 것을 볼 수 있습니다. while문을 이용하여 참일경우 반복 진행하는 것이니까요. 여기서 **`break`**를 이용하여 원하는 부분에서 멈추게 할수도 있습니다. 이를 반복문에서 빠져나온다고 해봅시다.

```python
i = 2

while True:
  print(i,'*',i,'=', i*i)
  if i == 4:
    break

  i = i + 1  


>> 2 * 2 = 4
>> 3 * 3 = 9
>> 4 * 4 = 16
```

중간에 **if문**을 이용하여 **`i가 4와 같을 경우 break`**하라고 지정해주었습니다. 결과를 보시면 딱 4일 때 반복문이 멈추는 것을 볼 수 있습니다.
**<U>그렇다면 멈추는 것이 아닌 특정 조건을 건너뛰고 싶으면 어떻게 할까요?</U>**

<br>

# 📌 continue
---

답은 **`continue`**에 있습니다. 코드가 진행되다가 continue를 만나면 **다시 조건식으로 이동하게 됩니다.** 코드로 볼게요.
```python
i = 1

while i < 6:
  i = i + 1

  if i == 4:
    continue

  print(i,'*',i,'=', i*i) 

>> 2 * 2 = 4
>> 3 * 3 = 9
>> 5 * 5 = 25
>> 6 * 6 = 36
```

결과를 보시면 4*4는 존재하지 않습니다. 코드를 하나씩 살펴보면, i는 1로 시작하고 6미만일 경우 반복한다. i에 1을 더해준다 **`단! i가 4와 같을 경우 continue로 다시 조건식으로 돌다간다.`** 외에는 print한다.
생각보다 쉽습니다.


더 어릴때 공부할 시기에는 break, continue가 이해되지 않았는데 역시 사람은 공부를 해야하나봅니다.. 지금 보니까 너무나 간단하네요.

**`이상 python break, continue 이었습니다! ☠️`**

<br>

---

- **다른 python 기초 보기** : [python basic - 데이터를 파고파는 사람 ⛏️](https://novicedata.github.io/categories/python-basic)
