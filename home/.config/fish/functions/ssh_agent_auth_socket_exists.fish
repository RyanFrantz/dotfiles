function ssh_agent_auth_socket_exists
    test -n "$SSH_AUTH_SOCK" -a -S "$SSH_AUTH_SOCK"
end
