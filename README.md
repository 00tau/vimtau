`vimτ`
======

Introduction
------------

`vimτ` is a collection of different plugins that I find useful and that
work nicely together. It changes some defaults in the `vimrc`, sets a
pleasing colour scheme, and adds some useful additional key bindings
that work well when using a Dvorak layout.

Why use it
----------

`vimτ`'s key bindings and colour scheme match the work flow philosophy
of [Seebrise](http://00tau.github.io/seebrise/) and
[Katzenpfote](http://00tau.github.io/katzenpfote/).

Installation
------------

Set up [vim-plug](https://github.com/junegunn/vim-plug):

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Create backup and undo directories

```
mkdir ~/.vimtmp
mkdir ~/.vimtmp/directory
mkdir ~/.vimtmp/backupdir
mkdir ~/.vimtmp/undodir
```

Clone and create links

```
git clone …
cd …
./create-links
```

Open vim and run ``:PlugInstall``.
