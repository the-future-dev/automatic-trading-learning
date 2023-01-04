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

#candleChart(PLTR, up.col = "green", dn.col = "red", theme = "black")
#zoomchart(2021)

#GRAFICI E TEMI - chart_theme() chart_Series()
myTheme <- chart_theme()
myTheme$col$up.col <- 'darkgreen'
myTheme$col$dn.col <- 'darkred'
myTheme$col$dn.border <- 'black'
myTheme$rylab <- FALSE
myTheme$col$grid <- 'lightgray'      #griglia

chart_Series(PLTR, subset = '2020-01::2023-01', theme = myTheme)

#medie esponeneziali
PLTR_EMA_21 <- EMA(Cl(PLTR), n = 21)
PLTR_EMA_50 <- EMA(Cl(PLTR), n = 50)
PLTR_EMA_200<- EMA(Cl(PLTR), n = 200)
addTA(PLTR_EMA_21, on = 1, col = "violet")
addTA(PLTR_EMA_50, on = 1, col = "blue")
addTA(PLTR_EMA_200, on = 1, col = "orange")

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













