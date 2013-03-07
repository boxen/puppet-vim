require 'spec_helper'

describe 'vim::setup', :type => :class do
   let :facts do
     { :boxen_user => 'jhaals' }
   end
  it do
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
  end
end
