#!/bin/bash

# Fetch submodules.
git submodule init
git submodule update

mkdir -p ~/.emacs.d
mkdir -p ~/.emacs.d/plugins
# Install auto-complete
# Fix up github urls.
sed -i s/git:/https:/g ./lib/auto-complete/.gitmodules
(cd ./lib/auto-complete; git submodule init ; git submodule update)
make -C ./lib/auto-complete install DIR=~/.emacs.d/
# auto-complete depends on popup.el
cp -f ./lib/auto-complete/lib/popup/popup.el ~/.emacs.d/
# Install xcscope
cp -f ./lib/xcscope.el/xcscope.el ~/.emacs.d/
# Install yasnippet
(cd ./lib/yasnippet ; git submodule init ; git submodule update)
cp -r ./lib/yasnippet ~/.emacs.d/plugins
# Install auto-complete-clang
cp -f ./lib/auto-complete-clang/auto-complete-clang.el ~/.emacs.d/
# Copy .emacs
cp .emacs ~/.emacs
