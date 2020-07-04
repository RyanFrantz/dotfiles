function _start_ssh_agent
        echo "Initializing ssh-agent..."
        ssh-agent -c | sed 's/^setenv/set/' | sed 's/^echo/#echo/' > $SSH_ENV_FISH
        chmod 600 $SSH_ENV_FISH
        source $SSH_ENV_FISH > /dev/null # source the output to set some env vars
end
