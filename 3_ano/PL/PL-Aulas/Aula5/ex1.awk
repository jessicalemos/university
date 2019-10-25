BEGIN{}
/<[a-zA-Z][^>]*>/ {i++; print $0}
/<\/[a-zA-Z][^>]*/{i++; print $0}
END{ print "#Tags: "i }