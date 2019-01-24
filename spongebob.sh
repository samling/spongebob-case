#!/bin/bash

# Normalize the string
upper=$(echo "$@" | awk '{print toupper($0)}')

# Separate index for ignoring spaces
len=0

# Final string evaluation
spongebob=$(for ((i=0; i < ${#upper}; i++));
    do
        if [[ ${upper:i:1} == [[:space:]] ]]; then
            # Ignore spaces in increment
            echo -ne " "
        elif [[ $((len%2)) -eq 0 ]]; then
            # Print the uppercase character if the index is even
            ((len++))
            echo -ne "${upper:i:1}"
        else
            # Print the lowercase character if the index is odd
            ((len++))
            echo -ne $(echo "${upper:i:1}" | awk '{print tolower($0)}')
        fi
    done)

echo $spongebob
