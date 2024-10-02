function start_ssh_agent
    # If everything's kosher, carry on.
    if ssh_agent_is_running && ssh_agent_auth_socket_exists
      echo "ssh-agent is running as expected"
      return
    end

    _start_ssh_agent
end
