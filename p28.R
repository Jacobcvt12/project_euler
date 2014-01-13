matrix_size <- 1001
mat_num <- (matrix_size - 1) / 2

width <- function(r) {
  return((r-2)*2 +5)
}

height <- function(r) {
  w <-(r-2)*2 +3
  if (w<0) w <- 0
  return(w)
}

nums <- function(r) {
  t <- 2*width(r)+2*height(r)
  if (r==0) t <- 1
  return(t)
}

# calculate top left diagonal
# start with 1
top_left <- 1

#vector of increments
tl_inc <- sapply(1:mat_num, nums) - 2

#empty vector for top left
tl_nums <- vector("numeric", mat_num)

for (j in 1:mat_num) {
  top_left <- top_left + tl_inc[j]
  tl_nums[j] <- top_left
}

# calculate bottom right diagonal
# start with 1
bottom_right <- 1

#vector of increments
br_inc <- sapply(1:mat_num, nums) - 6

#empty vector for bottom_right
br_nums <- vector("numeric", mat_num)

for (k in 1:mat_num) {
  bottom_right <- bottom_right + br_inc[k]
  br_nums[k] <- bottom_right
}

# calculate bottom left diagonal
# start with 1
bottom_left <- 1

#vector of increments
bl_inc <- sapply(1:mat_num, nums) - 4

#empty vector for bottom_right
bl_nums <- vector("numeric", mat_num)

for (m in 1:mat_num) {
  bottom_left <- bottom_left + bl_inc[m]
  bl_nums[m] <- bottom_left
}

# calculate top right diagonal
# start with 1
top_right <- 1

#vector of increments
tr_inc <- sapply(1:mat_num, nums)

#empty vector for top_right
tr_nums <- vector("numeric", mat_num)

for (n in 1:mat_num) {
  top_right <- top_right + tr_inc[n]
  tr_nums[n] <- top_right
}

total <- sum(tl_nums) + sum(br_nums) + sum(tr_nums) + sum(bl_nums) + 1

print(sprintf("The sum along the diagonal is %d", total))