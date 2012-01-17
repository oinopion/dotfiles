install: install-vim install-zsh install-ssh install-git

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

install-ssh:
	rm -rf ~/.ssh/config
	ln -s `pwd`/ssh/config ~/.ssh/config

