#평균이다 귀무가설 채택
#평균이 아니다 귀무가설 기각이므로 대립가설 채택
# 유의확률이 유의수준보다 작으면 (일반적으로 0.05보다 작다면)
#귀무가설이 기각됐다는 것은 유의확률이 유의수준보다 작아서 통계적으로 유의미한 결과를 얻었다는 것을
#유의확률이 유의수준보다 작을 때, 우리는 귀무가설을 기각하고 대립가설을 받아



##### 단일 모집단의 가설 검정


### 단일 모집단의 평균 검정(1-sample T test)
df = read.table('data/babyboom.dat.txt' ,header=F)
names(df) = c('time', 'gender', 'weight', 'minutes')
head(df)
girl_baby = subset(df, gender==1)  # df[df$gender == 1,]
weight = girl_baby[[3]]
weight

# 검정 통계량(t) 계산
barx = mean(weight)
s = sd(weight)
n = length(weight)
mu0 = 2800
t = (barx - mu0) / (s / sqrt(n)) # 검정 통계량 식 외우기... z분포 x-뮤/ 시그마 , (x-뮤)/ (시그마/sqrt(n))
t # 2.233188

# 임계값과 유의확률
alpha = 0.05
upper.limit = qt(1 - alpha, df=n-1)
upper.limit

# 판정
if (t > upper.limit) {
    print('귀무가설 기각')
    print('여자 신생아의 체중이 2800보다 크다')
} else {
    print('귀무가설 채택')
    print('여자 신생아의 체중이 2800보다 크지 않다')
}

# ====================================================
p.value = 1 - pt(t, df=n-1)
p.value

# 판정
if (p.value > alpha) {
    print('귀무가설 기각')
    print('여자 신생아의 체중이 2800보다 크다')
} else {
    print('귀무가설 채택')
    print('여자 신생아의 체중이 2800보다 크지 않다')
}



# R로 판정
t.test(weight, mu=2800, alternative='greater')  # 양쪽검정    alternative: 하나를 택해야 할
# p-value가 0.02가 나왔으므로 귀무가설 기각
# 나는 0.01963나옴 쌤은 딱 0.02

##############################################
# 정규성 검정 - 표본이 정규성을 가져야 1-sample T test를 할 수 있음.
#############################################
shapiro.test(weight)
# weight는 정규성을 띄지 않는 자료이다. 0.02라서
# q-value가 0.05 이상이어야 정규성을 가진다고 볼 수 있음
# weight 경우는 p-value가 0.02 이므로 정규성을 가진다고 볼 수 없다.
# 이런 경우에는 비모수 검정등 고급 통계에서 다루는 방법을 사용해야 한다.


qqnorm(weight) # 그림.. Q-Q plot  대각선 라인에 있으면 정규성을 띈다고 말함
qqline(weight)
# 이그림은 대각선을 벗어난 데이터들이 보여서 정규성을 띄지 않는다고.....
# 데이터가 직선 근처에 있으면 정규성을 가진다고 볼 수 있음


# 표본의 개수가 30을 넘으면 정규성테스트를 하지않는다 정규성을 갖는다고 말함..


# 정규성을 갖는 데이터 예
#x <- c(25,16,44,82,36,58,18)
x <- c(25,16,44,82,36,58,63,18) # 더 정규성을 갖는 그림 (직선에 더 가까움)
shapiro.test(x)     # p-value: 0.5
qqnorm(x)
qqline(x, col='red')


### 단일 모비율의 검정
bb = read.table('data/restitution.txt', header=T)
head(bb)
rel = ifelse(bb$rst < 0.4134 | bb$rst > 0.4374, 1, 0)


# 검정 통계량 계산
n = length(rel)
nos = sum(rel)  # 불량의 개수
nos # 11
phat = nos / n 
p0 = 0.1
z = (phat - p0) / sqrt(p0 * (1-p0) / n)
z # 0.3333333

# 임계값과 유의 확률
alpha = 0.05
upper.limit = qnorm(1 - alpha)
upper.limit # 1.644854
p.value = 1 - pnorm(z)
p.value # 0.3694413
c(upper.limit, p.value)

# 검정통계량 z 가 upper limit 보다 작으므로 귀무가설 채택
# 유의확률 p-value가 0.05 보다 크므로 귀무가설 채택

# R: prop.test
prop.test(nos, n, p=0.1, alternative='greater', correct=F)


# 도표 출력 : 그림 6-9
par(mar=c(0,1,1,1))
x <- seq(-3, 3, by=0.001)
y <- dnorm(x)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.4), 
     main="", xlab="z", ylab="")
abline(h=0)

polygon(c(upper.limit, x[x>upper.limit], 3), c(0, y[x>upper.limit], 0), col=2)
text(upper.limit, -0.02, expression(z[0.05]==1.645))

polygon(c(z, x[x>z], 3), c(0, y[x>z], 0), density=20, angle=45)
text(z, -0.02, paste("z=", round(z, 3)))
text(1.2, 0.3, paste("P(Z>z)=", round(p.value, 3)), cex=0.8)

