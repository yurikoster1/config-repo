# Path to JetBrains Toolbox scripts
if [ -d "/home/yurik/.local/share/JetBrains/Toolbox/scripts" ]; then
    export PATH="/home/yurik/.local/share/JetBrains/Toolbox/scripts:$PATH"
fi

# Add other paths conditionally based on their existence
if [ -d "/opt/" ]; then
    export PATH="/opt/:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Check if nvm is installed and load it if found
if [ -f "$HOME/.nvm/nvm.sh" ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


# Check and add directories to PATH if they exist and are not already in PATH
if [ -d "$HOME/bin" ] && ! case ":$PATH:" in *":$HOME/bin:"*) true;; *) false;; esac; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/bin" ] && ! case ":$PATH:" in *":/usr/local/bin:"*) true;; *) false;; esac; then
    export PATH="/usr/local/bin:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] && ! case ":$PATH:" in *":/var/lib/flatpak/exports/bin/:"*) true;; *) false;; esac; then
    export PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.local/bin" ] && ! case ":$PATH:" in *":$HOME/.local/bin:"*) true;; *) false;; esac; then
    export PATH="$HOME/.local/bin:$PATH"
fi


if [ -d "/usr/local/cuda-12.2/bin" ] && ! case ":$PATH:" in *":/usr/local/cuda-12.2/bin:"*) true;; *) false;; esac; then
	export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}
	export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
