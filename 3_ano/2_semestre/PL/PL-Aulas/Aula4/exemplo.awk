#awk -F"\t" '{ print $10}' inscritos.txt
#awk 'BEGIN {FS = "\t" } NR==2 { for(i = 1; i <= NF; i++) print i":"$i}' inscritos.txt 

BEGIN { FS="\t"}
$10 == /[Ii][Nn][Dd][Ii][Vv][Ii][Dd][Uu][Aa][Ll]/ && $12 ~/Valongo/ {print $1":"$10}