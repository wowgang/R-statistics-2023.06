##### 가설검정
#‘만7세 남자 어린이의 키의 평균이 1220mm’라는 기존에 알려진
# 모수의 상태를 현재에도 받아들일 수 있는지 알아봅시다.

smp = c(1196, 1340 ,1232, 1184, 1295,
        1247, 1201, 1182, 1192, 1287,
        1159, 1160, 1243, 1264, 1276)
smp2 = c(1396, 1340 ,1232, 1284, 1295,
        1247, 1201, 1182, 1392, 1287,
        1359, 1260, 1343, 1264, 1276)
xbar = mean(smp)
s = sd(smp)
c(xbar, s)
n = length(smp) # 15
mu.zero = 1220

### 1. 가설수립
# H0: 만 7세 남자 어린이의 키의 평균은 1220mm 이다. (귀무가설)
# H1: 만 7세 남자 어린이의 키의 평균은 1220mm 가 아니다. (대립가설)

### 2. 검정통계량 계산
t = (xbar - mu.zero) / (s / sqrt(n))
t # 0.7528774

### 3. 기각역, 채탹역 계산
# 유의수준 alpha = 0.05
alpha = 0.05
ll = qt(alpha / 2, df=n-1)
ul = -ll
c(ll, ul) #  -2.144787  2.144787

### 4. 판정
if (t > ll && t < ul) {
    print('귀무가설 채택')
    print('만 7세 남자 어린이의 키의 평균은 1220mm 이다.')
} else {
    print('귀무가설 기각 또는 대립가설 채택')
    print('만 7세 남자 어린이의 키의 평균은 1220mm 가 아니다.')
}

### R의 t-test 함수 이용
t.test(smp, mu=1220) # p-value: 0.5, p-value가 0.05보다 크므로 귀무가설 채택
# p-value: 0.5 > 0.05 = 귀무가설 채택
t.test(smp2, mu=1220) # p-value: 0.004 가 0.05보다 작으므로 귀무가설 기각 
# p-value: 0.004 < 0.05 = 귀무가설 기각

qt(1-alpha, df=14) # 1.76131 90% alpha 0.05
qt(0.005, df=14) # -2.976843 99%
