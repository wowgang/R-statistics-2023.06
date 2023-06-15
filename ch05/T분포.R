##### T 분포
x = seq(-3, 3, by=0.01)
y = dnorm(x)    # 표준정규분포
t1 = dt(x, df=1) # 자유도가 1인 T분포
t2 = dt(x, df=2)
t8 = dt(x, df=8)
t30 = dt(x, df=30)

plot(x, y, type='l', lty=1, axes=F, xlab='x', ylab='', col='red')
axis(1)
lines(x, t1, lty=4, col='black')
lines(x, t2, lty=3, col='magenta')
lines(x, t8, lty=2, col='blue')
lines(x, t30, lty=6, col='green')
legend('topright', paste('df :', c(1,2,8,30)), lty=c(4,3,2,6),
       col=c('black', 'magenta', 'blue', 'green'), cex=0.7)
