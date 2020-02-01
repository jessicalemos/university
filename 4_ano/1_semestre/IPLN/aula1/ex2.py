#!/usr/bin/env python3

def pares_v1(l):
    for i in l:
        if not i % 2:
            print(i)

def pares_v2(l):
    res = [i for i in l if not i % 2]
    #print(res)
    for n in res:
        print(n)

def pares_v3(l):
    res = list(filter(lambda i : not i % 2, l))
    print(res)

#pares_v3([1,2,3,4])
