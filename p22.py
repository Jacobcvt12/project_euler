import string

letters = string.uppercase
f = open('names.txt', 'r')
txt = f.readlines()
names = txt[0].replace('"', '').split(',')

sorted_names = sorted(names)

score = 0

for i, name in enumerate(sorted_names):
	letter_sum = 0
	for letter in name:
		letter_sum += letters.find(letter) + 1

	score += (i + 1) * letter_sum

print 'the sum is %d' % score


