#!/usr/bin/env python3
import re
import subprocess
import sys
from getopt import getopt
import fileinput

texto = ""
pM = r"(?<=\W)[A-Z]\w+"
nP = pM + r"(?: (?:[A-Z]\w+|da|do|de))*"
frase = r'[A-Z].*?[a-z]'
fimfrase = r"[.?!:]\s*"

for line in fileinput.input():
    texto+=line

frases = re.split(fimfrase,texto)

entidades = []
for frase in frases:
    entidades += re.findall(nP,frase)

print(entidades[0:100])
    
    #word = re.findall(pM,line)
    #print(word)