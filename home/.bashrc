# .bashrc

# I want my GNU utils, people!  (via homebrew)
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# I dig dem colors!
## BSD `ls`
alias ls="ls -G"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
## GNU `ls`
#alias ls="ls --color=auto"  # GNU `ls`
#dircolors -p > ~/.dircolors
#eval "`dircolors -b ~/.dircolors`"

alias farg="find . -type f | xargs grep $@"

# "[login@hostname ~/git/dotfiles] $"
PS1="[\t \[\e[34;1m\]\u\[\e[0m\]@\[\e[34;1m\]\h\[\e[0m\] \[\e[33;1m\]\W\[\e[0m\]]\$ "
export PS1

MY_SSH_KEYFILE=""
# fire up ssh-agent; lifted/modded from http://mah.everybody.org/docs/ssh
export SSH_ENV="$HOME/.ssh/environment"
function start_agent {
     echo -e "\n\t===== `hostname` =====\n"
     echo "Initializing ssh-agent..."
     ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"    # capture the output; comment the 'echo'
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null # source the output to set some env vars
     /usr/bin/ssh-add   # add mah key!
     if [ -f $MY_SSH_KEYFILE ]
     then
         /usr/bin/ssh-add $MY_SSH_KEYFILE
     fi
}

# history-related config
# enable HISTAPPEND; I'm in several shells at once!!!
shopt -s histappend
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=10000

export EDITOR=vim

export GREP_OPTIONS="--color=auto"

export PROMPT_DIRTRIM=3

#========== COLORS =========#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
RED="\[\033[31m\]"
LIGHT_RED="\[\033[1;31m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

# functions
# Set the tab title in iTerm2.
function tab_title {
    echo -ne "\033]0;"$*"\007"
}

# Tell us which branch we're on, if we're in a git repo.
function get_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Return count of uncommitted files in git repo.
function uncommitted_file_count {
    git status --porcelain 2>/dev/null| egrep "^(M| M|A|R)" | wc -l
}

# Return count of untracked files in git repo.
function untracked_file_count {
    git status --porcelain 2>/dev/null| grep "^??" | wc -l
}

function prompt_func() {
    previous_return_value=$?;
    data_center_domain=`hostname | awk -F . '{print $2}'`
    #prompt="${TITLEBAR}${LIGHT_BLUE}[${LIGHT_GREEN}\u${COLOR_NONE}@${CYAN}\h.${data_center_domain} ${WHITE}\w${GREEN}${LIGHT_BLUE}]${COLOR_NONE}"
    prompt="${TITLEBAR}${LIGHT_BLUE}[${LIGHT_GREEN}\u${COLOR_NONE}@${CYAN}\h.${data_center_domain} ${WHITE}\w${GREEN}${LIGHT_BLUE}]${COLOR_NONE}"
    in_git_repo=$(get_git_branch)
    if [ $in_git_repo ]; then
        GIT_PROMPT="${LIGHT_GREEN}\$(get_git_branch)${COLOR_NONE}" # Default.
        if [ $(uncommitted_file_count) -gt 0 ]; then
            GIT_PROMPT="${CYAN}\$(get_git_branch)${COLOR_NONE}"
        fi
        if [ $(untracked_file_count) -gt 0 ]; then
            GIT_PROMPT="${LIGHT_YELLOW}\$(get_git_branch)${COLOR_NONE}"
        fi
        prompt="${prompt} ${GIT_PROMPT}"
    fi
    if [ $previous_return_value == 0 ]
    then
        export PS1="${prompt} $ "
    else
        export PS1="${prompt}${LIGHT_RED} OOPS! $ ${COLOR_NONE}"
    fi
}

# This way you get the host/path in the title bar and the pretty PS1 _and_ history is appended all the time
PROMPT_COMMAND='prompt_func && history -a'

# Source homeshick config.
# https://github.com/andsens/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
