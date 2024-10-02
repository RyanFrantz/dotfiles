function _start_ssh_agent
        echo "Initializing ssh-agent..."
        # Ensure these variables have universal scope.
        ssh-agent -c | sed 's/^setenv/set -Ux/' | sed 's/^echo/#echo/' > $SSH_ENV_FISH
        chmod 600 $SSH_ENV_FISH
        source $SSH_ENV_FISH > /dev/null # source the output to set some env vars
end
