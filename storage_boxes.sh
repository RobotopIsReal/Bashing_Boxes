#!/bin/bash
SAVE_DIR="./data"
WAREHOUSE=$(<./warehouse_of_objects.txt)

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
	# @ symbol tells it to give every object in the list and # makes it a number
	echo ${array_of_objects[@]}
	echo "Number of items: "${#array_of_objects[@]}
}

print_at_pos(){
	# -p makes it add a written prompt
	read -p "Enter a position number: " posnum
	# + sign means "one or more"
	if [[ $posnum =~ ^[0-9]+$ ]] then
		# -1 is added because bash counts from 0
		echo ${array_of_objects[$posnum-1]}
	fi
}

add_item(){
			read -p "Enter the new item: " newitem
			# this tells the script to add the element stored in $newitem to the array
			array_of_objects+=("$newitem")
}

remove_last(){
			last="${array_of_objects[-1]}" # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
			echo "Removed" $last "from the list!"
			unset 'array_of_objects[-1]' # removes the last element from the array
}

remove_from_pos(){
	read -p "Enter a position number: " posnum2
	if [[ $posnum2 =~ ^[0-9]+$ ]] then
		removed="${array_of_objects[posnum2-1]}" # sets the value 'last' to the name of the last item. -1 is there because bash is zero-indexed.
		echo "Removed" $removed "from the list!"
		unset 'array_of_objects[posnum2-1]' # removes the last element from the array
	fi
}

# How this works:
# 'declare -p array_of_objects' prints the declaration of an array in a way that bash can interpret.
# > boxname.txt saves this to a file
save_box(){
	read -p "Enter a box name: " boxname
	touch ${SAVE_DIR}/${boxname}.txt
	printf "%s\n" "${array_of_objects[@]}" > ${SAVE_DIR}/${boxname}.txt
	echo "Successfully saved" "$boxname"".txt"
}

# mapfile reads each line from the txt
# -t tells bash to not include \n inside the array items
# < directs the plain text inside the file into the array
load_box(){
	read -p "Enter a box name: " boxname
	mapfile -t array_of_objects < ${SAVE_DIR}/${boxname}.txt
}

# ls lists out every file in the directory
list_box(){
	ls $SAVE_DIR
}

# rm removes the indicated file
del_box(){
	read -p "Enter a box name: " boxname
	rm ${SAVE_DIR}/${boxname}.txt
	echo "Removed" "$boxname"".txt" "from your saved boxes."
}

exitmsg(){
	echo "Thanks for using Bashing Boxes!"
	sleep 2
	clear
}

random_box(){
	cat "$WAREHOUSE"
}



send_to_choice(){
case $unser_input in
	0)
		exitmsg
		;;
	1) 
		print_all_objects
	    display_initial_menu
		;;
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
		save_box
		display_initial_menu
		;;
	7)
		load_box
		display_initial_menu
		;;
	8)
		list_box
		display_initial_menu
		;;
	9)
		del_box
		display_initial_menu
		;;
	10)
		random_box
		;;
	# used for all inputs that aren't in the list of valid inputs above
	*) 
		echo "Invalid input! please enter a valid number!"
		display_initial_menu
		;;
esac
}

# comes at the end to let all the functions get defined first.
display_initial_menu