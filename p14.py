# p14

max_length = 0
max_num = 1

def next_num(prev_num):
    if prev_num % 2 == 0:
        return prev_num / 2
    else:
        return (3 * prev_num) + 1

number = 2

while number < 1000000:
    length = 1
    final_num = number
    
    while final_num > 1:
        final_num = next_num(final_num)
        length += 1

    if length > max_length:
        max_length = length
        max_num = number
        print max_num, max_length

    number += 1
