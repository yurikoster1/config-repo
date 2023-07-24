

# Check if 'batcat' exists in the PATH
if command -v batcat &>/dev/null; then
    # If 'batcat' exists, create an alias for 'bat' pointing to 'batcat'
    alias bat='batcat'
fi

if command -v bat &>/dev/null; then
    alias cat="bat"
    alias catl="bat --plain --paging=never"
    alias tb='tail -n +1 -f "$@" | batcat --paging=never'
    alias batlog='tail -n +1 -f "$@" | batcat --style=grid --paging=never -l log'
fi

# Check if 'exa' exists in the PATH, and if so, create an alias for 'ls' pointing to 'exa -l'
if command -v exa &>/dev/null; then
    alias ls="exa -l"
fi

# Check if 'java' and '/opt/bfg/bfg.jar' exist
if command -v java &>/dev/null && [ -f "/opt/bfg/bfg.jar" ]; then
    alias bfg="java -jar /opt/bfg/bfg.jar"
fi

# Check if 'git' is available, and if 'gfi' alias is not already defined, define it
if command -v git &>/dev/null && ! git config --global --get-regexp "^alias\.gfi\s" >/dev/null 2>&1; then
    git config --global alias.gfi "config core.fileMode false"
fi


if [ -f ~/Documents/Projects/arbi/.keys/chaves.txt ]; then
    # If the file exists, create an alias 'arbi_chaves' to cat the file
    alias arbi_chaves="cat ~/Documents/Projects/arbi/.keys/chaves.txt"
fi



# Check if 'lazydocker' is installed and available in the PATH
if command -v lazydocker &>/dev/null; then
    # 'lazydocker' is installed and available, create an alias for 'lzd'
    alias lzd="lazydocker"
else
    # 'lazydocker' is not in the PATH, check if it's installed at $HOME/.local/bin
    if [ -x "$HOME/.local/bin/lazydocker" ]; then
        # If 'lazydocker' is installed at $HOME/.local/bin, add it to the PATH
        export PATH="$HOME/.local/bin:$PATH"
        # Create an alias for 'lzd'
        alias lzd="lazydocker"
    fi
fi

