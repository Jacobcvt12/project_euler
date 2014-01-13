from math import sqrt
import time

start_time = time.time()

# create natural numbers to calculate triangular numbers
nums = range(1, 1000000)
tri = []

#calculate triangular numbers
for num in nums:
    if len(tri) > 0:
        tri.append(tri[num - 2] + num)
    else:
        tri.append(num)

# half of the highest triangular number is the highest that we need
max_prime = int(sqrt(tri[len(tri) - 1]))

# initialize numbers and bool list for sieve
num_list = range(2, int(sqrt(max_prime)) + 1)
bool_list = []

for i in range(max_prime):
    bool_list.append(1)

# find indices for prime numbers
for i in num_list:
    if bool_list[i - 2]:
        for j in range(i ** 2, max_prime, i):
            bool_list[j - 2] = 0

# make a list of primes
prime_list = []

for ind, val in enumerate(bool_list):
    if val:
        prime_list.append(ind + 2)

# function for calculating number of divisors
def calc_div_num(tri_num):
    div_num = 1
    ok_primes = [x for x in prime_list if x <= int((tri_num) / 2)]

    if div_num not in prime_list:  
        for prime in ok_primes:
            div_count = 0
            temp_num = tri_num
            while cln_div(temp_num, prime):
                temp_num /= prime
                div_count += 1

            div_num *= (div_count + 1)

    if div_num > 2:
        return div_num

    else:
        return 2

# function to check if numbers divide cleanly
def cln_div(number, divisor):
    divid = number / float(divisor)
    if int(divid) == divid:
        return 1
    else:
        return 0

# check each triangular number until one has 500 divisors

max_div = 0

for each in tri:
    
    num_divisors = calc_div_num(each)
    if num_divisors > max_div:
        max_div = num_divisors
        print each, max_div

    if num_divisors > 500:
        print each
        break
    
print time.time() - start_time, "seconds."
        

    



    
