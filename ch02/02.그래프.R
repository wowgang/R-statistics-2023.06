# 산점도
head(cars)
# jitter 한점에 여러개의 데이터가 쌓이는 모습을 보여주는것
plot(cars$speed, jitter(cars$dist), main='속도와 제동거리', 
     xlab='속도(mph)', ylab='제동거리(ft)',
     pch=1, col='red')

# 선 그래프
tail(Nile)
plot(Nile, main='Nile강의 연도별 유량 변화', 
     xlab='연도', ylab='유량')
# type=p 는 point 산점도가됨
plot(Nile, type='p', mail='Nile강의 연도별 유량 변화',
     xlab='연도', ylab='유량')

# ggplot설치 : install.packages('ggplot2')
# ggplot은 data를 더하면서 그릴수 있다.
# 사용할 라이브러리 적어주기
library('ggplot2')

df = as.data.frame(Nile)
head(df)
df$year = 1871:1970
ggplot(df, aes(x=year, y=x)) +
    geom_line() +
    ggtitle('나일강의 연도별 유량 변화') +
    xlab('연도') + ylab('유량')

