
# ZSH
#
ZSH_THEME="sordina"
ZSH=$HOME/.oh-my-zsh
plugins=(git brew)
source $ZSH/oh-my-zsh.sh

# Paths
#
addpath() { export PATH="$1:$PATH" }

addpath /usr/local/go/bin
addpath /opt/local/sbin
addpath /usr/local/git/bin
addpath /opt/local/bin
addpath /Applications/MacVim.app/Contents/MacOS
addpath /Users/lyndon/.cabal/bin
addpath /Users/lyndon/Library/Haskell/bin
addpath /usr/bin
addpath /bin
addpath /usr/sbin
addpath /sbin
addpath /opt/local/bin
addpath /usr/X11R6/bin
addpath /usr/local/bin
addpath /usr/local/texlive/2012basic/bin/universal-darwin
addpath ~/ruby_versions/ruby-2.1.0-r43832/bin
addpath ~/Code/apache-maven-3.1.1/bin
addpath /Applications/Postgres.app/Contents/MacOS/bin
addpath ~/Code/gradle-1.10/bin

### Added by the Heroku Toolbelt
addpath /usr/local/heroku/bin

# GHC
# addpath ~/ghc_versions/7.8.20140130/bin

# Add home bin as highest precedence
addpath /Users/lyndon/bin

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL:/usr/local/mysql/bin/
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules/

# Aliases

alias     v=vim
alias    vi=vim
alias     e="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system --no-splash"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system --no-splash"
alias  egui="/Applications/Emacs.app/Contents/MacOS/Emacs --no-splash"
alias   adb="/Users/lyndon/Code/adt-bundle-mac-x86_64-20131030/sdk/platform-tools/adb"

alias c="clear"
alias l="ls -GlhF"
alias ls="ls -GF"
alias ll="ls -GalhF"

alias rb="irb"
alias j=/Applications/j64-701/bin/jconsole
alias gm="/usr/local/bin/gm"

alias ec2="ssh ec2 -t 'screen -DR'"

alias mongostart="mongod run --config /usr/local/etc/mongod.conf"

function mkdircd {
	if [ ! "$1" ]
	then
		echo "Usage: mkdircd <directory>"
		return 1
	else
		mkdir $1 && cd $1
	fi
}

alias mc="mkdircd"

function dot_png      { dot -Tpng:quartz:quartz "$1" -o"$2" }

function ec2git-clone { git clone git@ec2-git:$1 }
function ec2git-admin {
	pushd ~/Documents/Code/gitolite-admin/conf
	vim gitolite.conf
	and git add gitolite.conf
	and git commit -m "Updating git conf"
	and git push
	popd
}

function cabal_unpack {
	echo "Cabal Unpacking $1"
	pushd ~/Code
	ls | grep "^$1"
	if [ $? != 0 ]
	then
		echo "$1" not found
		echo checking out "$1"
		cabal unpack $1
	fi
	pushd $1*
	vim *.cabal
	popd
	popd
}

alias cu="cabal_unpack"

# Tab Colors:
# e.g. tab-color 255 0 14
#
tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

blue()   { tab-color 55 55 250 }
red()    { tab-color 250 25 25 }
green()  { tab-color 25 250 25 }
lime()   { tab-color 200 250 10}
purple() { tab-color 200 10 250 }
