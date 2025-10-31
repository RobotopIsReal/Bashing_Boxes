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
	send_to_choice
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
		read
	posnum=0
	fi
}

add_item(){
			read -p "Enter the new item: " newitem
			# this tells the script to add the element stored in $newitem to the array
			list+=("$newitem")
		newitem=0
}

remove_last(){
			last="${array_of_objects[-1]}" # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
			echo "Removed" $last "from the list!"
			unset 'array_of_objects[-1]' # removes the last element from the array
			read input4 # waits for user input
			input4=0
}

remove_from_pos(){
	read -p "Enter a position number: " posnum2
	if [[ $posnum2 =~ ^[0-9]+$ ]] then
		removed=${array_of_objects[posnum2-1]} # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
		echo "Removed" $removed "from the list!"
		unset 'array_of_objects[posnum2-1]' # removes the last element from the array
		read
	fi
}



send_to_choice(){
case $unser_input in
	# What this does: prints the list and number of items, then waits for an input.
	1) 
		print_all_objects
	    print_total_number_of_objects
	    read
	    display_initial_menu
		;;
	# What this does: repeats the printing function until the user presses ESC.
	# $'\e' is Bash syntax for ESC.
	2) 
	    print_at_pos
	    display_initial_menu
		;;
	3)
		add_item
		display_initial_menu
		;;
	4)
		remove_last
		display_initial_menu	
		;;
	5)
		remove_from_pos
		display_initial_menu
		;;
	6)

		display_initial_menu
		;;
	*) 
		display_initial_menu
		;;
esac
}

display_initial_menu