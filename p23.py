import numpy as np

def factors(n):
	temp_factors =  list(set(reduce(list.__add__,
		([i, n // i] for i in range(1, int(n ** 0.5) + 1) 
			if n % i == 0))))
	temp_factors.remove(n)

	return temp_factors

def is_ab_p(n):
	num_fact = factors(n)
	if sum(num_fact) > n:
		return 'A'
	elif sum(num_fact) == n:
		return 'P'
	else:
		return 'N'

def remove_multi(n, k):
	while n * k <= 20161:
		if n * k not in ab_nums:
			nums.remove(n * k)
			ab_nums.append(n * k)
		k += 1

def is_not_sum(n):
	answer = True

	test_abs = ab_nums[ab_nums < n]
	cnt = np.count_nonzero(test_abs)
	n_rep = np.repeat(n, cnt)
	diff = n_rep - test_abs

	if any(np.in1d(diff, test_abs)):
		answer = False
	
	return answer


# find all of the abundant numbers from 12 to 28123
ab_nums = []

nums = range(12, 20162)

for i in nums:
	ab_p = is_ab_p(i)
	if ab_p == 'A':
		remove_multi(i, 1)
	elif ab_p == 'P':
		remove_multi(i, 2)

print 'I found %d abundant numbers from 12 to 28123' % len(ab_nums)

ab_nums = np.array(ab_nums)

non_sum_ab = []

pot_numbers = range(1, 48)
pot_numbers.extend(range(49, 20162, 2))


for num in pot_numbers:
	if num < 24:
		non_sum_ab.append(num)
	elif is_not_sum(num):
		non_sum_ab.append(num)
	
	print num

print 'I found %d numbers, the sum of which is %d' % (len(non_sum_ab), sum(non_sum_ab))


