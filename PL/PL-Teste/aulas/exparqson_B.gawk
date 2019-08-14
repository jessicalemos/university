BEGIN {FS = "::"}
{musicas[$1]++;}
END{for(mus in musicas) {print "Regiao: " mus " numero: " musicas[mus]}}
