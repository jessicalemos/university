#!/usr/bin/env python3

def imprime(f):
    linhas = open(f).readlines()
    pal = {}
    for l in linhas:
        n = pal.get(l,0)
        pal[l] = n + 1

imprime("exemple.txt")