#!/bin/bash

mkdir -p ~/.emacs.d
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
mkdir -p ~/.emacs.d/plugins
cp -r ./lib/yasnippet ~/.emacs.d/plugins
cp .emacs ~/.emacs
