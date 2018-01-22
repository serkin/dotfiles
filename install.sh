#!/usr/bin/env bash

DOTFILE_PATH="$HOME/.dotfiles"

if [ ! -d $DOTFILE_PATH ]; then
    echo "Installing Dotfiles for the first time"
    git clone --depth=1 https://github.com/serkin/dotfiles.git $DOTFILE_PATH
else
    if [ "$1" = "update" ]; then

      rm -rf $DOTFILE_PATH
      git clone --depth=1 https://github.com/serkin/dotfiles.git $DOTFILE_PATH
    fi
fi




cp_files() {

DOTFILE_PATH="$HOME/.dotfiles/"
FILES=".vimrc"

for file in $FILES
do

    local_file="$HOME/$file"

    if [[ ! -f "$local_file" ]]; then
        rewrite_file="Y"
    else

        if [[ $(cat $local_file) != $(cat $DOTFILE_PATH$file) ]]; then
            read -p "Rewrite $file ? [N]: " rewrite_file

            if [[ -z "$rewrite_file" ]]; then
                rewrite_file="N"
            fi
        fi
    fi

    if [[ "$rewrite_file" = "Y" ]]; then
        rm $local_file 2>/dev/null
        cp $DOTFILE_PATH$file $local_file
        echo "Rewriting $file"
    else
        echo "Skipping $file"
    fi

done

}

cp_files