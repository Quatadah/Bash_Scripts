#!/bin/bash

base=./CarnetsDeVoyage
rep=$(ls $base)

filtrage() {
    for place in  $(ls $base | egrep ^19[7-9][0-9][-,_][A-Z])
    do
        echo $place
    done    
        
}

identify_rep() {
    local biggest=0
    for i in $@
    do
        if [[ -d "$base/$i" ]]
        then
            du -hs $base/$i | cut -d K -f 1 >> try.txt
        fi
    done
    val=$(cat try.txt  | sort -nr | head -n 1)
    rm try.txt
    for i in $@
    do
        if [[ -d "$base/$i" ]]
        then
            local test=$(du -hs $base/$i | cut -d K -f 1)
            if [ $test -eq $val ]
            then
                echo $base/$i
            fi
        fi
    done

}

find_itineraries() {
    find ./$1 -type f -name "*Itineraire*"
}


find_signature() {
    for i in $*
    do
        cat $i | egrep "[b,B]ilbon" > /dev/null
        if [ $? -eq 0 ]
        then
            echo $i
        fi
    done
}


showmore() {
    local var=$(cat $1 | grep "à" | sort | head -n 3 | cut -c 1  )
    echo -n $var
    echo ""
}

found(){
    local words
    local treasure
    cat $1 | sort -k 3 | egrep -v "^$" > Itineraire_trie.txt
    cat Itineraire_trie.txt | head -n 2 > Itineraire_trie_compact.txt
    cat Itineraire_trie.txt | tail -n 2 >> Itineraire_trie_compact.txt
    words=$(cat Itineraire_trie_compact.txt | awk '{print $3}')
    rm Itineraire_trie.txt Itineraire_trie_compact.txt
    treasure=$(echo $words | tr ' ' '/')
    echo $treasure
    cat $base/$treasure
}

rep=$( identify_rep $( filtrage ) )
#showmore $( find_signature $( find_itineraries $rep ) )
found $(find_signature $( find_itineraries $rep ))
