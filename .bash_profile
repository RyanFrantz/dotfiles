# Source custom aliases and functions.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Set GOPATH
export GOPATH=$HOME/go

# Fire up ssh-agent; lifted/modded from http://mah.everybody.org/docs/ssh
if [ -f "${SSH_ENV}" ]
then
     . "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent | grep -v grep > /dev/null || start_agent
else
     start_agent
fi

tab_title example-name
