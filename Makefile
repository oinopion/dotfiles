install: install-vim install-zsh install-ssh install-git install-hg download-ohmyzsh

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim/.vim ~/.vim
	ln -s `pwd`/vim/.vimrc ~/.vimrc

install-zsh:
	rm -rf ~/.zshrc
	ln -s `pwd`/zsh/.zshrc ~/.zshrc

install-git:
	rm -rf ~/.gitconfig ~/.gitignore
	ln -s `pwd`/git/.gitconfig ~/.gitconfig
	ln -s `pwd`/git/.gitignore ~/.gitignore

install-hg:
	rm -rf ~/.hgrc ~/.hgignore
	ln -s `pwd`/hg/.hgrc ~/.hgrc
	ln -s `pwd`/hg/.hgignore ~/.hgignore

install-ssh:
	rm -rf ~/.ssh/config
	ln -s `pwd`/ssh/config ~/.ssh/config

download-ohmyzsh:
	rm -rf ~/.oh-my-zsh
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
