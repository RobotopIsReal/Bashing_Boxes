#!/bin/bash

array_of_objects=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")

#1 declair all variabes needed by main logic.
#2 define all variables required for a function to work.
#3 define all functions.
#4 main logic.
display_initial_menu(){
	echo -e "\n> 
	|--------------------------------
	|Select an item.
	|--------------------------------
	|  1 - Print list
	|  2 - Print item at X position in list
	|  3 - Add item to list
	|  4 - Remove last item from list
	|  5 - Remove item from X position
	|  6 - Save your current box
	|  7 - Load a box
	|  8 - List saved boxes
	|  9 - Delete a box
	|  0 - Exit
	|---------------------------------
"
	read -p "Enter selection: " unser_input
}

print_all_objects(){
	echo ${array_of_objects[@]}
}

print_total_number_of_objects(){
	echo "Number of items: "${#array_of_objects[@]}
}

print_at_pos(){
	# -p makes it add a written prompt
	read -p "Enter a position number: " posnum
	# + sign means "one or more"
	if [[ $posnum =~ ^[0-9]+$ ]] then
		# -1 is added because bash counts from 0
		echo ${array_of_objects[$posnum-1]}
	posnum=0
fi
}

remove_last(){
			last="${array_of_objects[-1]}" # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
			echo "Removed" $last "from the list. Type Back to exit."
			unset 'array_of_objects[-1]' # removes the last element from the array
			read input4 # waits for user input
			input4=0
}


display_initial_menu

case $unser_input in
	# What this does: prints the list and number of items, then waits for an input.
	1) print_all_objects
	   print_total_number_of_objects
	   read
	   display_initial_menu
		;;
	# What this does: repeats the printing function until the user presses ESC.
	# $'\e' is Bash syntax for ESC.
	2) while ! [[ $posnum = $'\e' ]]; do
	   		print_at_pos
	   done
	   display_initial_menu
		;;
	3)
		# repeats until you tell it to go back
		while ! [[ "$newitem" = $'\e' ]]; do
			read -p "Enter the new item: " newitem
		if ! [[ "$newitem" = $'\e' ]]; then
			# this tells the script to add the element stored in $newitem to the array
			list+=("$newitem")
		fi
		done
		newitem=0
		display_initial_menu
		;;
	4)
		if ! [[ "$input4" = $'\e' ]]; then
			remove_last
		fi
		display_initial_menu	
		;;
	*) display_initial_menu
		;;
esac