#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin;

function doIt() {

    # folders
    cp -a .aws ~;
    cp -a .ssh ~ && chmod 700 ~/.ssh;
    cp -a .vim ~;
#    cp -a bin ~;
#    cp -a init ~;

    # files
    cp -a .aliases ~;
    cp -a .bash_profile ~;
    cp -a .bash_prompt ~;
    cp -a .bashrc ~;
    cp -a .curlrc ~;
#    cp -a .editorconfig ~;
    cp -a .exports ~;
    cp -a .functions ~;
#    cp -a .gdbinit ~;
#    cp -a .gvimrc ~;
#    cp -a .hgignore ~;
    cp -a .hushlogin ~;
    cp -a .inputrc ~;
#    cp -a .mrjob.conf ~;
    cp -a .s3cfg ~;
    cp -a .screenrc ~;
    cp -a .vimrc ~;
    cp -a .wgetrc ~;

   source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
