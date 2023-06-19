# 기초통계 문제 2~8page까지 풀어보기
########## 1.이항분포
# 1. 다음의 문제가 베르누이 시행인지 판단하시오. #### 2,4번
1) 영화관에서 줄을 기다리는 시간을 측정한다.
2) 전화가 왔을 때, 전화를 한 사람이 여자인지를 측정한다.
3) 주사위를 한 번 던졌을 때, 나오는 숫자를 체크한다.
4) 주사위를 한 번 던졌을 때, 숫자 2가 나오는지를 체크한다.

# 2. 한 축구 선수가 페널티킥을 차면 5번 중 4번을 성공한다고 한다.
#이 선수가 10번의 페널티킥을 차서 7번 성공할 확률을 구하시오.
P(X = k) = C(n, k) * p^k * (1-p)^(n-k)

X: 성공 횟수
k: 특정 성공 횟수 (7번)
n: 시행 횟수 (10번)
p: 성공 확률 (0.8)
C(n, k): 조합(n choose k)으로, n개 중에서 k개를 선택하는 경우의 수를 나타냅니다.

P(X = 7) = C(10, 7) * (0.8)^7 * (1-0.8)^(10-7)
4/5 
n <- 10
k <- 7
p <- 0.8
prob <- choose(n, k) * p^k * (1 - p)^(n - k)
prob ####  0.2013266

# 확률 질량함수 nCx p^x (1-p)^(n-x)
dbinom(k, n, p) 
성공 횟수가 k일 때 이항 분포의 확률 질량 값을 반환
성공 횟수(k), 시행 횟수(n), 성공 확률(p)

10C7 0.8^7 0.2^3

# 3. A라는 회사는 스마트폰의 한 부품을 만드는 회사로, 이 A사의 불량률은 5%로 알려져 있다.
#이 회사의 제품 20개를 조사했을 때, 불량이 2개 이하로 나올 확률을 구하시오.
성공 확률(p)은 0.05이고, 시행 횟수(n)는 20
불량이 2개 이하로 나올 확률을 구하기 위해 이항 분포의 누적 분포 함수인 pbinom 함수를 사용
이 함수는 특정 값보다 작거나 같은 누적 확률을 계산

# 이항 분포 누적 확률 계산
n <- 20
k <- 2
p <- 0.05
prob <- pbinom(k, n, p)
prob 
#### 0.9245163
pbinom(2, n, p)     

# 4. 어떤 희귀 바이러스에 감염되었을 때, 회복할 수 있는 치료율은 20%라고 한다. 이
#바이러스에 감염된 환자 20명을 치료했을 때, 적어도 2명 이상은 회복될 확률을 구하시오.
n = 20
k = 2
p = 0.2
이항 분포의 확률 질량 함수인 pbinom 함수를 사용
이 함수는 특정 값보다 작거나 같은 누적 확률을 계산
따라서 1에서 누적 확률을 뺀 값을 계산하여 적어도 2명 이상 회복될 확률을 구할 수 있다.

1-pbinom(k,n,p)
1-pbinom(1,20,0.2) ############이게 답?

####  0.7939153

# 5. 주사위 두 개를 던졌을 때, 눈금의 합이 6이 될 확률을 구하시오.  
33 42 24 15 51 
5/36 ####  0.1388889 약 13.89%

#===========================================================================
########## 2. 정규 분포
# 1. A라는 전구회사에서 생산하는 전구의 수명은 800일이고 표준편차는 40일인 정규분포를
#따른다고 한다. 이때 전구의 수명이 750일 이하일 확률을 구하시오
(750 - 800) / 40
Z = (750 - 800) / 40 # -1.25
Z <- -1.25
P <- pnorm(Z)
P # 0.1056498

mu = 800
sigma = 40

prob = pnorm(750, 800, 40) 
prob # 0.1056498
1-0.1056498 # 0.8943502
print(paste('전구의 수명이 750일 이하일 확률', 1-prob, '입니다.'))


# 2. 어느 한 회사에 다니는 종업원들의 근무기간을 조사하였더니, 평균은 11년이고 분산이
#16년인 정규분포를 따른다고 한다. 
# 1) 20년 이상 근무한 종업원의 비율을 구하시오. ##### 0.01222447
qnorm(0.9, 11, 4)
# 2) 근무연수가 가장 오래된 10%의 종업원은 이 회사에서 몇 년 이상 근무했다고 볼 수 있는가? 5.873794

Z = (X - μ) / σ
Z = (20 - 11) / 4 
Z
1 - pnorm(Z) ##### 0.01222447
prob = pnorm(20, 11, 4)
1- prob ##### 0.01222447

sqrt(16)
mu = 11
sigma = 4

# 정규분포의 하위 10% 지점 계산
qnorm(0.1,mu,sigma) #### 5.873794


# 3. 어느 고등학교 3학년 학생들의 수학성적은 평균이 70이고 표준편차가 8인 정규분포를
#따른다고 한다. 이때 점수가 80점 이상이고 90점 이하인 학생의 비율을 구하시오.
mean = 70
std = 8

pnorm(90, 70, 8) - pnorm(80, 70, 8)

# 4. 확률변수 X가 평균이 1.5, 표준편차가 2인 정규분포를 따를 때, 실수 전체의 집합에서
#정의된 함수 H(t)는 H(t) = P(t ≤ X ≤ t+1) 이다.
#H(0) + H(2)의 값을 구하시오
mean = 1.5
std = 2

h0 = pnorm(1,mean=mean,sd=std) - pnorm(0, mean=mean, sd=std)
h2 = pnorm(3,mean,std) - pnorm(2, mean, std)
h0 + h2 ##### 0.3493326

정규분포에서 함수 H(t)는 P(t ≤ X ≤ t+1)로 정의되며, 
확률변수 X는 평균이 1.5이고 표준편차가 2인 정규분포를 따른다고 가정합니다.

H(0) + H(2)의 값을 구하기 위해서는 먼저 각 H(t)를 계산해야 합니다.

H(0) = P(0 ≤ X ≤ 1)
H(2) = P(2 ≤ X ≤ 3)

이를 위해 R의 pnorm() 함수를 사용하여 각 확률을 계산할 수 있습니다.



########## 3. 1-Sample T 테스트

# 1. A회사의 건전지의 수명시간이 1000시간 일 때, 무작위로 뽑은 10개의 건전지에 대한
#수명은 다음과 같다. 
#980, 1008, 968, 1032, 1012, 996, 1021, 1002, 996, 1017
#샘플이 모집단과 같다고 할 수 있는가?
샘플의 평균과 모집단의 평균을 비교
sample <- c(980, 1008, 968, 1032, 1012, 996, 1021, 1002, 996, 1017)
sample_mean <- mean(sample)
sample_mean # 1003.2
population_mean <- 1000
population_mean 

shapiro.test(sample) #  p-value = 0.9382
qqnorm(sample)
qqline(sample)
t.test(sample, mu=1000) #  p-value = 0.611

if (sample_mean == population_mean) {
    cat("샘플은 모집단과 같다고 할 수 있다.")
} else {
    cat("샘플은 모집단과 같지 않다고 할 수 있다. ")
}

# 2. 어떤 반의 학생들의 수학 평균성적은 55점이었다. 0교시 수업을 시행하고 나서 학생들의
#시험 성적은 다음과 같다.
#58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
#0교시 수업을 시행한 후, 학생들의 성적은 올랐다고 할 수 있는가?
avg = 55
aavg = c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)
avg2 = mean(aavg)
if (avg2 > avg) {
    cat(avg2,"성적오름")
} else if (avg2 < avg){
    cat(avg2,"성적떨어짐")
} else {
    cat(avg2,"이전과 동일")
}

shapiro.test(aavg) # p-value = 0.1058
t.test(aavg, mu=55, alternative='greater') # p-value = 0.4046
귀무가설 채택 변화없음

# 3. 2006년 조사에 의하면 한국인의 1인 1일 평균 알코올 섭취량이 8.1g 이다. 
#2008년 무작위로 뽑은 알코올 섭취량은 다음과 같다.
#15.50, 11.21, 12.67, 8.87, 12.15, 9.88, 2.06, 14.50, 0, 4.97
#평균 알코올 섭취량이 달라졌다고 할 수 있는가?
meanac = 8.1
cmeanac = mean(c(15.50, 11.21, 12.67, 8.87, 12.15, 9.88, 2.06, 14.50, 0, 4.97))
cmeanac # 9.181 로 올라감



########## 4. 2-Sample T 테스트


# 1. mtcars 데이터셋에서 자동차 기어 종류(am: 오토/수동)에 따른 mpg의 차이가
#통계적으로 유의한지 t-test를 통해 확인해 보시오.

head(mtcars)
str(mtcars)
table(mtcars$am) # 0(수동) - 19개 , 1(자동) - 13
t.test(mpg ~ am, data=mtcars) # p-value = 0.001374 유의수준이하 귀무가설 기각

mtcars.tab = table(mtcars$mpg, mtcars$am)
mtcars.tab
# mtcars 데이터셋 로드
data(mtcars)

### 이분산 t-검정
t.test(mpg ~ am, data = mtcars, alternative = "two.sided", var.equal = TRUE)
# p-value: 0.000285 ==> 귀무가설 기각, 차이가 있다

### 오토(am=0)와 수동(am=1) 기어 종류에 따른 연비(mpg) 그룹화
mpg_auto <- mtcars$mpg[mtcars$am == 0]
mpg_manual <- mtcars$mpg[mtcars$am == 1]

# t-test 수행
result <- t.test(mpg_auto, mpg_manual)

# 결과 출력
print(result)
# p-value: 0.000285 ==> 귀무가설 기각, 차이가 있다


# 2. MASS 패키지에 내장된 Cars93 데이터프레임에 대해서 생산국(Origin)이
#USA vs. non-USA 2개의 group 에 대해서 차 가격(Price)의 평균이 차이가 있는지를
#검정해보시오.

Cars93 데이터프레임에서 생산국(Origin)이 USA와 non-USA 두 개의 그룹으로 나누어 
차 가격(Price)의 평균이 차이가 있는지를 검정하기 위해 
t-검정(t-test)을 사용할 수 있습니다.


먼저, MASS 패키지를 로드한 후 Cars93 데이터셋을 불러옵니다. 
그리고 USA와 non-USA로 그룹을 나누고, 각 그룹의 차 가격(Price)에 대한 평균을 비교합니다.

# MASS 패키지 로드
library(MASS)

# Cars93 데이터셋 로드
data(Cars93)

# USA 그룹과 non-USA 그룹으로 데이터 나누기
price_usa <- Cars93$Price[Cars93$Origin == "USA"]
price_non_usa <- Cars93$Price[Cars93$Origin != "USA"]

# t-검정 수행
result <- t.test(price_usa, price_non_usa)

# 결과 출력
print(result)
# p-value = 0.3428


# 3. mpg 데이터셋에서 다음을 검정해 보시오.
#1) subcompact 자동차와 midsize 자동차의 고속도로 연비
#2) 일반 휘발유(r)와 고급 휘발유(p)의 도시 연비
#3) subcompact 자동차의 전륜구동(f)이냐 후륜구동(r)이냐에 따른 도시 연비

subcompact 자동차와 midsize 자동차의 고속도로 연비: 두 그룹 간의 고속도로 연비의 차이를 검정하기 위해 독립표본 t-검정을 사용할 수 있습니다.
# mpg 데이터셋 로드
data(mpg)

# subcompact 자동차와 midsize 자동차의 고속도로 연비 추출
subcompact_mpg <- mpg$highway[mpg$class == "subcompact"]
midsize_mpg <- mpg$highway[mpg$class == "midsize"]

# 독립표본 t-검정 수행
result1 <- t.test(subcompact_mpg, midsize_mpg)

# 결과 출력
print(result1)


일반 휘발유(r)와 고급 휘발유(p)의 도시 연비: 두 그룹 간의 도시 연비의 차이를 검정하기 위해 독립표본 t-검정을 사용할 수 있습니다.
# 일반 휘발유(r)와 고급 휘발유(p)의 도시 연비 추출
regular_mpg <- mpg$city[mpg$fl == "r"]
premium_mpg <- mpg$city[mpg$fl == "p"]

# 독립표본 t-검정 수행
result2 <- t.test(regular_mpg, premium_mpg)

# 결과 출력
print(result2)


subcompact 자동차의 전륜구동(f)이냐 후륜구동(r)이냐에 따른 도시 연비: 두 그룹 간의 도시 연비의 차이를 검정하기 위해 독립표본 t-검정을 사용할 수 있습니다.
# subcompact 자동차의 전륜구동(f)와 후륜구동(r)에 따른 도시 연비 추출
front_drive_mpg <- mpg$city[mpg$class == "subcompact" & mpg$drv == "f"]
rear_drive_mpg <- mpg$city[mpg$class == "subcompact" & mpg$drv == "r"]

# 독립표본 t-검정 수행
result3 <- t.test(front_drive_mpg, rear_drive_mpg)

# 결과 출력
print(result3)



########## 5. Paired sample T 테스트
1. 새로운 당뇨병 치료제를 개발한 제약사에서는 치료에 지대한 영향을 주는 외부요인을
통제하기 위해 10명의 당뇨병 환자를 선별하여 1달 동안 '위약(placebo)'을 투여한 기간의
혈당 수치(Xi)와 '신약(new medicine)'을 투여한 1달 기간 동안의 혈당 수치(Yi)를
측정하여 짝을 이루어 혈당 차이를 유의수준 5%에서 비교하시오.

