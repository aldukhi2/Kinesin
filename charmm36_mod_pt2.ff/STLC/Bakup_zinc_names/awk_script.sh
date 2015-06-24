#!/bin/bash

#
# modify the atoms name in the pdb file for the ZZD residue (=STLC) 
# e.g.:
# ./awk_script.sh 3KEN.pdb 3KEN_modified.pdb 3171 3196 
# input: 3KEN.pdb
# output: 3KEN_modified.pdb 
# first line in the pdb file for ZZD(STLC) : 3171
# last line in the pdb file for ZZD(STLC)  : 3196
# 


if [ $# -ne 5 ] ; then
    echo "This command needs 4 arguments: 
            -1- input file.
            -2- output file.
            -3- the starting line where the modification will be apply.
            -4- the last line where the modification will be apply.
            -5- the column in which you desire to change the atom name.
         "
else
    input=$1
    output=$2
    start=$3
    last=$4
    column=$5

    awk 'NR<'$start' { print }' $input > temp1.dat  

    awk 'NR>='$start' && NR<='$last' { gsub("O1 ", "OXT", '$column')  ;
                                       gsub("O2" , "O",   '$column')  ;     
                                       gsub("S1" , "SG",  '$column')  ;
                                       gsub("N1" , "N",   '$column')  ;
                                       gsub("C22", "C",   '$column')  ;  
                                       gsub("C21", "CA ", '$column')  ;  
                                       gsub("C20", "CB",  '$column')  ;
                                       gsub("C19", "CAO", '$column')  ;
                                       gsub("C18", "CAI", '$column')  ;
                                       gsub("C17", "CAE", '$column')  ;
                                       gsub("C16", "CAJ", '$column')  ;
                                       gsub("C15", "CAP", '$column')  ;
                                       gsub("C14", "CAW", '$column')  ;
                                       gsub("C13", "CAN", '$column')  ;  
                                       gsub("C12", "CAH", '$column')  ;  
                                       gsub("C11", "CAD", '$column')  ;                                      
                                       gsub("C10", "CAG", '$column')  ;  
                                       gsub("C9 ", "CAM", '$column')  ;  
                                       gsub("C8 ", "CAV", '$column')  ; 
                                       gsub("C7 ", "CAZ", '$column')  ;
                                       gsub("C6 ", "CAK", '$column')  ;
                                       gsub("C5 ", "CAQ", '$column')  ;
                                       gsub("C4 ", "CAX", '$column')  ;
                                       gsub("C3 ", "CAR", '$column')  ;
                                       gsub("C2 ", "CAL", '$column')  ;
                                       gsub("C1 ", "CAF", '$column')  ;
                                       gsub("H21", "HN3", '$column')  ;     
                                       gsub("H20", "HN2", '$column')  ;     
                                       gsub("H19", "HN1", '$column')  ;     
                                       gsub("H18", "HB2", '$column')  ;     
                                       gsub("H17", "HB1", '$column')  ;     
                                       gsub("H16", "HAO", '$column')  ;     
                                       gsub("H15", "HAI", '$column')  ;     
                                       gsub("H14", "HAE", '$column')  ;     
                                       gsub("H13", "HAJ", '$column')  ;     
                                       gsub("H12", "HAP", '$column')  ;     
                                       gsub("H11", "HAN", '$column')  ;     
                                       gsub("H10", "HAH", '$column')  ;     
                                       gsub("H9 ", "HAD", '$column')  ;     
                                       gsub("H8 ", "HAG", '$column')  ;     
                                       gsub("H7 ", "HAM", '$column')  ;     
                                       gsub("H6 ", "HAK", '$column')  ;     
                                       gsub("H5 ", "HAQ", '$column')  ;     
                                       gsub("H4 ", "HAR", '$column')  ;     
                                       gsub("H3 ", "HAL", '$column')  ;     
                                       gsub("H2 ", "HAF", '$column')  ;     
                                       gsub("H1",  "HA",  '$column')  ;     
                                       print }' $input > temp2.dat

    awk 'NR>'$last' { print }' $input > temp3.dat  

    cat temp1.dat temp2.dat temp3.dat > $output

    rm temp1.dat temp2.dat temp3.dat

    echo "The output file is $output"

fi
