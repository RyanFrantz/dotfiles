# Ensure SSH_ENV_FISH is exported and known across all fish instances.
if test -z "$SSH_ENV_FISH"
    set -Ux SSH_ENV_FISH $HOME/.ssh/agent_environment.fish
end

start_ssh_agent

# Fish syntax highlighting
set -g fish_color_command normal # Better legibility

# Launch starship.
starship init fish | source
