#!/bin/bash

list=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")
# The $ indicates that 'items' isn't just text, but rather a value.
echo "${list[1]}"
# In Bash logic, ! is how you negate conditions, rather than adding 'not' after 'while'.
while true; do
while ! [[ $userinput =~ ^[1-6]$ ]] do
clear
read -p "Select an input.
1 - Print list
2 - Print item at X position in list
3 - Add item to list
4 - Remove last item from list
5 - Remove item from X position
6 - Exit
" userinput
echo "$userinput"
# Symbols: ^ - Start of line // [0-9] - Digits between 0 and 9 // $ - End of line
# Combined, ^[1-6]$ checks if the number is only 1 number between 1 and 6. 
# Adding a + before the $ would make it check for multiple numbers.
if [[ $userinput =~ ^[1-6]$ ]] then
	clear
else
	echo "Invalid input, please enter a number between 1-6"
fi # fi ends an if statement
done # done ends the while loop

# ------ ONE ------ #
if [[ $userinput = 1 ]] then
echo "// Current option: Print List //"
echo "Number of items:" ${#list[@]} #  The # sign makes it give the count of items in the list
echo "${list[@]}" # The @ symbol makes it list out every item
read # waits for user input
userinput=0 # Sets the input to 0 to prevent it from printing out your choice infinitely
fi

# ------ TWO ------ #
if [[ $userinput = 2 ]] then
echo "// Current option: Print List //"
read
userinput=0
fi
done