require 'spec_helper'

describe 'vim' do
  it do
    should contain_package('vim').with({
      'require' => 'Package[mercurial]'
    })
    should contain_package('mercurial')
    should include_class('vim::setup')
  end
end

