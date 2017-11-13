def euclides(a, b):
  x, y = max(a, b), min(a, b)
  c = x % y
  while c != 0:
    x, y = y, c
    c = x % y
  # print("gcd(%d, %d)=%d" % (a, b, y))
  return y

for i in range(0, 1000):
  a, b = randint(100, 500), randint(100, 500)
  g, h = euclides(a, b), gcd(a, b)
  if g != h:
    print("gcd(%d, %d)=%d and gcd(%d, %d)=%d do not match." % (a, b, g, a, b, h))
  else:
    print("gcd(%d, %d) match!" % (a, b))
