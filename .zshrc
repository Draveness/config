ZSH_THEME="avit"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="$ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir rbenv vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history ip)
#POWERLEVEL9K_TIME_BACKGROUND='white'
plugins=(git)

export TERM=xterm-256color

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export EDITOR=vim
export ALTERNATE_EDITOR='TERM=xterm-256color emacsclient -nw'
export EDITOR='TERM=xterm-256color emacsclient -nw'
export VISUAL='TERM=xterm-256color emacsclient -nw'
export CLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs/workspace"

# Alias
alias et="emacsclient -t"
openInEmacs() {
    emacsclient -c $1 &
}
alias ec=openInEmacs
#alias ef="emacsclient -t $(fzf)"
alias xc="find . -name '*.xcworkspace' -maxdepth 2 | grep -v xcodeproj | head -n 1 | xargs open" # open first workspace in current folder
alias xp="find . -name '*.xcodeproj'  -maxdepth 1 | head -n 1 | xargs open" # open first xcode project in current folder
alias vz='vim ~/.zshrc'
alias rp="postgres -D /usr/local/var/postgres"
alias a="open -a Atom ."
alias o="open "
alias oc="open ."
alias atm="open -a Atom "
alias rh="source ~/.zshrc"
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias cat="ccat"
copyToBoard() {
    cat $1 | pbcopy
}
alias pp=copyToBoard

alias ga='git add .'
alias gd='git diff'
alias gam='git add -A && git commit'
alias gamm='git add -A && git commit -m'
autoPush() {
    git add -A
    git commit -m $1
    git push
}
gitFetchAndMerge() {
    git fetch $1
    git merge "$1/$2"
}
gitFetchAndMergeAndPush() {
    git fetch $1
    git merge "$1/$2"
    git push
}
alias gfm=gitFetchAndMerge
alias gfmp=gitFetchAndMergeAndPush
alias g=autoPush
alias gp='git push'
alias gpt='git push --tags'
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias gcid="git log | head -1 | awk '{print substr(\$2,1,7)}' | pbcopy"
alias gc="git clone"
# for docker
alias dk="docker "
alias dra="docker rm `docker ps -aq`"
# for cocoapods
alias pi='pod install'
alias pu='pod update'
podInstallInExampleFolder() {
    sh -c 'cd ./Example && pod install'
}
alias pie=podInstallInExampleFolder

alias dc="cd ~/Desktop"
alias ..='cd ..'
alias ...='cd ../..'
alias ....=' cd ../../..'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim '
alias v='vim'
alias ve='vim -u ~/Desktop/code/essential.vim'
alias v.='vim .'
alias c='clear'
alias rh="runhaskell"
alias cl="rm .*.*.un~ && rm ..*.un~ && rm .*.un~"
alias cx="chmod u+x "
alias p4="proxychains4 "
alias backup="$BLOG/backup.sh "
alias rails5="~/rails/railties/exe/rails"
alias pin="pod install --no-repo-update"
alias new_post="ssh blog 'cd /srv/jekyll/ && git pull && jekyll build'"

# the fuck
eval $(thefuck --alias)

# SSH
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
eval $(/usr/libexec/path_helper -s)

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# added by travis gem
[ -f /Users/draveness/.travis/travis.sh ] && source /Users/draveness/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export https_proxy=http://127.0.0.1:1235;export http_proxy=http://127.0.0.1:1235

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/draveness/.sdkman"
[[ -s "/Users/draveness/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/draveness/.sdkman/bin/sdkman-init.sh"
