BEGIN{ RS = "</?[a-zA-Z][^>]*>"}
{ print $0}
END{ orint "#tags"NR-1}