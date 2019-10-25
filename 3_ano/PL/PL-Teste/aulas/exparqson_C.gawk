BEGIN {FS="::"}
$0 ~/.mp3/ { musicas[$3] }
END{ for(m in musicas){ print m}}
