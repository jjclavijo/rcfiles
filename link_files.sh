#!/bin/zsh

THIS=$(realpath .)

cd ~
ln -s $THIS/zshrc .zshrc
ln -s $THIS/zimrc .zimrc
ln -s $THIS/vimrc .vimrc

ln -s $THIS/gitconfigrc .gitconfig

ln -s $THIS/swayrc .config/sway/config
ln -s $THIS/swaystatus .config/sway/status.sh
ln -s $THIS/bgs/fernando-zobel-el-faro.jpg .config/sway/fondo

ln -s $THIS/alacritty.yml .config/alacritty/alacritty.yml
