alias ll='ls -lahG'
alias cd..='cd ..'

alias repo='cd ~/Work/Repos/my-repo'
alias eclipse='nohup /home/vagrant/Work/eclipse-java-2021-03-R-linux-gtk-x86_64/eclipse/eclipse > /dev/null 2>&1 &'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

update_open_jira_task_bat() {
   echo "$(parse_git_branch)" | sed -rn 's/.*(PRJ-[0-9]+).*/ start "" https:\/\/jira.company.com\/browse\/\1/p' > /home/vagrant/share/open-jira-task.bat
}

# Set prompt and update the batch file for opening currnet task:
export PS1='😎 \[\e[31;1m\]\w\[\e[0m\] \[\e[33;1m\]$(parse_git_branch)\[\033[00m\] > $(update_open_jira_task_bat)'


# Set Tab name:
echo -ne "\e]0;TERMINAL\a"

# Switch to work directory
cd ~/Work

# Mount share:
mkdir ~/share -p && sudo mount -t vboxsf wd ~/share/

fortune -s -n 100 | cowsay -f $(cowsay -l | sed "1 d" | tr ' ' '\n' | shuf -n 1)

clear

echo 
echo "Running containers:"
echo

podman container ls

echo
echo
echo

