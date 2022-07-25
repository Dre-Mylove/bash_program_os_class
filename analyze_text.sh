#!/bin/bash

# Checking is user entered 1 arg. if not display error message and exit 1
if [ "$#" -ne 1 ]; then
    echo "Please specify 1 command line argument"
    exit 1
fi

# Function Name: uniq_word
# Description: Used regular expression to find uniq words 
# Notes 
uniq_word() {
    grep -o -E -i '\w+' $1 | sort -f | uniq -c -i |  tr '[A-Z]' '[a-z]'
}

# Function Name: uniq_ends_w_th
# Description: used regular expression to find words ending with th
# Notes
uniq_ends_w_th() {
    grep -o -E -i '\w*th\b' $1 | sort -f | uniq -c -i | tr '[A-Z]' '[a-z]'
}

# Function Name: uniq_beg_w_th
# Description: used regular expression to find words that begin with th
# Notes
uniq_beg_w_th() {
    grep -o -E -i '\bth\w*' $1 | sort -f | uniq -c -i | tr '[A-Z]' '[a-z]'
}

# Function Name: uniq_sent
# Description: used regular expression to find unique sentences begin with capital
# Notes: ignores case when printed to terminal
uniq_sentence() {
    grep -E '\w+' $1 | LC_COLLATE=C sort -f | uniq -c | tr '[A-Z]' '[a-z]' 
}

# Function Name: first_lines
# Description: prints first 5 lines of text
# Notes: 
first_lines() {
    head -n 5 $1 
}

# Function Name: last_lines
# Description: prints last 7 lines of text
# Notes: 
last_lines() {
    tail -n 7 $1
}

# this is sort of a main or driver area to call functions and pass arg
uniq_word $1
uniq_ends_w_th $1
uniq_beg_w_th $1
uniq_sentence $1
first_lines $1
last_lines $1