require 'spec_helper'

describe 'vim' do
   let :facts do
     { :boxen_user => 'jhaals' }
   end
  it do
    should contain_package('vim').with({
      'require' => 'Package[mercurial]'
    })
    should contain_package('mercurial')
    should contain_repository("/Users/jhaals/.vim/vim-pathogen")
    should contain_file("/Users/jhaals/.vim/autoload").with({
      'ensure'    => 'directory',
      'recurse'   => true,
    })
    should contain_file("/Users/jhaals/.vim/autoload/pathogen.vim").with({
      'target'  => "/Users/jhaals/.vim/vim-pathogen/autoload/pathogen.vim",
      'require' => [
        'File[/Users/jhaals/.vim]',
        'File[/Users/jhaals/.vim/autoload]',
        'File[/Users/jhaals/.vim/bundle]',
        'Repository[/Users/jhaals/.vim/vim-pathogen]']
    })
    should contain_file("/Users/jhaals/.vim/bundle").with({
      'ensure'    => 'directory',
      'recurse' => true,
    })
    should contain_file("/Users/jhaals/.vim").with({
      'ensure'    => 'directory',
      'recurse' => true,
    })
    should contain_file_line('load_pathogen').with({
      'ensure'  => 'present',
      'line'    => 'execute pathogen#infect()',
      'path'    => '/Users/jhaals/.vimrc',
      'require' => 'File[/Users/jhaals/.vimrc]',
    })
    end
end
