#! /bin/bash

source ~/.aliases

# Virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper.sh

export PATH=/usr/local/Cellar/ruby/1.9.3-p194/bin:/usr/local/share/python:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#export PATH=$PATH:~/src/android-sdk-macosx/tools:~/src/andoid-sdk-macosx/platform-tools
export NODE_PATH=/usr/local/lib/node_modules

export ARCHFLAG='-arch x86_64'
export CFLAGS='-arch x86_64'

# fancy up my prompt
export PS1='\[\e[1;32m\]\u\[\e[m\]\[\e[0;31m\][∴]\[\e[m\]\h:\w$ '
