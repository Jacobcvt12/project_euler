st <- proc.time()

nn <- c()

for (j in 10:999999) {
  digits = unlist(strsplit(as.character(j), ""))
  ts <- 0
  for (d in digits) {
    ts <- ts + (as.numeric(d)) ^ 5
  }
  if (ts == j) nn <- c(nn, ts)
}

print(proc.time() - st)
print(sum(nn))