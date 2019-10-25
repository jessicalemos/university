#!/usr/bin/env python3

def inverte(f):
    linhas = open(f).readlines()
    for l in linhas[::-1]:
        print(l.rstrip())

inverte("exemple.txt")