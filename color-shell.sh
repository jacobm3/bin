GRN='\[\033[01;32m\]'  R='\[\033[01;31m\]' CYAN='\[\033[01;36m\]' WHT='\[\033[01;37m\]'
BLUE='\[\033[01;34m\]' MAG='\[\033[01;35m\]' O='\[\033[00m\]'
LTZ=DST
PS1="${CYAN}\u@\h:\w         \D{%F} \t\n$ ${O}"
if [ "$USER" == 'root' ]; then PS1="$R\u$O@\h:\w         \D{%F} \t\n# "; fi
