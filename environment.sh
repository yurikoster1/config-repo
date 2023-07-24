# Path to JetBrains Toolbox scripts
if [ -d "/home/yurik/.local/share/JetBrains/Toolbox/scripts" ]; then
    export PATH="/home/yurik/.local/share/JetBrains/Toolbox/scripts:$PATH"
fi

# Add other paths conditionally based on their existence
if [ -d "/opt/" ]; then
    export PATH="/opt/:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# Check if nvm is installed and load it if found
if [ -f "$HOME/.nvm/nvm.sh" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
