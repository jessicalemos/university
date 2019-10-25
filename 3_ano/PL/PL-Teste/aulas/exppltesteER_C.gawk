BEGIN {FS="\n"; conta=0}
/<A HREF=*/ {conta++; print}
END {print conta}
