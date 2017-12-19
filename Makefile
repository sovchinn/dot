.PHONY: all clean config install update clean-all patch

all: install 

clean:
	rm -rf $(HOME)/dot/.vim/bundle 
	rm -rf $(HOME)/dot/.vim/plugged 
	rm -rf $(HOME)/.zprezto
	rm -rf $(HOME)/.config/nvim

config:
	mkdir -p $(HOME)/.config/nvim 
	mkdir -p $(HOME)/.vim
	ln -sf $(HOME)/dot/.vim/nvimrc $(HOME)/.config/nvim/init.vim 
	ln -sf $(HOME)/dot/.vim/nvimrc.local $(HOME)/.config/nvim/local_init.vim
	ln -sf $(HOME)/dot/.vim/nvimrc.local.bundles $(HOME)/.config/nvim/local_bundles.vim

	ln -sf $(HOME)/dot/.vim/vimrc $(HOME)/.vim/vimrc
	ln -sf $(HOME)/dot/.vim/vimrc.local $(HOME)/.vim/vimrc.local
	ln -sf $(HOME)/dot/.vim/vimrc.local.bundles $(HOME)/.vim/vimrc.local.bundles

	ln -svf $(HOME)/dot/.zshrc $(HOME)/.zshrc
	ln -svf $(HOME)/dot/.zpreztorc $(HOME)/.zpreztorc

install: clean update config 
	@echo "Install zprezto" 
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto" 
	ln -svf $(HOME)/dot/.zshrc $(HOME)/.zshrc 
	ln -svf $(HOME)/.zprezto/runcoms/zlogin $(HOME)/.zlogin 
	ln -svf $(HOME)/.zprezto/runcoms/zlogout $(HOME)/.zlogout 
	ln -svf $(HOME)/.zprezto/runcoms/zpreztorc $(HOME)/.zpreztorc 
	ln -svf $(HOME)/.zprezto/runcoms/zprofile $(HOME)/.zprofile  
	ln -svf $(HOME)/.zprezto/runcoms/zshenv $(HOME)/.zshenv  

update: 
	@echo "Downloading new vimrc..."
	curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=go&langs=html&langs=javascript&langs=python&editor=nvim' > $(HOME)/dot/.vim/nvimrc
	curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=go&langs=html&langs=javascript&langs=python&editor=vim' > $(HOME)/dot/.vim/vimrc
	@echo "Check in changes to gh"
	@echo "Run make install to get a clean build"

clean-all: clean
	rm -rf $(HOME)/dot/.vim/autoload

patch:
	sed -i 's/colorscheme/silent!colorscheme/g' $(HOME)/.config/nvim/init.vim
