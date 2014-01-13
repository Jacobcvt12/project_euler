st <- proc.time()

dfs <- c()

get_nums <- function(k) {
  l <- as.numeric(unlist(strsplit(as.character(k), "")))
  sum(factorial(l))
}

for (m in 3:999999) {
  if (get_nums(m) == m) {
    dfs <- c(m, dfs)
  }
}

print(sprintf("Found %d digit factorials", length(dfs)))
print(dfs)
print(sum(dfs))
  
print(proc.time()-st)