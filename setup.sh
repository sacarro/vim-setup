#!/bin/bash

CWD=`pwd`

hasVim=`which vim 1>/dev/null 2>/dev/null`
if [ $? -ne 0 ]; then
    sudo apt-get install vim
fi

hasCurl=`which curl 1>/dev/null 2>/dev/null`
if [ $? -ne 0 ]; then
    sudo apt-get install curl
fi

# Get the .vimrc file going
if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc_BACKUP 
fi 

echo "set tabstop=4" > ~/.vimrc
echo "set shiftwidth=4" >> ~/.vimrc
echo "set softtabstop=4" >> ~/.vimrc
echo "set smarttab" >> ~/.vimrc
echo "set expandtab" >> ~/.vimrc
echo "set number" >> ~/.vimrc
echo "set showcmd" >> ~/.vimrc

# Now start building the plugins

################# Pathogen ########################
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "execute pathogen#infect()" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc

################# Sensible ########################
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-sensible.git

################# Solarized ########################
cd ~/.vim/bundle && \
git clone git://github.com/altercation/vim-colors-solarized.git
echo "syntax enable" >> ~/.vimrc

################# Surround ########################
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-surround.git

################# Fugitive ########################
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-fugitive.git && \
vim -u NONE -c "helptags vim-fugitive/doc" -c q
echo "set statusline=%<\ %{fugitive#statusline()}\ %f\ %m%r%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)" >> ~/.vimrc

################# Less ########################
cd ~/.vim/bundle && \
git clone https://github.com/groenewege/vim-less

################# JavaScript ########################
cd ~/.vim/bundle && \
git clone https://github.com/pangloss/vim-javascript.git
#echo "set javascript_enable_domhtmlcss=1" >> ~/.vimrc

################# HTML 5 ########################
cd ~/.vim/bundle && \
git clone https://github.com/othree/html5.vim.git

################# Angular ########################
cd ~/.vim/bundle && \
git clone git://github.com/burnettk/vim-angular.git

################# JavaScript Libraries ########################
cd ~/.vim/bundle && \
git clone https://github.com/othree/javascript-libraries-syntax.vim.git
echo "autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1"  >> ~/.vimrc
echo "autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0"  >> ~/.vimrc

################# Syntastic ########################
cd ~/.vim/bundle && \
git clone https://github.com/scrooloose/syntastic.git
echo "set statusline+=%#warningmsg#" >> ~/.vimrc
echo "set statusline+=%{SyntasticStatuslineFlag()}" >> ~/.vimrc
echo "set statusline+=%*" >> ~/.vimrc

echo "let g:syntastic_always_populate_loc_list = 1" >> ~/.vimrc
echo "let g:syntastic_auto_loc_list = 1" >> ~/.vimrc
echo "let g:syntastic_check_on_open = 1" >> ~/.vimrc
echo "let g:syntastic_check_on_wq = 0" >> ~/.vimrc
echo "let g:syntastic_javascript_checkers = ['jshint']" >> ~/.vimrc

################# JS Beautify ########################
cd ~/.vim/bundle
git clone https://github.com/maksimr/vim-jsbeautify.git
cd vim-jsbeautify && git submodule update --init --recursive
echo "autocmd FileType javascript noremap <buffer>  <F3> :call JsBeautify()<cr>" >> ~/.vimrc
echo "autocmd FileType html noremap <buffer> <F3> :call HtmlBeautify()<cr>" >> ~/.vimrc

# Setup the config
echo "; .editorconfig" > ~/.vim/.editorconfig
echo "" >> ~/.vim/.editorconfig
echo "root = true" >> ~/.vim/.editorconfig
echo "" >> ~/.vim/.editorconfig
echo "[**.js]" >> ~/.vim/.editorconfig
echo "indent_style = space" >> ~/.vim/.editorconfig
echo "indent_size = 4" >> ~/.vim/.editorconfig
echo "" >> ~/.vim/.editorconfig
echo "[**.jsx]" >> ~/.vim/.editorconfig
echo "e4x = true" >> ~/.vim/.editorconfig
echo "indent_style = space" >> ~/.vim/.editorconfig
echo "indent_size = 4" >> ~/.vim/.editorconfig
echo "" >> ~/.vim/.editorconfig
echo "[**.css]" >> ~/.vim/.editorconfig
echo "indent_style = space" >> ~/.vim/.editorconfig
echo "indent_size = 4" >> ~/.vim/.editorconfig
echo "" >> ~/.vim/.editorconfig
echo "[**.html]" >> ~/.vim/.editorconfig
echo "indent_style = space" >> ~/.vim/.editorconfig
echo "indent_size = 4" >> ~/.vim/.editorconfig
echo "max_char = 78" >> ~/.vim/.editorconfig
echo "brace_style = expand" >> ~/.vim/.editorconfig

################# jDaddy ########################
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-jdaddy.git


