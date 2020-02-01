ents_rel_fl.txt: reliquia_freeling.txt
    grep NP reliquia_freeling | cut -f1,3 -d' ' > ents_rel_fl.txt

ents_rel_xcent.txt: reliquia.txt
    ./xcent -c reliquia.txt > ents_rel_xcent.txt

ents_xcent_noclass.txt: ents_rel_xcent.txt
    sed 's/:w\\g;s/ /_/g' ents_rel_xcent.txt > ents_xcent_noclass.txt

ents_fl_noclass.txt: ents_rel_fl.txt
