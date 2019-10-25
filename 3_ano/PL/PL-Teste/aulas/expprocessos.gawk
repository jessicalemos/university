BEGIN { FS = "::" } 
$0 != "" { split($2, data, "[/.-]"); contaDatas[data[1]]++ }
END { for(ano in contaDatas) { print "Ano: " ano " Ocorrencias: " contaDatas[ano] }}
