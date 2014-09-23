OS = $(shell uname)

link:	unlink 
	ln -sf `pwd`/vimrc $$HOME/.vimrc
	ln -sf `pwd`/vim $$HOME/.vim

unlink:
	rm -rf $$HOME/.vim 
	rm -rf $$HOME/.vimrc

install: link download_fonts 
	git clone https://github.com/gmarik/vundle ./vim/bundle/vundle
	vim +PluginInstall +qall
	cd vim/bundle/YouCompleteMe; ./install.sh
	echo "Installation completed."

uninstall: unlink 

download_fonts:
	if [ X"$(OS)" = X"Darwin" ]; then \
	cd ~/Library/Fonts/; \
	elif [ X"$(OS)" = X"Linux" ]; then \
	mkdir -p ~/.fonts; cd ~/.fonts; \
	else \
	echo "Specify your font directory:"; read FONT_PATH; echo $$FONT_PATH;cd $$FONT_PATH; \
	fi;  \
	curl -o scp.zip https://codeload.github.com/adobe-fonts/source-code-pro/zip/1.017R; \
	unzip scp.zip;  \
	cp source-code-pro-1.017R/TTF/*.ttf .; \
	rm -rf source-code-pro-1.017R; \
	rm -f scp.zip;
