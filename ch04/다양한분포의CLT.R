##### 다양한 분포로부터 추출한 표본 평균의 분포 확인(CLT)
windowsFonts(malgun='맑은 고딕')
options(digits=4)
# t-분포 x^2-분포 F-분포
# {2,8,32,64} sample수 => 표본 평균의 분포 확인

# t-분포 평균,표준편차 
#좌우대칭이라 평균은 0 이다.
#표준편차 : sqrt(df/(df-2)) 단, df>2
#분산 


### 기본 셋팅
n = 1000 # 샘플의 개수 n (표본의개수아님)
df = 5 # (자유도)
df2 = 10

### t-분포(쟈유도=5)
t2.mean = rep(NA, n)
t4.mean = rep(NA, n)
t16.mean = rep(NA, n)
t32.mean = rep(NA, n)

for (i in 1:n) {
    t2.mean[i] = mean(rt(2, df=df))
    t4.mean[i] = mean(rt(4, df=df))
    t16.mean[i] = mean(rt(16, df=df))
    t32.mean[i] = mean(rt(32, df=df))
}
c(mean(t2.mean), sd(t2.mean)) 
c(mean(t4.mean), sd(t4.mean)) 
c(mean(t16.mean), sd(t16.mean)) 
c(mean(t32.mean), sd(t32.mean))

# t-분포(자유도=5)의 평균과 표준편차
m = 0 # 평균
s = sqrt(df / (df-2))  # df=5  # 표준편차
c(m,s) # 0.000 1.291

par(mfrow=c(2,2), oma=c(0,0,2,0), family='malgun') # oma 마진같음
hist(t2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(t2.mean), max(t2.mean), length=1000) # 정규분포
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(t4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(t4.mean), max(t4.mean), length=1000) # 정규분포
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')

hist(t16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(t16.mean), max(t16.mean), length=1000) # 정규분포
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')

hist(t32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(t32.mean), max(t32.mean), length=1000) # 정규분포
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('t 표본평균의 분포(자유도=5)', outer=T, cex=1.2)
# 그림 4개 비교해서 볼때 x축의 값이 달라지고 정규분포 x축과의 간격이 달라짐을 확인해라




#x^2-분포 카이제곱분포  평균,표준편차 
#평균 df
#표준편차 sqrt(2df)
#E(X) = r 평균
#분산



# 카이제곱분포 자유도=5
# 위에 기본 셋 가지고 하는것임
chi2.mean = rep(NA, n)
chi4.mean = rep(NA, n)
chi16.mean = rep(NA, n)
chi32.mean = rep(NA, n)
# mean(rchisq(r, df=df))
for (i in 1:n) {
    chi2.mean[i] = mean(rchisq(2, df=df))
    chi4.mean[i] = mean(rchisq(4, df=df))
    chi16.mean[i] = mean(rchisq(16, df=df))
    chi32.mean[i] = mean(rchisq(32, df=df))
}

# 카이제곱 분포 (자유도=5) 의 평균과 표준편차
m = df
s = sqrt(2 * df)

par(mfrow=c(2,2), oma=c(0,0,2,0) ,family='malgun') # oma 마진같음
hist(chi2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(chi2.mean), max(chi2.mean), length=1000) # 정규분포
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(chi4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(chi4.mean), max(chi4.mean), length=1000) # 정규분포
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')


hist(chi16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(chi16.mean), max(chi16.mean), length=1000) # 정규분포
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')


hist(chi32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(chi32.mean), max(chi32.mean), length=1000) # 정규분포
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('카이제곱 표본평균의 분포(자유도=5)', outer=T, cex=1.2)

# 그림 볼때 중심극한정리ㅣ.... 카이라고해도 다르지않다....뭔솔


#F-분포 평균,표준편차
#분자 df1 / 분모 df2 
#평균 df2/df2-2   단, df2>2
#표준편차 복잡함
#분산


### F-분포(자유도1=5, 자유도2=10)
# 위에 기본셋 가지고하는것
f2.mean = rep(NA, n)
f4.mean = rep(NA, n)
f16.mean = rep(NA, n)
f32.mean = rep(NA, n)
for (i in 1:n) {
    f2.mean[i] = mean(rf(2, df1=df, df2=df2))
    f4.mean[i] = mean(rf(4, df1=df, df2=df2))
    f16.mean[i] = mean(rf(16, df1=df, df2=df2))
    f32.mean[i] = mean(rf(32, df1=df, df2=df2))
}

# F 분포(자유도1=5, 자유도2=10)의 평균과 표준편차
m =  df2 / (df2 - 2)
s = sqrt(2 * df2^2 * (df + df2 - 2) / (df * (df2 - 2)^2 * (df2 - 4)))



par(mfrow=c(2,2), oma=c(0,0,2,0), family='malgun') 
hist(f2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(f2.mean), max(f2.mean), length=1000) # 정규분포
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(f4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(f4.mean), max(f4.mean), length=1000) # 정규분포
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')

hist(f16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(f16.mean), max(f16.mean), length=1000) # 정규분포
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')

hist(f32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(f32.mean), max(f32.mean), length=1000) # 정규분포
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('F 표본평균의 분포(자유1도=5,자유도2=10)', outer=T, cex=1.2)

par(mfrow=c(1,1))




#기준
#유의수준 : 0.05 => 신뢰도: 95% 
#채택역 95 %에 들어가면 새로운사실이 발견된게 아님

#기각역이 채택된다면 0.5% 새로운사실이 발견된것

#0.05보다 작은값이 나오면 채택 반대는 기각







