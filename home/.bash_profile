# Source custom aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Ensure we clean up any lingering ssh-agent processes on shell exit.
trap '
  test -n "$SSH_AGENT_PID" && eval `ssh-agent -k`;
  test -f $HOME/.ssh/agent_environment && rm -f $HOME/.ssh/agent_environment;
  unset SSH_ENV SSH_AGENT_PID SSH_AUTH_SOCK
' 0

start_ssh_agent

tab_title frantz

. /usr/local/opt/asdf/asdf.sh
