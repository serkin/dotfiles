#!/usr/bin/env bash

DOTFILE_PATH="$HOME/.dotfiles"

rm -rf $DOTFILE_PATH 2>/dev/null
git clone --depth=1 https://github.com/serkin/dotfiles.git $DOTFILE_PATH




cp_files() {

DOTFILE_PATH="$HOME/.dotfiles/"
FILES=".vimrc .csshrc"

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