st <- proc.time()

library(Kmisc)
library(R.utils)

dbp <- c()

is_pal <- function(k) as.numeric(str_rev(as.character(k))) == k
nums <- 1:1e6
pals <- nums[is_pal(nums)]

for (m in pals) {
  bin <- intToBin(m)
  dec <- as.character(m)
  
  if ((bin == str_rev(bin)) && (dec == str_rev(dec))) {
    dbp <- c(m, dbp)
  }
}

print(proc.time() - st)
print(sum(dbp))