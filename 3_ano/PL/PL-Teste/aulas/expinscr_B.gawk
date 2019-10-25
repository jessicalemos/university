BEGIN {FS="\t"}
$10 ~/Individual/ && $12 ~/Valongo/ {print $20}
