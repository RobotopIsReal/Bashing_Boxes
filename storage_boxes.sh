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
		echo ${list[$posnum-1]}
	posnum=0
}



display_initial_menu

case $unser_input in
	1) print_all_objects
	print_total_number_of_objects
	read
	display_initial_menu
		;;
	2) print_at_pos
		;;
	3)
		;;
	4)
		;;
	*) display_initial_menu
		;;
esac