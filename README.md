# vim Puppet Module for Boxen

Install [vim](http://www.vim.org/) along with [vim-pathogen](https://github.com/tpope/vim-pathogen), an easy way to install vim bundles.

This package won't interfere the puppet-macvim package.

## Usage
The following example will install vim, pathogen and the vim_bundle you specify in your ~/.vim/bundle directory

    include vim
    vim::bundle { 'scrooloose/syntastic': }
    vim::bundle { 'sjl/gundo.vim: }

## Required Puppet Modules

* `boxen`
* `boxen-repository`
