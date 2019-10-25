BEGIN {FS = "::"}
$3 ~/Jesus/ {music[$3]++}
END { for(m in music) print "Musica: " m " -> " music[m]}
