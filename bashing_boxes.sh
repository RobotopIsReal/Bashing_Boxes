#!/bin/bash

list=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")
# The $ indicates that 'items' isn't just text, but rather a value.
echo "${list[1]}"
# In Bash logic, ! is how you negate conditions, rather than adding 'not' after 'while'.
while true; do
while ! [[ $userinput =~ ^[1-6]$ ]] do
clear
read -p "> Select an item.
--------------------------------
// 1 - Print list
// 2 - Print item at X position in list
// 3 - Add item to list
// 4 - Remove last item from list
// 5 - Remove item from X position
// 6 - Exit
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
echo "// Current option: Print item at X position in list //"
echo "Type "Back" to go back to menu."

while ! [ "$posnum" = "Back" ]; do # lets you type infinitely until you go back to menu
	read -p "Enter a position number: " posnum # -p makes it add a written prompt
	if [[ $posnum =~ ^[0-9]+$ ]] then # + sign means "one or more"
		echo "${list[$posnum-1]}" # -1 is added because bash counts from 0
	else
		if [ "$posnum" = "Back" ]; then
			echo ""
		else
		echo "Input must be a digit."
		read
	fi
	fi
done
posnum=0
userinput=0
fi

# ------ THREE ------ #
if [[ $userinput = 3 ]] then
echo "// Current option: Add item to list //"
echo "Type "Back" to go back to menu."
while ! [ "$newitem" = "Back" ]; do # repeats until you tell it to go back
read -p "Enter the new item: " newitem
	if ! [ "$newitem" = "Back" ]; then
		list+=("$newitem") # this tells the script to add the element stored in $newitem to the array
	fi
done
newitem=0
userinput=0 # Sets the input to 0 to prevent it from printing out your choice infinitely
fi

# ------ FOUR ------ #
if [[ $userinput = 4 ]] then
echo "// Current option: Remove last item from list //"
while ! [ "$input4" = "Back" ]; do
	last="${list[-1]}" # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
	echo "Removed" $last "from the list. Type Back to exit."
	unset 'list[-1]' # removes the last element from the array
	read input4 # waits for user input
done
input4=0
userinput=0 # Sets the input to 0 to prevent it from printing out your choice infinitely
fi

# ------ FIVE ------ #
if [[ $userinput = 5 ]] then
echo "// Current option: Remove X item from list //"
while ! [ "$posnum2" = "Back" ]; do
	read -p "Enter a position number: " posnum2
	if [[ $posnum2 =~ ^[0-9]+$ ]] then
	removed=${list[posnum2-1]} # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
	echo "Removed" $removed "from the list. Type Back to exit."
	unset 'list[posnum2-1]' # removes the last element from the array
fi
done
posnum2=0
userinput=0 # Sets the input to 0 to prevent it from printing out your choice infinitely
fi

# ------ SIX ------ #
if [[ $userinput = 6 ]] then
echo "Exiting program..."
echo "// Final list: " "${list[@]}"
exit
fi


done # ends the menu loop