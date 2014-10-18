OS = $(shell uname)

dir:
	mkdir -p ./vim/bundle

link:	unlink 
	ln -sf `pwd`/vimrc $$HOME/.vimrc
	ln -sf `pwd`/vim $$HOME/.vim

unlink:
	rm -rf $$HOME/.vim 
	rm -rf $$HOME/.vimrc

install: dir link setup_fonts 
	git clone https://github.com/gmarik/vundle ./vim/bundle/vundle
	vim +PluginInstall +qall
	cd vim/bundle/YouCompleteMe; ./install.sh
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
