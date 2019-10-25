BEGIN { FS = "::"; RS = "\n+" }
#{ split($2, date, "[/.-]"); print date[1] }
#$0 != "" { split($2, date, "[/.-]"); contaDatas[date[1]]++ }
# em vez de por no begin o RS podemos o anterior
{ split($2, date, "[/.-]"); contaDatas[date[1]]++ }
#END { print "#"NR}
#END { for(ano in contaDatas) {print ano":"contaDatas[ano]}}
END { for(ano in contaDatas) {print ano":"contaDatas[ano] > "processos.out"}}