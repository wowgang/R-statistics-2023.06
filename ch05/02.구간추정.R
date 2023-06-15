##### 구간 추천
### 모평균에 대한 구간 추청, 모집단의 표준 편차를 알고 있을대
set.seed(9)
n = 10
x = 1:100
y = seq(-3, 3, by=0.01)

# 표본의 크기: 10 = > 모집단의 평균 구간추청
# N(0,1) 1: 모집단의 표준편차

smps = matrix(rnorm(n * length(x)), ncol=n)
head(smps)
xbar = apply(smps, 1, mean) # apply는 
xbar
length(xbar) # 100개
se = 1 / sqrt(n)    # 모집단의 표준편차가 1
alpha = 0.05    # 유의 수준
z = qnorm(1 - alpha/2)

#모집단의 표준편차를 모를때 qt를해야한다고하는데 모르겠다
#s/sqrt(n) t분포를 따르면 모양이 납작해짐
#-1.96,1.96이라고하면 z를 구할수없

ll = xbar - z * se
ul =  xbar + z * se

plot(y, type='n', xlab='표본추출', ylab='z',
     xlim=c(1,100), ylim=c(-1.5, 1.5), cex.lab=1.8)
abline(h=0, col='red', lwd=2, lty=2)
line.col = rep(NA, 100)
line.col = ifelse(ll * ul > 0, 'red', 'black')
arrows(1:length(x), ll, 1:length(x), ul, code=3,
       angle=90, length=0.02, col=line.col, lwd=1.5)

##### 모분산을 모를때 모평균에 대한 95% 신뢰구간
smp = c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)
len = length(smp)
xbar = mean(smp)
s = sd(smp)
t = qt(1 - 0.05/2, df=len-1)  # alpha 0.05 df=자유도
ll = xbar - t * s / sqrt(len)
ul = xbar + t * s / sqrt(len)
print(paste('신뢰수준:', '95%'))
print(paste('하한:', round(ll,4)))
print(paste('평균:', round(xbar, 4)))
print(paste('상한:', round(ul,4)))
