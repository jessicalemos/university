BEGIN {FS="\t"}
NR>=5 && NR<=15 {print "Nome: " $20 " Email: " $28}
