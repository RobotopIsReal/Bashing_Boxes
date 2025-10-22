items=10

list=("Cologne" "Crown" "Guitar" "Banana" "Milkshake" "Globe" "Raisin" "Cone" "Stocking" "Chart")
echo "${list[1]}" # The $ indicates that 'items' isn't just text, but rather a value.
read -p "Select an input.
1 - Print list
2 - Print item at X position in list
3 - Add item to list
4 - Remove last item from list
5 - Remove item from X position
6 - Exit
" userinput
echo "$userinput"