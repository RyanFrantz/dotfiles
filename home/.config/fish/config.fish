# Ensure SSH_ENV_FISH is exported and known across all fish instances.
set -g SSH_ENV_FISH $HOME/.ssh/agent_environment.fish

start_ssh_agent

# Fish syntax highlighting
set -g fish_color_command normal # Better legibility

# Launch starship.
starship init fish | source

# Created by `pipx` on 2023-02-03 00:18:41
set PATH $PATH /Users/ryan/.local/bin
