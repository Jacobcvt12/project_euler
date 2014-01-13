st <- proc.time()

library(gmp)
a <- add.bigz(prod.bigz(28433, pow.bigz(2, 7830457)), 1)
b <- as.character(a)
c <- substr(a, nchar(b)-10+1, nchar(b))

print(c)
print(proc.time()-st)