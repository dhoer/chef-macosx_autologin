require 'spec_helper'

describe 'macosx_autologin::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(file_cache_path: '/tmp', platform: 'mac_os_x', version: '10.10') do |node|
      node.set['macosx_autologin']['username'] = 'vagrant'
      node.set['macosx_autologin']['password'] = 'vagrant'
      node.set['macosx_autologin']['restart_loginwindow'] = true
    end.converge(described_recipe)
  end

  it 'downloads kcpassword script' do
    expect(chef_run).to create_cookbook_file('autologin.pl').with(
      path: '/tmp/autologin.pl', cookbook: 'macosx_autologin', mode: '0755')
  end

  it 'creates kcpassword and configures com.apple.loginwindow' do
    expect(chef_run).to run_execute('enable automatic login').with(
      command: 'sudo /tmp/autologin.pl vagrant vagrant 1'
    )
  end
end
