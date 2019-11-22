install: install-vim install-zsh install-ssh install-git install-ohmyzsh install-iterm-colorscheme

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim/.vim ~/.vim
	ln -s `pwd`/vim/.vimrc ~/.vimrc

install-zsh:
	rm -rf ~/.zshrc ~/.alias
	ln -s `pwd`/zsh/.zshrc ~/.zshrc
	ln -s `pwd`/zsh/.alias ~/.alias

install-git:
	rm -rf ~/.gitconfig ~/.gitignore
	ln -s `pwd`/git/.gitconfig ~/.gitconfig
	ln -s `pwd`/git/.gitignore ~/.gitignore

install-ssh:
	rm -rf ~/.ssh/config
	ln -s `pwd`/ssh/config ~/.ssh/config

install-python-rc:
	rm -rf ~/.pythonrc.py
	ln -s `pwd`/python/pythonrc.py ~/.pythonrc.py

install-ohmyzsh:
	rm -rf ~/.oh-my-zsh ~/.zsh-pure
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	git clone https://github.com/sindresorhus/pure.git ~/.zsh-pure

install-iterm-colorscheme:
	open iterm/tomorrow-night-eighties.itermcolors

install-brew-packages:
	brew bundle --file=brew/Brewfile
