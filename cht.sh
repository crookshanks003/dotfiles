#!/bin/bash

languages=`echo "golang rust typescript javascript lua cpp c nodejs" | tr ' ' '\n'`
selected=`printf "$languages" | fzf`
read -p "query: " query 

curl cht.sh/$selected/`echo $query | tr ' ' '+'`
