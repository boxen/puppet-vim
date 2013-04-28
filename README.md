# vim Puppet Module for Boxen

Install [vim](http://www.vim.org/) along with [vim-pathogen](https://github.com/tpope/vim-pathogen), an easy way to install vim bundles.

[![Build Status](https://travis-ci.org/boxen/puppet-vim.png?branch=master)](https://travis-ci.org/boxen/puppet-vim)

This package won't interfere the puppet-macvim package. Please note that you __must__ manage your .vimrc using boxen since this module installs pathogen in .vimrc

## Usage
The following example will install vim, pathogen and the vim_bundle you specify in your ~/.vim/bundle directory

    include vim
    vim::bundle { [
      'scrooloose/syntastic',
      'sjl/gundo.vim'
    ]: }

    # Example of how you can manage your .vimrc
    file { "${vim::vimrc}":
      target  => "/Users/${::boxen_user}/.dotfiles/.vimrc",
      require => Repository["/Users/${::boxen_user}/.dotfiles"]
    }

    # Or, simply,
    file { "${vim::vimrc}": ensure => exists }

## Required Puppet Modules

* `boxen`
* `boxen-repository`
* `puppetlabs-stdlib`
