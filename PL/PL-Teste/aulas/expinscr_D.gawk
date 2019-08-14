BEGIN {FS="\t"}
NR>2 && NR<21 {print tolower($20)}
