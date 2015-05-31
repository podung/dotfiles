eval "$(rbenv init -)"

set -o vi

export VISUAL=vim
export EDITOR="$VISUAL"

for file in ~/.bash.d/*; do
  [ -r "$file" ] && source "$file"
done
unset file
