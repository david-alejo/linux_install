#! /bin/bash
alias gt="git status --porcelain"
alias gpull="git pull"
alias gpush="git push"
alias gf="git fetch"
alias ..="cd .."

# Alias for marsupial docker
alias ms_dock="rocker --network host --x11 --user --home --mode interactive marsupial"
alias connect_dock="docker exec -it \"$(docker ps | cut -d' ' -f1 | tail -1)\" /bin/bash"
alias ms_ros1="source ~/marsupial_ws/devel/setup.bash && export IGNITION_VERSION=fortress"
alias arco_core="export ROS_MASTER_URI=http://arco:11311"
alias local_core="export ROS_MASTER_URI=http://localhost:11311"
alias drone="ssh drone@drone"
alias arco="ssh idmind@arco"
alias cm="cd ~/marsupial_ws && source devel/setup.bash && export IGNITION_VERSION=fortress && catkin_make"
alias set_dji="cd ~/marsupial_ws/src/Onboard-SDK-ROS/Onboard-SDK-3.8.1-build/ && sudo make install && cd"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias mkdir='mkdir -pv'
# handy short cuts #
alias h='history'
alias j='jobs -l'
## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias df='df -H | grep -v "loop" | grep -v "tmp" '
alias duc='du -ch'
alias dus='du -sh'
alias revert='git checkout --force'
alias status-remote='git status -uno'
