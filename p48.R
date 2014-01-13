st <- proc.time()

library(gmp)

ser_sum <- 0

for (j in 1:1000) {
  ser_sum <- add.bigz(ser_sum, pow.bigz(j, j))
}

chars <- as.character(ser_sum)

last10 <- substr(chars, nchar(chars)-9, nchar(chars))

print(last10)

print(proc.time()-st)