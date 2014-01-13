from math import sqrt

for a in range(1, 501):
	for b in range(a+1, 501):
		c = sqrt((a**2) + (b**2))
		if int(c) == c:
			if (a+b+c) == 1000:
				print "a: %d, b: %d, c: %d, abc: %d" % (a, b, c, (a*b*c))