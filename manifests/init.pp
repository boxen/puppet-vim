# Installs vim and vim-pathogen

# Examples
#
#   include vim
#   vim::loader
#   vim::bundle { 'syntastic':
#     source => 'scrooloose/syntastic',
#   }
#
class vim (
  $ensure = present,
  $install_options = '--override-system-vi',
) {
  $home = "/Users/${::boxen_user}"
  $vimrc = "${home}/.vimrc"
  $vimdir = "${home}/.vim"

  package { 'vim': 
    ensure => $ensure,
    install_options => $install_options,
  }

  if ! defined(Class['spf13vim3']) {
    file { [$vimdir,
      "${vimdir}/autoload",
      "${vimdir}/bundle"]:
      ensure  => directory,
      recurse => true,
    }

    repository { "${vimdir}/vim-pathogen":
      source => 'tpope/vim-pathogen'
    }

    file { "${vimdir}/autoload/pathogen.vim":
      target  => "${vimdir}/vim-pathogen/autoload/pathogen.vim",
      require => [
        File[$vimdir],
        File["${vimdir}/autoload"],
        File["${vimdir}/bundle"],
        Repository["${vimdir}/vim-pathogen"]
      ]
    }
  }

}
