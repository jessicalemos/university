BEGIN{ FS=":" }
     { conta[$1]++ }
END{ for(user in conta){print user " \t-> " conta[user]}; print "Numero total de utilizadores:" NR }
