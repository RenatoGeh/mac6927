# Homework 1.7:
# Given a prime number p > 2, write a program to find all the quadratic residues mod p, for 2 <= p
# <= 10000. How many of them are between 1 and (p-1)/2, and how many are between (p-1)/2 and p?

import sys

_debug = True

p = int(sys.argv[1])
n = (p-1)/2
v = [0] * (p-1)
for i in range(1, p):
  j = ((i*i) % p)
  v[i-1] = j

if _debug:
  print("Printing all quadratic residues:")
  for i in range (0, p-1):
    print("  x=%d, x^2=%d mod %d" % (i+1, v[i], p))

r, s = 0, 0
for i in range(1, p):
  if v[i-1] <= n:
    r += 1
  else:
    s += 1

print("Number of quadratic residues in the interval:\n  [1, (p-1)/2]:   %d\n  ](p-1)/2, p-1]: %d" \
    % (r, s))

d = {}
for i in range(0, p-1):
  k = v[i]
  if not d.has_key(k):
    d[k] = k

r, s = 0, 0
for _, v in d.iteritems():
  if v <= n:
    r += 1
  else:
    s += 1

print("Number of distinct quadratic residues in the interval:\n  [1, (p-1)/2]:   %d\n  ](p-1)/2, "\
    "p-1]: %d" % (r, s))

