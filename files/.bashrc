eval "$(rbenv init -)"

set -o vi

for file in ~/.bash.d/*; do
  [ -r "$file" ] && source "$file"
done
unset file

[ -r ~/.aliases ] && source ~/.aliases

