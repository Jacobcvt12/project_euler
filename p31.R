# initialize vectors for coin value, coin multiples and max coins
x <- c(200, 100, 50, 20, 10, 5, 2, 1)
y <- c(1, 0, 0, 0, 0, 0, 0, 0)
maxes <- 200/x

zeros <- rep(0, 8)

# init variable to count combinations
comb <- 0

# function to get leftmost nonzero value
left <- function(vec) {
  min(which(vec>0))
}

while 