st <- proc.time()

# include gmp library which adds 
# "arbitrary precision arithmetic, operating on signed integers, 
# rational numbers, and floating-point numbers."
library(gmp)

# function to test for regular numbers
is_reg <- function(n) {
  # create list of prime factors and test if it contains either 2 or 5
  # i.e. the number satisfies 2^a * 2^b = number
  factors <- sort(unique(as.numeric(factorize(n))))
  val <- all(factors %in% c(2, 5))
  
  return(val)
}

# function to minimize congruence modulo equation
cong_mod <- function(n) {
  mod <- 1
  s <- 0
  t <- 1
  while (mod > 0) {
    # use bigz in gmp to handle large numbers
    # find smallest s,t to solve 10^2 congruence modulo 10^s+t mod n
    mod <- mod.bigz(pow.bigz(10, s) - pow.bigz(10, s+t), n)
    if (mod == 0) break
    t <- t + 1
    # use the fact that a nonregular number has a cycle of at most n-1 to avoid looping
    if (t >= n) {
      s <- s + 1
      t <- 1
    }
  }
  return(c(s, t))
}

# create vector of denominators
a <- 1:1000

# remove regular numbers
a <- a[sapply(a, is_reg) == FALSE]

max_cyc <- 0

# loop through nonregular numbers and calculate period
for (val in a) {
  cyc <- cong_mod(val)
  if (cyc[2] > max_cyc) {
    max_cyc <- cyc[2]
    max_den <- val
  }
}

# print runtime and 
print(proc.time() - st)
print(sprintf("1 divided by %d has cycle of %d", max_den, max_cyc))