BEGIN			{FS=":"; conta = 0}
NR==1 			{print "A processar o ficheiro" }
NR>=1 && NR<=10 	{print $1 }
			{conta+=NF}
END 			{print conta " - " NR }
