BEGIN {FS=" "; rel=0}
$0 { if($6!="string"){
	split($6,aux,",");
	for(i in aux) conceitos[aux[i]];
   }
}
$3 ~/-/ {rel++}
$0 ~ /:/ { propriedades[$2][$4] }
$0 { 
     split($6,aux,",");
     for(i in aux) linha[$2][$4][aux[i]];
}
END{ 
     print "#conceito: " length(conceitos)
     print "#relacao: " rel 
     #b
     for(i in propriedades) 
	for(j in propriedades[i])
	   print "Propriedade: " j " -> " i
     #c
     for(i in linha)
	for(j in linha[i])
	   for(h in linha[i][j])
		print "<triple>" i"; " j"; " h "</triple>"
}
