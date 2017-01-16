# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER="kubuxu"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/usr/share/zsh/plugins/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast history last-working-dir sudo taskwarrior git-flow-avh hub)
plugins+=(archlinux common-aliases autojump)

# User configuration

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

if [[ $ENV_IS_HERE!=yes ]]; then
	export GOPATH="$HOME/go/"
	export GOBIN="$GOPATH/bin"
	export EDITOR="vim"
	export VISUAL="$EDITOR"

	path=("$HOME/bin" "$GOPATH/bin" "/usr/local/bin" $path)
	fpath+=("$DOTFILES/zshcompletions")
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

	export AURDEST="$HOME/AUR/"
	export MAKEFLAGS="-j4"

	# npm
	NPM_PACKAGES="$HOME/.npm-global"
	path+=("$NPM_PACKAGES/bin")

	unset MANPATH
	export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


	export PATH
	export ENV_IS_HERE="yes"
fi

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir $ZSH_CACHE_DIR
fi

DOTFILES="$HOME/dotfiles"
if [[ ! -e "$DOTFILES/dir_colors" ]]; then
	echo "Regenerated dircolors"
	dircolors $DOTFILES/dircolors-solarized/dircolors.ansi-dark > "$DOTFILES/dir_colors"
fi
source "$DOTFILES/dir_colors"
source "$DOTFILES/zshaliases"
source "$DOTFILES/zshfunctions"

if [[ ! "$TERM" == "linux" ]]; then
	source $ZSH/oh-my-zsh.sh
fi

zstyle ":completion:*" users kubuxu ksztand
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD' # ignore ORIGIN_HEAD, it is annoying

source "$DOTFILES/zshcompinstall"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fasd
eval "$(fasd --init auto)"

