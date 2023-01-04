library(blotter)
library(quantmod)
library(quantstrat)

#Primi settaggi
daData <- as.Date("2010-01-01")
toData <- as.Date("2023-01-01")

#Enviroment
Sys.setenv(TZ="UTC")
currency("USD")

#Azioni
tickers <- c("AAPL", "TSLA", "PLTR") 
getSymbols(Symbols = tickers, src = "yahoo", from = daData, to = toData, adjust = TRUE)

candleChart(AAPL, up.col = "green", dn.col = "red", theme = "white")
#zoomchart(2021)

#GRAFICI E TEMI - chart_theme() chart_Series()
myTheme <- chart_theme()
myTheme$col$up.col <- 'darkgreen'
myTheme$col$dn.col <- 'darkred'
myTheme$col$dn.border <- 'black'
myTheme$rylab <- FALSE
myTheme$col$grid <- 'lightgray'      #griglia

#medie esponeneziali
PLTR_EMA_21 <- EMA(Cl(PLTR), n = 21)
PLTR_EMA_50 <- EMA(Cl(PLTR), n = 50)
PLTR_EMA_200<- EMA(Cl(PLTR), n = 200)
addTA(PLTR_EMA_21, on = 1, col = "violet")
addTA(PLTR_EMA_50, on = 1, col = "blue")
addTA(PLTR_EMA_200, on = 1, col = "orange")

#chart_Series(PLTR, subset = '2020-01::2023-01', theme = myTheme)

#PROPRIETA' DEL TRADING SYSTEM
tradesize <- 100000
initeq    <- 100000

#Assegno il nome del mio Account, Portafoglio e Strategia
account.st <- portfolio.st <- strategy.st <- "laMiaStrategia" #assegna a tutti e tre "laMiaStrategia"

rm.strat("laMiaStrategia") #se esiste gia, rimuovere la strategia

#inizializzare il trading system
initAcct(account.st, portfolios = portfolio.st, initDate = daData, currency = "USD", initEq = initeq)
initPortf(portfolio.st, symbols = "SPY", initDate = daData, currency = "USD")

initOrders(portfolio.st, initDate = daData) #l'ordine va associato al portafoglio

strategy(strategy.st, store = TRUE)

#INDICATORI - sulla strategia
add.indicator(strategy.st, name = 'SMA', arguments = list(x = quote(Cl(AAPL)), n = 200), label = 'SMA200')

add.indicator(strategy.st, name = 'EMA', arguments = list(x = quote(Cl(AAPL)), n = 21), label = 'EMA21')

add.indicator(strategy.st, name = 'RSI', arguments = list(x = quote(Cl(AAPL)), n = 7), label = 'RSI7')


#INDICATORE PERSONALIZZATO - Bollinger bands
candleChart(AAPL, up.col = "green", dn.col = "red", theme = "white")
addBBands(n = 20, sd = 2, ma = "SMA", draw = "bands", on= -1)
zoomChart("2022")

add.indicator(strategy = strategy.st, name = "BBands",
              arguments = list(HLC = quote(Cl(AAPL)), n = 20, maType = "SMA", sd = 2), label = "Bande di Bollinger")

#1 Function
media_RSI <- function(price, n1, n2) {
  #calcolo della media di due RSI
  RSI_1 = RSI(price = price, n = n1)
  RSI_2 = RSI(price = price, n = n2)
  
  mediaCalc <- (RSI_1 + RSI_2) / 2
  
  colnames(mediaCalc) <- "RSI_media"
  return(mediaCalc)
}

add.indicator(strategy.st, name = "media_RSI", arguments = list(price = quote(Cl(AAPL)), n1 = 7, n2 = 14), label = "MEDIA delle RSI")

plot(media_RSI(Cl(AAPL), n1 = 7, n2 = 14))

test <- applyIndicators(strategy.st, mktdata = OHLC(AAPL))

