st <- proc.time()

digits <- c()
need <- c(1e0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6)
curr_need <- 1
len_numbers <- 0

for (k in 1:1e6) {
  len <- nchar(k)
  len_numbers <- len_numbers+len
  if (len_numbers == need[curr_need]) {
    digits <- c(digits, substr(k, nchar(k), nchar(k)))
    curr_need <- curr_need+1
  } else if (len_numbers > need[curr_need]) {
    nums <- (len_numbers-len+1):len_numbers
    char <- which(nums==need[curr_need])
    digits <- c(digits, substr(k, char, char))
    curr_need <- curr_need+1
  }
  if (length(digits) == length(need)) {
    break
  }
}

print(prod(as.numeric(digits)))
print(proc.time()-st)