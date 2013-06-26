# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export PATH=/usr/local/go/bin:$HOME/.rvm/bin:/opt/local/sbin:/Users/lyndon/.gem/ruby/1.8/bin:/usr/local/git/bin:/usr/local/bin:/opt/local/bin:/Applications/MacVim.app/Contents/MacOS:/Users/lyndon/.cabal/bin:/Users/lyndon/Library/Haskell/bin:/Users/lyndon/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/X11R6/bin:/usr/local/bin:/usr/local/texlive/2012basic/bin/universal-darwin

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL:/usr/local/mysql/bin/
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sordina" # "robbyrussell"
plugins=(git brew)
source $ZSH/oh-my-zsh.sh

# Other Plugins - rvm zsh-syntax-highlighting

# Aliases

if [[ "`uname`" == "Darwin" ]]
then
	alias   v="/Applications/MacVim.app/Contents/MacOS/vim"
	alias  vi="/Applications/MacVim.app/Contents/MacOS/vim"
	alias vim="/Applications/MacVim.app/Contents/MacOS/vim"
else
	alias   v=vim
	alias  vi=vim
fi

alias     e="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system --no-splash"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs --no-window-system --no-splash"
alias  egui="/Applications/Emacs.app/Contents/MacOS/Emacs --no-splash"

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

### RVM -- [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#
alias rvminit=". '$HOME/.rvm/scripts/rvm'"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

