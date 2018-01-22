#!/usr/bin/env bash

# install.sh update

if [ ! -d ~/.dotfiles ]; then
    echo "Installing Dotfiles for the first time"
    git clone --depth=1 https://github.com/serkin/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
else
    if [ "$1" = "update" ]; then

      rm -rf ~/.dotfiles
      git clone --depth=1 https://github.com/serkin/dotfiles.git ~/.dotfiles
    fi
fi




cp_files() {

DOTFILE_PATH="~/.dotfiles/"
FILES=".vimrc"

for file in $FILES
do

    rewrite_file="N"

    if [[ -f "$file" ]] && [[ $(cat $file 2>/dev/null) != $(cat $DOTFILE_PATH$file 2>/dev/null) ]]; then
        read -p "Rewrite $file ? [Y]: " rewrite_file

        if [[ -z "$rewrite_file" ]]; then
            rewrite_file="Y"
        fi

        if [[ "$rewrite_file" = "Y" ]]; then
            rm ~/$file 2>/dev/null
            cp $DOTFILE_PATH$file ~/$file
        else
            echo "Skip $file"
        fi
     fi
done

}

cp_files