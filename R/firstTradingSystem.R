require(devtools)
devtools::install_github("braverock/blotter")
devtools::install_github("braverock/quantstrat")

library(quantstrat)
library(quantmod)

#PRIMI SETTAGGI
#! date in formato americano: AAAA-MM-GG

daData <- as.Date("2010-01-01")
toData <- as.Date("2023-01-01")

Sys.setenv(TZ="UTC")
currency("USD")

#-------------------------------------------------------------

symbols <- c("AAPL", "TSLA", "META", "AMZN", "PLTR")

getSymbols(Symbols = symbols, src = "yahoo", from = daData, to = toData, adjust = TRUE)

candleChart(PLTR, up.col = "green", dn.col = "red", theme = "white")
#zoomChart("2021")

#media esponenziale
PLTR_ema_21 <- EMA(Cl(PLTR), n = 21)
addTA(PLTR_ema_21, on = 1, col = "pink")

PLTR_ema_50 <- EMA(Cl(PLTR), n = 50)
addTA(PLTR_ema_50, on = 1, col = "orange")

PLTR_ema_200 <- EMA(Cl(PLTR), n = 200)
addTA(PLTR_ema_200, on = 1, col = "purple")











