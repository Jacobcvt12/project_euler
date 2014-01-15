from numpy import array, zeros
vals = zeros(1000000)


def isprime(n):
    '''check if integer n is a prime'''
    # make sure n is a positive integer
    n = abs(int(n))
    # 0 and 1 are not primes
    if n < 2:
        return False
    # 2 is the only even prime number
    if n == 2: 
        return True    
    # all other even numbers are not primes
    if not n & 1: 
        return False
    # range starts with 3 and only needs to go up the squareroot of n
    # for all odd numbers
    for x in range(3, int(n**0.5)+1, 2):
        if n % x == 0:
            return False
    return True

def rotate(str, n):
    return str[n:] + str[:n]

i = 0

for j in range(3, 1000001):
    if isprime(j):
        vals[i] = j
        i += 1

vals = vals[vals > 0]
circ = zeros(len(vals))

i = 0

for prime in vals:
    str_p = str(int(prime))
    if len(str_p) == 1:
        circ[i] = prime
        i += 1

    else:
        is_circ = True

        for k in range(1, len(str_p)):
            r = rotate(str_p, k)
            
            if int(r) not in vals:
                is_circ = False
                break

        if is_circ:
            circ[i] = prime
            i += 1


circ = circ[circ > 0]
