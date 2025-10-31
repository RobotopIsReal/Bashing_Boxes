#!/bin/bash

array_of_items=(
"item_one"
"item_two"
"item_three")
user_input=""
exit_code=0
play_again=1

get_user_input(){
	read -p "Enter option: " user_input
	check_user_option_selection
}

display_menu(){
	echo -e "
	A) first option
	B) second option
	C) thrird option
	G) Play again...
	Cat) exit
	"
	get_user_input
}

exit_program(){
	echo -e "Thanks for using Bashing Boxes"
	sleep 3
	#exit by default using exit 0 but different numbers can be associated with different errors.
	exit $exit_code
}

option_one_selected(){
	echo "user entered '1' "
}
option_two_selected(){
	echo "user entered '2' "
}
option_three_selected(){
	echo "user entered '3' "
}

check_user_option_selection(){
	case $user_input in
		A|a) option_one_selected
			;;
		B|b) option_two_selected
			;;
		C) option_three_selected
			;;
		Cat|"exit") exit_program
			;;
		G) 
			clear
			play_again="1"
			;;
		*)  play_again="0"
			echo -e "You entered: " $user_input "\n	Please enter a valid option from the menu! "
			sleep 1
			get_user_input
			;;
	esac
}

# main logic starts here: 
while [[ $play_again -eq "1" ]]; do
	display_menu
done

echo "Finished main logic"