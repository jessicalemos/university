BEGIN {FS=" : "; linha=0}
$0 { 
    chars = 0;
    for(i=1; i<=NF; i++)
        chars += length($i);
    if( chars > 5) {
	    linha++;
	    if(titulos[$1]!=0){
		    print "=="titulos[$1]"=="$0;
	    } else {
		    titulos[$1] = linha;
		    print $0;
	    }
    }
}
