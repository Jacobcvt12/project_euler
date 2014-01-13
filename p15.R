pascalTriangle <- function(h) {
  sapply(0:h, function(i) choose(i, 0:i))
}

dim <- 20
temp_dim <- (dim * 2) + 1

mat <- pascalTriangle(temp_dim)
lattice <- matrix(0, temp_dim, temp_dim)
j <- temp_dim

for (i in 1:temp_dim) {
  pasc <- unlist(mat[i])
  k <- 1
  m <- temp_dim
  n <- j
  while (n <= temp_dim) {
    lattice[m, n] <- pasc[k]
    m <- m - 1
    n <- n + 1
    k <- k + 1
  }
  j <- j - 1
}

print(lattice[temp_dim - dim, temp_dim - dim])

