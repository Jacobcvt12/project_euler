ptm <- proc.time()

for (a in 1:500) {
  for (b in (a+1):500) {
    c = sqrt((a^2) + (b^2))
    if (c%%1 == 0) {
      if ((a+b+c) == 1000) {
        print(sprintf("a: %.0f, b: %.0f, c: %.0f, abc: %.0f", a, b, c, (a*b*c)))
      }
    }
  }
}

print(proc.time() - ptm)