function ssh_agent_is_forwarding
    ssh_agent_auth_socket_exists && ! ssh_agent_is_running
end
