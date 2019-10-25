BEGIN{FS="\t"}
$20 ~/Paulo|Ricardo/ && $11 ~ /91[0-9]{7}/ {print "Telemovel: " $11 " Prova: " $5}
