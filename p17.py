n_dict = {
	1 : 'one',
	2 : 'two',
	3 : 'three',
	4 : 'four',
	5 : 'five',
	6 : 'six',
	7 : 'seven',
	8 : 'eight',
	9 : 'nine',
	10 : 'ten',
	11 : 'eleven',
	12 : 'twelve',
	13 : 'thirteen',
	14 : 'fourteen',
	15 : 'fifteen',
	16 : 'sixteen',
	17 : 'seventeen',
	18 : 'eighteen',
	19 : 'nineteen',
	20 : 'twenty',
	30 : 'thirty',
	40 : 'forty',
	50 : 'fifty',
	60 : 'sixty',
	70 : 'seventy',
	80 : 'eighty',
	90 : 'ninety'
	}

def num_to_str(n):
	str_num = str(n)
	str_num = '0' * (4 - len(str_num)) + str_num

	return str_num

def num_to_txt(n):
	i = map(int, n)
	str = ''

	if i[0] > 0:
		str = 'onethousand'
	
	else:
		if i[1] > 0:
			str = n_dict[i[1]] + 'hundred'
			if i[2] > 0 or i[3] > 0:
				str += 'and'
		if i[2] > 1:
			str += n_dict[i[2] * 10]
		
		if i[2] == 1:
			str += n_dict[i[2] * 10 + i[3]]

		if i[3] > 0 and i[2] != 1:
			str += n_dict[i[3]]

	return len(str.replace(' ', ''))

num_sum = 0

for j in range(1, 1001):
	num_sum += num_to_txt(num_to_str(j))

print 'the sum is %d' % num_sum


	

