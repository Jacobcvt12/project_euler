f = open('p18.txt', 'r')
txt = f.read()
f.close()

tri = [map(int, x.split(' ')) for x in txt.split('\n') if x != '']
