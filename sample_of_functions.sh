#!/bin/bash

array_of_objects=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")

#1 declair all variabes needed by main logic.
#2 define all variables required for a function to work.
#3 define all functions.
#4 main logic.
display_inital_menu(){
	echo -e "\n> 
	|--------------------------------
	|Select an item.
	|--------------------------------
	|  1 - Print list
	|  2 - Print item at X position in list
	|  3 - Add item to list
	|  4 - Remove last item from list
	|  5 - Remove item from X position
	|  6 - Exit
	|---------------------------------
"
	read -p "Enter selection: " unser_input
}

print_all_objects(){
	echo ${array_of_objects[@]
}

print_total_number_of_objects(){
	echo ${#array_of_objects[@]
}




display_inital_menu

case $unser_input in
	1) print_all_objects
		;;
	B|b) print_total_number_of_objects
		;;
	3)
		;;
	4)
		;;
	*) display_inital_menu
		;;
esac