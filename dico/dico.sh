#!/bin/bash

grep -v "-" dico.utf8 | grep -v "Abr" | grep -v "Fem" | grep -v "PL" | egrep  "Nom|Ver:Inf|Ver:PPas|Adj|Adv|Pro|Int" | awk '{print $1}' > validwords.txt
