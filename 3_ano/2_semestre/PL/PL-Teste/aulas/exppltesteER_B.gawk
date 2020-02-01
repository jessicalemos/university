BEGIN 		{FS="\n"; conta = 0}
#/<HTML/		{conta++; print}
#/<html/  	{conta++; print}
/<\/HTML/	{conta++; print}
/<[Hh][Tt][Mm][Ll]/ {conta++; print}
END		{print conta}
