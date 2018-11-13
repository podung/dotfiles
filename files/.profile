for file in ~/.profile.d/*; do
  [ -r "$file" ] && source "$file"
done
unset file
