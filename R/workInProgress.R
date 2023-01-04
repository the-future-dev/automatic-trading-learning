#comment
#execute:         ctrl+Enter
#clear console :  ctrl+L

#install a package
install.packages("quantmod")

#create an Object
#! R is case sensitive
#get <-

firstObject <- 3680
firstObject

print(firstObject)
show(firstObject)

symbol <- "QQQ"

library(quantmod)

getSymbols(symbol )

#-------
#vectors

vector <- c(1,2,3,4,5, 100, 120, 231, 21)

sequenza <- 1:20

vector <- sequenza

print(vector)


vector.nomi <- c("Andre", "Marco", "Leonardo")
vector.nomi <- c("EURUSD", "GBPUSD")

vector.logico <- c(TRUE, FALSE, T, F, T)

assign("vector2", c("QQQ", "SPY"))

sum(vector)
mean(vector)
median(vector)

vector2 <- vector*2 - 2
vector3 <- vector2 - vector

#element selection
vector[3]
vector[-10]
vector[1:3]
vector[c(1,4)]

#vector tickets
cripto <- c(3448, 0.2973, 106.99, 2.36)
names(cripto) <- c("BTC", "XRP", "ETH", "EOS")

print(cripto)

#casual vectors
randomVector <- sample(1:5000, 35)
print(randomVector)

#data types
class(vector)
typeof(cripto)
mode(vector)

#casting
as.character(vector)








