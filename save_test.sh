#!bin/bash
# array_of_objects=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")
# printf "%s\n" "${array_of_objects[@]}" > test.txt
# declare -p array_of_objects > /home/nasim/Bashing_Boxes/test.txt
source test.txt
echo ${array_of_objects[@]}

# printf "%s\n" "${array_of_objects[@]}" > /home/nasim/Bashing_Boxes/data/$boxname.txt