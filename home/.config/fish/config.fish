# Pull in homeshick support

source "$HOME/.homesick/repos/homeshick/homeshick.fish"
# Ensure SSH_ENV_FISH is exported and known across all fish instances.
set -g SSH_ENV_FISH $HOME/.ssh/agent_environment.fish

start_ssh_agent

# Fish syntax highlighting
set -g fish_color_command normal # Better legibility

# Launch starship.
starship init fish | source

if test (uname -s) = "Darwin"
    source (brew --prefix asdf)/asdf.fish
end
