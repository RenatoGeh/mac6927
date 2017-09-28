#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import random

def send(n, e, message):
  M = encode(message)
  K = []
  for m in M:
    K.append(pow(m, e, n))
  return K

def receive(M, e, p, q):
  k = (p-1)*(q-1)
  n = p*q
  d = inverse_mod(e, k)
  O = []
  for m in M:
    O.append(pow(m, d, n))
  return decode(O)

def encode(s):
  return [ord(c) for c in s.decode('utf-8')]

def decode(L):
  s = ""
  for l in L:
    s += unichr(l)
  return s

def rand(a, b):
  return Integer(random.randint(a, b))

def test():
  P = Primes()
  p, q = P.next(1000), P.next(2000)
  e = P.next(500)
  n = p*q

  msg = 'Thís ŝtrìng hâs spéciãl characters'
  L = send(n, e, msg)
  print("Message: " + msg)
  print("Encrypted:\n "),
  for l in L:
    print(l),
  print("")

  s = receive(L, e, p, q)
  print("Decrypted:\n "),
  print(s)

def request_keys():
  P = Primes()
  p, q = P.next(rand(1000, 10000)), P.next(rand(1000, 10000))
  e = P.next(rand(200, 800))
  n = p*q
  return n, e, p, q

def receive_transaction():
  # Alice wants to secret message Bob
  # Bob sends n and e to Alice
  n, e, p, q = request_keys()
  print("%d\n%d\n" % (n, e))
  # Alice sends an encrypted message to Bob using n and e
  L = raw_input().split()
  for i in range(0, len(L)):
    L[i] = int(L[i])
  # Bob decrypts the secret message with e, p and q
  print("Decrypted:")
  s = receive(L, e, p, q)
  print(s)

def send_transaction():
  # Bob wants to secret message to Alice
  # Alice sends n and e to Bob
  n, e = input(), input()
  # Bob sends an encrypted message to Alice using n and e
  msg = raw_input()
  M = send(n, e, msg)
  for i in M:
    print(i),
  print("")
  # Alice decrypts the secret message with e, p and q

def usage():
  print(("Usage: %s transaction\n  transaction - string value 'send' (or just 's') or 'receive' "+
    "(or just 'r') without single quotes. Alice sends secret message to Bob or Alice receives "+
    "secret message from Bob.") % sys.argv[0])

if len(sys.argv) != 2:
  usage()
  sys.exit(1)

if sys.argv[1] == "send" or sys.argv[1] == 's':
  send_transaction()
elif sys.argv[1] == "receive" or sys.argv[1] == 'r':
  receive_transaction()
else:
  usage()
  sys.exit(1)
