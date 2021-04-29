#! /bin/bash


# Add git branch, git status and system time to the prompt
parse_git_status() {
    st=$(git status --porcelain 2>/dev/null)
    if [[ $st != "" ]]
    then
        echo "*"
    fi
}
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_status))/"
}

red_txt="\[\033[31m\]"
green_txt="\[\033[32m\]"
normal_txt="\[\033[00m\]"
time_tag="${green_txt}[\A]"
ORIGINAL_PS1=${PS1}
PS1="${time_tag}"
PS1+="${red_txt}"
PS1+='$(parse_git_branch)'
PS1+="${normal_txt}"
PS1+=${ORIGINAL_PS1}