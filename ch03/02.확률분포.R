# 베르누이 시행(동시에 일어날수없는사건/독립적인 사건)
# n은 시행횟수 p는 각 시행에서 성공할 확률
# 𝐵(𝑛, 𝑝) : 확률변수 X가 이항분포를 따를 때 𝑋 ~ 𝐵(𝑛, 𝑝)
# 기대값 E(X) np
# 분산은 npq (q=1-p)  np(1-p)


# Q.확률변수 X가 시행의 횟수가 6이고 성공의 확률이 1/3인 이항분포를 따를 때 
#R이 내장하고 있는 이항분포와 관련된 함수를 이용하여 각종 확률을 계산해 봅시다.

#### 확률분포
### 이항분포 binomial distribution
n = 6
p = 1/3
x = 0:n     # B(6, 1/3)

# 확률 질량함수 nCx p^x (1-p)^(n-x)
# nCx p^x (1-p)^(6-x)
dbinom(2, n, p)     # 6C2 (1/3)^2 (1-(1/3))^(6-2) => 0.3292181
dbinom(x=4, size=n, prob=p)
# x : 이항분포의 성공의 횟수의 벡터(원소 1개짜리 포함)
# size : 시행의 횟수
# prob : 성공의 확률
px = dbinom(x, n, p)
px # 0.087791495 0.263374486 0.329218107 0.219478738 0.082304527 0.016460905 0.001371742
plot(x, px, type='s', xlab='성공 횟수', ylab='확률(P[X=x])', main='B(6, 1/3)')
plot(x, px, type='h', xlab='성공 횟수', ylab='확률(P[X=x])', main='B(6, 1/3)',
     lwd=20, col='red')

# 누적 분포함수
pbinom(2, n, p)     # dbinom(0,n,p) + dbinom(1,n,p) + dbinom(2,n,p)  0.6803841
# 성공횟수가 1~3 인 확률
dbinom(1,n,p) + dbinom(2,n,p) + dbinom(3,n,p) # 0.8120713
pbinom(3,n,p) - pbinom(0,n,p)   # 0.8120713

# 분위 q에 해당하는 값을 찾아주는 함수
# 누적확률 값이 p가 될 때의 x값을 찾아주는 함수
# x값이 0.1일때  그래프봐바라 x축이 1일때 0.1을 넘으니까.......
qbinom(p=0.1, n, p)   # 1
qbinom(p=0.5, n, p)   # 2

# 이항분포를 따르는 모집단으로부터 n개의 표본 추출
rbinom(10, n, p) # random값

set.seed(2023) # seed값으로 random값 고정
rbinom(10, n, p)

# 기대값과 분산
n = 6
p = 1/3
x = 0:n     # B(6, 1/3)
px = dbinom(x, n, p)
ex = sum(x * px)    # Expectation value 기대값 2
ex
# 분산을 구하기위해 제곱
ex2 = sum(x^2 * px)
ex2
varx = ex2 - ex^2   # Variation 변동
varx

### 정규분포
# 어느 대학교 남학생 키의 평균은 170cm, 표준편차는 6인 정규분포를 따른다.
# 180cm보다 큰 학생의 확률은?
options(digits=4) # 소소점 4자리 표시
mu = 170
sigma = 6   # 여기서 시그마는 표준편차인가
ll = mu - 3 * sigma     # lower limit
ul = mu + 3 * sigma     # upper limit
x = seq(ll, ul, by=0.01)
px = dnorm(x, mean=mu, sd=sigma)
plot(x, px, type='l', xlab='남학생의 키(x)', ylab='P[X=x]',
     lwd=2, col='green', main='N(170, 6^2)')
# 절대로 0에 닿지 않음

prob = pnorm(180, 170, 6) # 0.9522
print(paste('180cm보다 큰 학생의 확률은', 1-prob, '입니다.'))

# 상위 10%에 속하려면 키가 얼마이어야 하는가?
height = qnorm(0.9, 170, 6)     # 177.7
height

# 키가 165cm ~ 175cm일 확률
pnorm(175, 170, 6) - pnorm(165, 170, 6) # 0.5953

# 95% 에 속하는 학생들의 키 범위는?
# q(0.025) q(0.975)
ll = qnorm(0.025, 170, 6)
ul = qnorm(0.975, 170, 6)
print(paste(ll, '~', ul, '(cm)'))   # 158.24021609276 ~ 181.75978390724 (cm)

# 400개의 난수를 생성하여 모집단과 비교
set.seed(2023)
smp = rnorm(200, 170, 6) # mean=170, sd=6
print(paste(mean(smp), sd(smp)))
hist(smp, prob=T, main='N(170, 6^2)으로부터 추출한 표본의 분포(n=400',
     xlab='', ylab='', col='white', border='black')
lines(x, px, lty=2, col='red') # x,px 위에 값 있음.
# lty는 점선 

## 정규분포의 특징
mu = 0
sigma = 1
# p0.05 = qnorm(0.05)     # qnorm(0.95) 와 부호가 반대인 값 -1.645
p0.05 = qnorm(0.95)     # qnorm(0.05) 와 부호가 반대인 값 1.645
p0.05   # 90% 신뢰수준 1.645
p0.025 = qnorm(0.975)
p0.025  # 95% 신뢰수준 1.96

pnorm(1.96) - pnorm(-1.96) # 0.95
qnorm(0.995) # 99% 신뢰수준 2.576  얘는 Q놈 신뢰수준은 큐놈
pnorm(2.576) - pnorm(-2.576) # 0.99

# 95% 신뢰구간
z <- seq(-3, 3, by=0.001)
z.p <- dnorm(z)
plot(z, z.p, axes=F, type="l", 
     main="표준정규분포 (95%)", ylab="", ylim=c(-0.04, 0.4))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.96, -0.02, pch=17, col="red")
text(-1.96, -0.035, "-1.96", col="red")
points(1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col="red")

s <- seq(-1.96, 1.96, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)


# 90% 신뢰구간
qnorm(0.9) # 1.282
pnorm(1.282) - pnorm(-1.282)
