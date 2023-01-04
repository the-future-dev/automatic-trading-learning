#install Packages for crypto
install.packages("devtools")
devtools::install_github("amrrs/coinmarketcapr")

install.packages("coindeskr")

#import libraries
library(coinmarketcapr)
library(coindeskr)

today_MarketCap <- get_crypto_listings()
