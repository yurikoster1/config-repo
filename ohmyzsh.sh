# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ -f "$HOME/.oh-my-zsh/themes/powerlevel10k.zsh-theme" ] || [ -f "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" ]; then
	ZSH_THEME="powerlevel10k/powerlevel10k"
else
	ZSH_THEME="Soliah"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="[%Y-%m-%d %T] "

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(git-flow-completion rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git-flow-completion git laravel docker docker-compose git-flow gitignore history minikube safe-paste thefuck alias-finder history colorize zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete autojump)
plugins=(git colorize laravel docker docker-compose git-flow gitignore github history minikube safe-paste thefuck alias-finder autojump )

# Check if 'git-flow-completion' is installed and load the plugin
if [ -d "$ZSH_CUSTOM/plugins/git-flow-completion" ]; then
    plugins+=(git-flow-completion )
fi

# Check if 'fast-syntax-highlighting' is installed and load the plugin
if [ -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
    plugins+=(fast-syntax-highlighting)
fi

# Check if 'zsh-autocomplete' is installed and load the plugin
if [ -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
    plugins+=(zsh-autocomplete)
fi

# Check if 'zsh-autosuggestions' is installed and load the plugin
if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    plugins+=(zsh-autosuggestions)
fi
if [ -d "$ZSH_CUSTOM/plugins/zsh-nvm" ]; then
	export NVM_AUTO_USE=true
	export NVM_LAZY_LOAD=true
	export NVM_COMPLETION=true
	plugins+=(zsh-nvm)
fi

# Check if 'zsh-better-npm-completion' is installed and load the plugin
if [ -d "$ZSH_CUSTOM/plugins/zsh-better-npm-completion" ]; then
    plugins+=(zsh-better-npm-completion)
fi

#httpie
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias kubectl="minikube kubectl --"

ZSH_COLORIZE_STYLE="dracula"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
