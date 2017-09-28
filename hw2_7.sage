import sys

def is_proot(k, p):
  t, e = k, 1
  while t % p != 1:
    e+=1
    t*=k
  return e == p-1

m = int(sys.argv[1])
P = Primes()

l=0
for p in P:
  if l >= m:
    break
  if p <= 3:
    continue
  print("For prime p=%d:" % p)
  for j in range(2, p):
    if is_proot(j, p) and gcd(j, p-1)==1:
      print("  %d is primitive root and gcd(%d, %d)=1\n" % (j, j, p-1))
      break
  l+=1
