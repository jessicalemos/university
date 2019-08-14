BEGIN{ FS=":" }
NR>3 && NR<6   { $(NF-1)="XYZ"; for(i = 1;i <= NF; i++){print $i}; print "FIM DO REGISTO NR: " NR}
END{ print "Numero total de utilizadores:" NR }
