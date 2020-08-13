# Test if an ssh-agent process is defined and running.
function ssh_agent_is_running
    if test -n "$SSH_AGENT_PID"
        # Suppress the header from `ps`.
		set proc_name (ps -p $SSH_AGENT_PID -o comm='')
        if test "$proc_name" = "ssh-agent"
            return
        else
            return 1
        end
    else
        return 1
    end
end
