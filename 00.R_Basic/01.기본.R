# R 변수
name <- 'James'
age = 25        # 할당 연산자로 <-,= 을 사용할 수 있음

name
print(age)
print(name, age)    # Error, print()에서는 하나의 인자만 사용 가능
print(paste(name, age)) # [1] "James 25" string연결시 paste
print(paste0(name, age))    # [1] "James25" 이름과 나이의 간격이 붙어있음


# 변수명 - 단어와 단어 사이의 구분자로 . 을 주로 사용함
# 보통.으로 사용
person.name <- 'Maria'
person.gender <- 'Female'
person.age <- 23

##### R 데이터 타입
#1. numeric
x = 10.5
class(x)    # [1] "numeric"

# 2. integer 정수
y = 10L  # [1] "numeric"
class(y) # L을 붙여야 [1] "integer"

# 3. complex(복소수)
z = 9 + 3i
class(z)    # [1] "complex"
print(z*z)  # [1] 72+54i

# 4. character(a.k.a. string)
s = 'R is exciting'
class(s)    # [1] "character"


# 5. logical(a.k.a. Boolean TRUE, FALSE, T, F)
class(T)

##### 6. Type conversion
as.numeric(y) # integer값을 넣어주면 정수가 그대로 나옴
as.numeric(TRUE) # [1] 1
as.character(F) # [1] "FALSE"

##### Math
10 + 5
'10' + '5' # string concatenation은 paste()함수 사용 print(paste(name, age))
max(5, 10, 15)  # 15
sqrt(16)    # 4
abs(-4.7)   # 4.7
ceiling(1.4) # 2
floor(1.4)  # 1

##### Strings
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing eli" # muti-line string
str             # \n
cat(str)        # \n 대신에 출력에 줄바꿈이 들어감
length(str)     # 1
nchar(str)      # 54 - 문자의 갯수


##### 연산자(operator)
# 1. 산술 연산자: +, -, *, /
2 ^ 5   # 2의 5승 = 32 , exponent 거듭제곱
5 %% 2  # 모듈로 연산 5%2의 나머지 1,modulo
5 %/% 2 # 2,몫

# 2. 비교 연산자: 파이썬과 동일

# 3. 논리 연산자: &, &&, |, ||, !
x > 10 && x < 20    # Logical AND, 10 < x < 20
person.age > 24 || age >= 24 # Logical OR
!nchar(s)>5 # Logical NOT
!(nchar(s)) > 5

c(1, 2, 3) < c(-2, 3, 1)
c(F,F,T,T) & c(F,T,F,T)
c(F,F,T,T) | c(F,T,F,T)
