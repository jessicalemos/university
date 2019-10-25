BEGIN {FS = "::"}
$0 != "" {
	split($3,palavra," ");
	i = 1;
	while(palavra[i]!=""){
		nomes[tolower(palavra[i])]++;
		i++;
	}
    split($4,palavra," ");
	i = 1;
	while(palavra[i]!=""){
		nomes[tolower(palavra[i])]++;
		i++;
	}
    split($5,palavra," ");
	i = 1;
	while(palavra[i]!=""){
		nomes[tolower(palavra[i])]++;
		i++;
	}
}
END { for(nome in nomes) print "Nome: " nome " Ocr.: " nomes[nome]}

