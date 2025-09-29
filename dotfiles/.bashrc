#
# ~/.bashrc
#

# color consts
LIGHTCYAN='[1;36m'
YELLOW='[1;33m'
RED='[1;31m'
PURPLE='[1;35m'
BOLD='[1m'  # Bold, no color
REVERSE='[7m'
BLINK='[5m'
NC='[0m' # No Color or formatting, use at end

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -la --color=auto'
alias lll='ls -la | less'
alias cd..='cd ..'

# alias custom scripts
#alias connect_to_wifi='exec /home/coolporygon/scripts/connect_to_wifi.sh'
alias wget_page='wget --random-wait -r -p -e -robots=off -U mozilla'


echo -e "Type the \e${REVERSE}README\e${NC} command for help."
PS1='\n\e${NC}\e${BOLD}┌[\e${PURPLE}\w\e${NC}\e${BOLD}]\n├◷\e${RED}\D{%Y/%m/%d} \t\e${NC}\e${BOLD}\n├\e${BOLD}{\e${LIGHTCYAN}\u\e${NC}\e${BOLD}@\e${YELLOW}\H\e${NC}\e${BOLD}}\n└\e${BOLD}\$\e${NC} '


#PS1='[\u@\h \W]\$ '
