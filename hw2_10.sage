
def mertens(x):
  s = 0
  for k in range(0, int(x)):
    s += moebius(k+1)
  return s

l = 0
for i in Primes():
  if l > 200:
    break
  p = plot(mertens, (0, i))
  p.save('plot_'+str(i)+'.png')
  l += 1

# p = plot(mertens, (0, 10000))
# p.save('plot.png')
