#!/usr/bin/env python3

import subprocess as sp
import sys
from getopt import getopt
opts,resto = getopt(sys.argv[1:],"i:f:") #processar o i e o f
dict_opts = dict(opts)
f = int(dict_opts.get('-f',20))
i = int(dict_opts.get('-i',10))
output = sp.getoutput(f"head -{f} {resto[0]} | tail -{f-i+1}")
print(output)
