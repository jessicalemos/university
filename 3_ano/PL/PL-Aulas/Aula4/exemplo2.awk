BEGIN { FS = "\t" }
$1 ~/Paulo|Ricardo/ && $11 ~ /^91[0-9]{7} { print S1":"$11":"$5 }