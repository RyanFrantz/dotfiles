# Source custom aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Ensure we clean up any lingering ssh-agent processes on shell exit.
trap 'test -n "$SSH_AGENT_PID" && eval `ssh-agent -k`' 0

start_ssh_agent

tab_title frantz
