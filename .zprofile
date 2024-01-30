############-Configurations for zsh-############
#export XDG_CONFIG_HOME=$HOME/.config
#export XDG_CACHE_HOME=$HOME/.cache
#export XDG_DATA_HOME=$HOME/local/share
export ZDOTDIR=$HOME/.config/zsh 
export QT_QPA_PLATFORMTHEME=qt5ct                                                                                                                                                     26s
################################################

#Starting Xserver
#startx


# Github authentication with ssh key
SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
