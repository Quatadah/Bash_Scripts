#!/bin/bash

#program that generates skeleton for C file, Latex file, or bash file


# the program needs at leats two parameters to begin

if [ $# -le 1 ]
then
    echo "Usage:$0 the program needs at least two parameters."
    exit 1
fi

filename=$1
extension=$2

skeleton ()
{
    if [ $extension = 'c' ]
    then
        cat << EOF > $filename.c
/**
 *
 * @filename $filename.c
 * @date $(date)
 * @author $(hostname)
 * @brief ...
 *
 */
#include <stdlib.h>
#include <stdio.h
#define _NB_MIN_PARAMS_ 
void print_usage( char *argv[] ) {
	fprintf( stderr, "Usage: %s ....\n", argv[0] );
	return;

int main( int argc, char *argv[] )
{
	if ( argc < _NB_MIN_PARAMS_ ) {
		print_usage( argv );
		return EXIT_FAILURE;
	
	return EXIT_SUCCESS;
}
EOF
    
    elif [ $extension = 'tex' ]
    then
        cat << EOF > $filename.tex
%%
%% @filename $filename.tex
%% @date $(date)
%% @author $(hostname)
%% @brief ...
%%
\documentclass[a4paper, draft]{article}

\usepackage[utf8]{inputenc}
\usepackage[french]{babel} 

% Figures
\usepackage{graphicx}
\graphicspath{{./img/}}

% Math
\usepackage{amsmath, amssymb}
\newtheorem{defi}{Définition}

% Algortihmes
\usepackage[vlined,lined,linesnumbered,boxed,french]{algorithm2e}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator{\myfunc}{myfunc}
\DeclareMathOperator*{\sign}{sign}
\DeclareMathOperator*{\imwh}{width}
\DeclareMathOperator*{\imht}{height}

% Extra
\usepackage[left=3cm,right=3cm,top=2cm,bottom=2cm]{geometry}
\usepackage{url}

\begin{document}


\end{document}
EOF

    elif [ $extension = 'sh' ] || [ $extension = 'bash' ]
    then
    cat <<EOF > $filename.sh
#!/bin/sh/env bash
#
# @filename $filename.sh
# @date $(date)
# @author $(hostname)
# @brief ...
#

CMD=$( basename $0 )
nbminparams=1

usage()
{
	echo "Usage: $CMD ..."
}

if [ $# -lt $nbminparams ]
then
	usage
	exit 1
fi
EOF

    else
        echo "Unknown type"

    fi
}




skeleton