#!/usr/bin/env bash

# VIM Installation

VIM_CONFIG_FILE=vimrc

install_vim() {
  sudo apt -y install vim
}

create_vim_config_folder() {
  cd ~/ && mkdir ~/.vim
}

create_vim_folder_backup() {
  if [[ -d ~/.vim ]]; then
    cp -r ~/.vim ~/vim-backup 
    zip -r ~/vim-folder-backup.zip ~/vim-backup/
    rm -rf ~/vim-backup
  else
    create_vim_config_folder
  fi
}

create_vim_config_file_backup () {
  if [[ -e ~/.vim/"$VIM_CONFIG_FILE" ]]; then
   mv ~/.vim/vimrc ~/.vim/vimrc.backup
   rm -f ~/.vim/vimrc
  fi
}

create_vim_config_file() {
  cd ~/.vim/ && touch "$VIM_CONFIG_FILE" && echo "set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
                             
set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start" >> "$VIM_CONFIG_FILE"
}

install_vim
create_vim_folder_backup
create_vim_config_file_backup
create_vim_config_file

echo "*********"
echo "* Done! *"
echo "*********"
