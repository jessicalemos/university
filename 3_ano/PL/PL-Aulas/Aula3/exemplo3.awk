BEGIN{ FS=":" }
#NR>3 && NR<6   { $(NF-1)="XYZ"; for(i = 1;i <= NF; i++){print $i}; print "FIM DO REGISTO NR: " NR}
#$1=="prh"      {print "PRH"}
#$1~/j.+/       {print "JOSE"}
#/a.*a/         {print}
$3>="20"        {print "A " $4}
$4=20           {print "B " $5}
END{ print "Numero total de utilizadores:" NR }
