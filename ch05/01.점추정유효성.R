# 모수는 모집단의 특성(모평균,모분산 등..)을 나타내는 값
##### 추정
### 유효성
options(dgits=4)
set.seed(1)

# 우효성 모의 실험
# Y2bar의 기대값을 구하기 위한 함수
mean.seq = function(x) {
 n = length(x)   
 sum = 0
 n2 = 0
 for (i in 1:n) {
     newx = i * x[i]
     sum = sum + newx
     n2 = n2 + i
 }
 return (sum / n2)
}

y1 = rep(NA, 1000)
y2 = rep(NA, 1000)
for (i in 1:1000) {
    smp = rnorm(3) # 표준정규분포에서 3개의 표본을 끄집어냄
    y1[i] = mean(smp) # 3개의 평균을 끄집어냄
    y2[i] = mean.seq(smp) # 유효성 추정량
}
mean(y1) # -0.0042 # 평균이 0에 가깝다
mean(y2) # -0.01132
sd(y1) # 0.6000368      # sd(y2)보다 작으므로 더 좋운 추정량
sd(y2) # 0.6535071

par(mfrow=c(1,2))
hist(y1, probability = T, xlim=c(-2,2), ylim=c(0,0.65),
     main=('(x1=x2=x3)/3'), col='orange', border='red')
hist(y2, probability=T, xlim=c(-2,2), ylim=c(0,0.65),
     main=('(x1=x2=x3)/6'), col='orange', border='red')
par(mfrow=c(1,1))

