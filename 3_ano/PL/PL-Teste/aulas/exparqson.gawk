BEGIN {FS = "::"}
$0 ~/Alentejo/ {print $3}
