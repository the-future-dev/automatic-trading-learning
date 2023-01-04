library(quantmod)
library(plotly)

#Tickers da caricare
symbols <- c("AAPL", "META", "MSFT")

#Caricare i dati finanziari
start <- as.Date("2019-01-01")
end   <- as.Date("2023-01-01")

getSymbols(Symbols = symbols, src = "yahoo", from = start, to = end)

stocks <- as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], META = META[, "META.Close"], MSFT = MSFT[, "MSFT.Close"]))

plot(AAPL[, "AAPL.Close"], main = "AAPL")

#candlestick graph
candleChart(AAPL, up.col = "black", dn.col = "red", theme = "white")

#media a 200 periodi - simple moving average - 20, 50, 189
addSMA(n = c(20, 50, 189))
