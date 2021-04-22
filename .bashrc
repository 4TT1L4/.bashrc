alias ll='ls -lahG'
alias cd..='cd ..'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set prompt:
export PS1="😎 \[\e[31;1m\]\w\[\e[0m\] \[\e[33;1m\]\$(parse_git_branch)\[\033[00m\] > "

# Set Tab name:
echo -ne "\e]0;TERMINAL\a"

# Switch to work directory
cd ~/Work

