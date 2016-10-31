#!/usr/bin/env bash

VIMRC="set relativenumber\nset number\nset cursorline\nset cursorcolumn\nset laststatus=2\nexecute pathogen#infect()\nsyntax on\ncolorscheme PaperColor\nmap <C-n> :NERDTreeToggle<CR>\nset t_Co=256\nset background=dark\nlet g:airline#extensions#tabline#enabled = 1\n"

Plugs="https://github.com/NLKNguyen/papercolor-theme.git https://github.com/airblade/vim-gitgutter.git https://github.com/ElmCast/elm-vim.git https://github.com/scrooloose/nerdtree.git https://github.com/Yggdroot/indentLine.git https://github.com/vim-airline/vim-airline.git https://github.com/elixir-lang/vim-elixir.git"

BUNDLE=~/.vim/bundle

installPathogen () {
  if [ ! -d  "$BUNDLE" ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  fi
}

clonePlugins () {  
  for i in $Plugs
  do
    git clone $i
  done;
}

addThemeToVimColors () {
  cd ~/.vim/bundle/papercolor-theme/colors && mkdir ~/.vim/colors && cp PaperColor.vim ~/.vim/colors && echo "Color theme is now in ~/.vim/colors"
}

setVimRc () {
  echo -e $VIMRC >> ~/.vimrc
}

if [ "test vim" ] && [ "test git" ]; then 
  installPathogen && cd ~/Desktop/test && clonePlugins && addThemeToVimColors && setVimRc
else
  echo "Make sure GIT and VIM are installed on your machine."
fi
