BEGIN {FS="\n"; conta=0}
/linha/ {conta++;}
END {print conta}
