for file in ~/.bash.d/*; do
  [ -r "$file" ] && source "$file"
done
unset file
