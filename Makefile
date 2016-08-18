OS = $(shell uname)

dir:
	mkdir -p ./vim/bundle

link:	unlink
	ln -sf `pwd`/vimrc $$HOME/.vimrc
	ln -sf `pwd`/vim $$HOME/.vim
	ln -sf `pwd`/vim $$HOME/.nvim
	ln -sf `pwd`/vimrc `pwd`/vim/init.vim
	mkdir -p $$HOME/.config && ln -sf `pwd`/vim $$HOME/.config/nvim

unlink:
	rm -f $$HOME/.nvim/init.vim
	rm -f $$HOME/.vim
	rm -f $$HOME/.nvim
	rm -f $$HOME/.vimrc
	rm -f $$HOME/.config/nvim || true

install: dir link setup_fonts
	if [ ! -d ./vim/bundle/vundle ]; then git clone https://github.com/gmarik/vundle ./vim/bundle/vundle; fi
	vim +PluginInstall +qall
	cd vim/bundle/YouCompleteMe; ./install.py
	echo "Installation completed."

uninstall: unlink

setup_fonts:
	mkdir -p /tmp/fonts
	cp -R fonts/*.ttf /tmp/fonts/
	if [ X"$(OS)" = X"Darwin" ]; then \
	cd ~/Library/Fonts/; \
	elif [ X"$(OS)" = X"Linux" ]; then \
	mkdir -p ~/.fonts; cd ~/.fonts; \
	else \
	echo "Specify your font directory:"; read FONT_PATH; echo $$FONT_PATH;cd $$FONT_PATH; \
	fi; \
	cp /tmp/fonts/*.ttf .;
	rm -rf /tmp/fonts/
