Repository Description
=============

Some configuration scripts such as .emacs

Currently it includes the following plugins:
- auto-complete : Powerful auto completion
- xcscope       : Emacs interface to cscope
- yasnippet     : Powerful template system

Install Instructions
=============

Clone this repository, do not use "--recursive". All submodules will be fetched
by the script install.sh

```
cd configuration/
./install.sh
```

The install.sh will copy/install all the plugins to ~/.emacs.d/ and then copy the .emacs to ~/.emacs
