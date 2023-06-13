load('data/pop.rda')
head(pop)
tableV1 = table(pop$V1)
barplot(tableV1, main='남녀 인구수', xlab='성별', ylab='인구')

tableV5 = table(pop$V5)
tableV5


## 막대그래프
# 이산형,질적자료의 개수 (기둥의높이)
barplot(tableV5, main='출생아별 빈도', xlab='출생아수', ylab='빈도')

## 히스토그램
# 연속형 자료의 개수, 비율 (기둥의 넓이)
hist(pop$V2, main='연령별 분포', xlab='연령', ylab='빈도')

# breaks=c(seq(0,90,10)) 0살부터90살까지  10살씩 묶기
# right=F 각 계급의 구간을 계급의 시작점 이상, 끝점 미만
# breaks로 만든 구간을 [0, 10), [10, 20), … [80, 90)와 같이
# probability=T 히스토그램을 빈도가 아닌 전체에서의 비중(밀도)가 되도록 합니다. (상대도수) / freq = F 와 동일
hist(pop$V2, breaks=(seq(0 ,90,10)), right=F,  probability=T,
     main='연령별 분포', xlab='연령', ylab='밀도')
# 밀도를 다 더하면 1이됨

tableV4 = table(pop$V4)
tableV4

# cex=0.8 (PT 에서 추가) cex=0.8 (PT 에서 추가)
pie(tableV4, main='학력별 비중', cex=0.8)
