function start_ssh_agent
    echo -e "\nTesting that agent environment information exists..."
    if test -f "$SSH_ENV_FISH"
        source $SSH_ENV_FISH
    else
        set_color yellow; echo "No agent environment information found!"; set_color normal
        _start_ssh_agent
        return
    end

    echo -e "Testing for agent forwarding..."
    # Test for agent forwarding. If we're forwarding, running/using a local agent
    # will interfere.
    if ssh_agent_is_forwarding
		set_color yellow
        echo "SSH agent forwarding detected. I will not start ssh-agent."
		set_color normal
        return
    end

    echo -e "Testing for an existing ssh-agent..."
    if ssh_agent_is_running
		set_color yellow
        echo "ssh-agent is already running!"
		set_color normal
        # Attempt to source the relevant environment variables that will allow
        # us to use the existing agent.
        source $SSH_ENV_FISH > /dev/null # source the output to set some env vars
        # Test we can talk to the agent.
        ssh-add -l 2>&1 > /dev/null
        set result $status
        # 0 == we have keys; 1 == we can talk to the agent but no keys are loaded.
        if test $result -eq 0 -o $result -eq 1
            set_color green; echo "Successfully confirmed ssh-agent is accessible."; set_color normal
			return
        else
            set_color red; echo "Failed to connect to ssh-agent!"; set_color normal
            return 1
        end
    else
        _start_ssh_agent
        return
    end
end
