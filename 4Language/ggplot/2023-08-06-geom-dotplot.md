---
excerpt: "ggplot2의 geom_dotplot 옵션을 알아보자"

categories:
  - ggplot2

tags:
  - [geom]

toc: true
toc_sticky: true

date: 2023-08-06
last_modified_at: 2023-08-06

title: "[ggplot2] geom_dotplot() 코드 옵션"
---

<br>

# 📌 geom_dotplot()
---

이번엔 **`geom_dotplot()`**입니다. 간단한게 바형 그래프, 히스토그램과 같은 형태인데 직사각형의 바가 아닌 점들을 쌓은거라고 생각하면 됩니다.

```r
ggplot(airquality, aes(x = Temp)) +
  geom_dotplot()
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/30417e8f-aa7d-4e69-8eee-cb8f1a681366){: .align-center}

## ◾ 추가 시각 효과

추가적인 시각효과(**색, 투명도, 제목 등**)는 대부분 포스팅 해놨습니다. 아래 링크에서 확인하시고 적용해보겠습니다.

- [그래프 기본 시각화 설정 - 데이터를 파고파기 ⛏️](https://novicedata.github.io/tags/#%EA%B7%B8%EB%9E%98%ED%94%84-%EA%B8%B0%EB%B3%B8-%EC%8B%9C%EA%B0%81%ED%99%94-%EC%84%A4%EC%A0%95)
  
```r
ggplot(airquality, aes(x = Temp)) +
  geom_dotplot(fill = 'skyblue') +
  theme_light() +
  labs(title = 'geom_dotplot()') +
  scale_x_continuous(breaks = c(seq(55,100, by=5)))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/6937d387-315c-4358-8481-6d8e0193e0ec){: .align-center}

- **`fill = 'skyblue'`** : 점의 색을 스카이블루로
- **`theme_light()`** : 그래프의 배경을 light버전으로
- **`labs(title = 'geom_dotplot()')`** : 그래프 제목 설정
- **`scale_x_continuous(breaks = c(seq(55,100, by=5)))`** : x축의 단위를 55부터 100까지 5차이마다
  

<br>

## ◾ binwidth = : 점 크기 변경

해당 명령을 입력하면 점 크기를 변경해줍니다. 아직 자세히는 모르겠지만? 그냥 디폴트 값으로 설정해놓는게 좋아보입니다.

### **binwidth = 1 일때**

```r
ggplot(airquality, aes(x = Temp)) +
  geom_dotplot(fill = 'skyblue', binwidth = 1) +
  theme_light() +
  labs(title = 'geom_dotplot()') +
  scale_x_continuous(breaks = c(seq(55,100, by=5)))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/de86a192-97eb-4695-bb20-be77bb6d3c05){: .align-center}

### **binwidth = 3 일때**

```r
ggplot(airquality, aes(x = Temp)) +
  geom_dotplot(fill = 'skyblue', binwidth = 3) +
  theme_light() +
  labs(title = 'geom_dotplot()') +
  scale_x_continuous(breaks = c(seq(55,100, by=5)))
```

![image](https://github.com/novicedata/colab_practice/assets/88019539/94bb35cf-7657-46b0-b78f-1e3899c7e270){: .align-center}

네.. 이렇게요..

---

- **더 많은 geom 종류 보기** : [geom tag - 데이터를 파고파기 ⛏️](https://novicedata.github.io/tags/#geom)
