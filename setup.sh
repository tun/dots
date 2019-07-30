#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
NO_COLOR=$(tput sgr0)

apt_packages=(
	"apt-transport-https"
	"bash"
	"bash-completion"
	"ca-certificates"
	"cmatrix"
	"curl"
	"fzf"
	"git"
	"htop"
	"multitail"
	"rsync"
	"silversearcher-ag"
	"software-properties-common"
	"tig"
	"tmux"
	"tree"
	"vim-nox"
)
brew_packages=(
	"bash"
	"bash-completion"
	"cmatrix"
	"coreutils"
	"curl"
	"findutils"
	"fzf"
	"git"
	"htop"
	"hub"
	"hugo"
	"multitail"
	"rsync"
	"the_silver_searcher"
	"tig"
	"tmux"
	"tree"
	"vim"
)
casks=(
	"docker"
	"firefox"
	"google-chrome"
	"spotify"
	"the-unarchiver"
	"visual-studio-code"
	"vlc"
	# fonts
	"font-fira-code"
	"font-hack"
)


setup_brew() {
	if [ -f "$(which brew)" ]; then
		echo "${BLUE} Brew is already installed.${NO_COLOR}"
	else
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		# font casks repo
		brew tap homebrew/cask-fonts
		clear
		read -p "${RED} Install brew packages? (y/n)>${NO_COLOR} " -n 1
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			install_packages
		else
			exit 1
		fi
	fi
}


install_packages(){
	case $(uname -s) in
		Linux*)
			sudo apt update -y
			for i in "${apt_packages[@]}"
			do
				sudo apt install -y $i
			done
			sudo apt clean
			read -p "${RED} Install docker environment? (y/n)>${NO_COLOR} " -n 1
			if [[ $REPLY =~ ^[Yy]$ ]]; then
				setup_docker
			else
				exit 1
			fi
			;;
		Darwin*)
			setup_brew
			for i in "${brew_packages[@]}"
			do
				brew install $i
			done
			for i in "${casks[@]}"
			do
				brew cask install $i
			done
			# using bash from brew
			BREW_PREFIX=$(brew --prefix)
			clear
			echo "${BLUE} Installing new shell:${NO_COLOR}"
			echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells > /dev/null
			chsh -s "${BREW_PREFIX}/bin/bash"
			brew cleanup
			echo "${GREEN} All packages installed.${NO_COLOR}"
			;;
		*) echo "${RED}¯\_(ツ)_/¯${NO_COLOR}"
	esac
}


clean_up(){
	mkdir -p $HOME/.Trash
	[ -e $HOME/.bash_profile ] && mv $HOME/.bash_profile $HOME/.Trash
	[ -e $HOME/.bash_aliases ] && mv $HOME/.bash_aliases $HOME/.Trash
	[ -e $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/.Trash
	[ -e $HOME/.gitconfig ] && mv $HOME/.gitconfig $HOME/.Trash
	[ -e $HOME/.gitignore_global ] && mv $HOME/.gitignore_global $HOME/.Trash
	[ -e $HOME/.tmux.conf ] && mv $HOME/.tmux.conf $HOME/.Trash
	[ -e $HOME/.vim ] && mv $HOME/.vim $HOME/.Trash
}

setup_dots() {
	[ ! -L $HOME/.bash_profile ] && ln -s $PWD/bash/bash_profile $HOME/.bash_profile
	[ ! -L $HOME/.bash_aliases ] && ln -s $PWD/bash/bash_aliases $HOME/.bash_aliases
	[ ! -L $HOME/.bashrc ] && ln -s $PWD/bash/bashrc $HOME/.bashrc
	[ ! -L $HOME/.gitconfig ] && ln -s $PWD/git/gitconfig $HOME/.gitconfig
	[ ! -L $HOME/.gitignore_global ] && ln -s $PWD/git/gitignore_global $HOME/.gitignore_global
	[ ! -L $HOME/.tmux.conf ] && ln -s $PWD/tmux.conf $HOME/.tmux.conf
	[ ! -L $HOME/.vim ] && ln -s $PWD/vim $HOME/.vim
	touch $HOME/.hushlogin
	echo "${GREEN} Dots ready!${NO_COLOR}"
	. $HOME/.bash_profile
}

setup_docker() {
	curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable"
	sudo apt -y update
	sudo apt -y install docker-ce docker-cli containerd.io
	sudo usermod -aG docker $(whoami)
	# docker-compose
  - [ sh, -c, 'curl -L https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "tag_name" | cut -d \" -f4)/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose' ]
  - [ sh, -c, 'chmod 755 /usr/local/bin/docker-compose' ]
}

usage() {
    echo "Usage: ./setup.sh [--packages | --dots | --all | --help]"
}

if [ $# -le 0 ]; then
    usage
else
    while [ "$1" != "" ]; do
    	case $1 in
    		--packages )
    			install_packages
    			exit
    			;;
    		--dots )
    			clean_up
    			setup_dots
    			exit
    			;;
    		--rm-dots )
    			clean_up
    			exit
    			;;
    		--all )
    			install_packages
    			clean_up
    			setup_dots
    			exit
    			;;
        	-h | --help )
        		usage
        		exit
                ;;
        	* )	usage
                exit 1
    	esac
    done
fi
