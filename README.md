`vimτ`
======

Introduction
------------

`vimτ` bundles a collection of different vim plugins together, which I
assume useful and which work nicely together.  See the folder
`vim/bundle` for details.  It also changes some defaults in `vimrc`,
sets an eye pleasing colour scheme, and adds some useful additional key
bindings.

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
