# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zemm-blinks"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial osx python nyan brew compleat fabric pip vagrant encode64 autojump fabric)

source $ZSH/oh-my-zsh.sh
source ~/.aliases

# Virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper.sh

# Customize to your needs...
export PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/go/bin:/Users/ryana/.rvm/bin:/usr/games/bin
export NODE_PATH=/usr/local/lib/node_modules
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk

if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
    export AUTOJUMP_KEEP_SYMLINKS=1
fi

# alias git to hub
eval "$(hub alias -s)"

# hub tab complete script
# # Autoload _git completion functions
if declare -f _git > /dev/null; then
  _git
fi

if declare -f _git_commands > /dev/null; then
  _hub_commands=(
    'alias:show shell instructions for wrapping git'
    'pull-request:open a pull request on GitHub'
    'fork:fork origin repo on GitHub'
    'create:create new repo on GitHub for the current project'
    'browse:browse the project on GitHub'
    'compare:open GitHub compare view'
  )
  # Extend the '_git_commands' function with hub commands
  eval "$(declare -f _git_commands | sed -e 's/base_commands=(/base_commands=(${_hub_commands} /')"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
