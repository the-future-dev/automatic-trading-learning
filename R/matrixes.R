vector <- matrix(1:10, nrow = 2, ncol= 5)
print(vector)

#selezione degli elementi
vector[2, 2]
vector[1, 4]
vector[1,  ]
vector[ , 2]

#concatenazione
trd1 <- c("BTC", 0.7)
trd2 <- c("EHT", 3.4)
trd3 <- c("XRP", 9500)
 
vector.trades <- matrix(c(trd1, trd2, trd3), nrow = 3, ncol = 2, byrow = 1)
vector.trades

colnames(vector.trades) <- c("Name Crypto", "Quantità")
rownames(vector.trades) <- c("First Trade", "Second Trade", "Third Trade")
