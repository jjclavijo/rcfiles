#!/bin/zsh

mkdir -p ~/.vim/bundle
pushd ~/.vim/bundle

git clone https://github.com/rafaqz/citation.vim
git clone https://github.com/chrisbra/csv.vim
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/junegunn/goyo.vim.git
git clone https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/jupyter-vim/jupyter-vim.git
git clone https://github.com/goerz/jupytext.vim.git
git clone https://github.com/joom/latex-unicoder.vim.git
git clone https://github.com/KeitaNakamura/tex-conceal.vim
git clone https://github.com/sirver/ultisnips.git
git clone https://github.com/Shougo/unite.vim.git
git clone https://github.com/vim-pandoc/vim-pandoc-syntax.git
git clone https://github.com/reedes/vim-pencil
git clone https://github.com/lervag/vimtex
git clone https://github.com/jjclavijo/fichajas.vim.git

popd

cp -r theme-foursee ~/.vim/bundle

mkdir -p ~/.vim/bundlecli
pushd ~/.vim/bundlecli

git clone https://github.com/vim-scripts/CSApprox.git

popd


