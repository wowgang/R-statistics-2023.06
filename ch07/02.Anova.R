Anova: 그룹 간의 평균 차이가 통계적으로 유의미한지를 평가하는 데에 활용
모집단이 세 개 이상
전체를 검증
귀무가설이 뮤a = 뮤b = 뮤c  a,b,c의 평균이 같다.
귀무가설이 채택이된다면 세개 집단의 평균이 같아지는것이므로 
a=b 같을 확율 95% = 0.95  # 95% 확률 안에서 같다 신뢰수준이 95%
0.95*0.95*0.95 = 0.857375  
알파값은 1-0.857375 = 0.142625  # 유의수준이 증가한다.

가설검정
1. 검정통계량(선생님도 잘 모름)
t,z,f 각각의 확률분포에서 유의수준과 기각력을 찾아서 검정통계량이 그림안에 어디들어오는지
2. p-value 
test만 제대로 하며됨 => t.test

### 일원 분산분석(ANOVA: Analysis of Variance)
ad = read.csv('data/age.data.csv')
head(ad)
tail(ad)
# scale은 지역을 말하는것임 / 지역별 평균나이를 확인해보자
ad$scale = factor(ad$scale)

# 박스플롯 그릴때
g1 = ad[ad$scale == 1,]
g2 = ad[ad$scale == 2,]
g3 = ad[ad$scale == 3,]
boxplot(g1$age, g2$age, g3$age)

# 개선된 방법
boxplot(age ~ scale, data=ad, col=rainbow(3))

# 등분산 검정
# install.packages('lawstat') # 패키티 설치
library(lawstat)
levene.test(ad$age, ad$scale)  #  p-value = 0.7105
# 분산이 같다라는 귀무가설 채택 --> 분산이 같다..?

# Anova 7장48page
ow = lm(age~scale, data=ad) # 앞(age)이 x값 ~ 뒤(scale)가 factor과 같은 구분값
anova(ow) #  p-value = 0.6941
# 평균이 같다라는 귀무가설을 채택 --> 평균이 같다
# 2그룹간(between) / 그룹내within
# scale 은 3개의 그룹이 있으니 df 자유도는 2 / 그룹내 변동 147 (49+49+49)50+50+50에서 각각각 자유도를 빼줘서?

# anova 결과 F-value: 0.366
1 - pf(0.366, 2, 147) # p=value: 0.6941
# pf는 누적확률
