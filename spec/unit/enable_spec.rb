require 'spec_helper'

describe 'macosx_autologin_test::enable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      file_cache_path: '/tmp',
      platform: 'mac_os_x',
      version: '10.10',
      step_into: ['macosx_autologin']
    ).converge(described_recipe)
  end

  it 'downloads kcpassword script' do
    expect(chef_run).to create_cookbook_file('autologin.pl').with(
      path: '/tmp/autologin.pl', cookbook: 'macosx_autologin', mode: '0755')
  end

  it 'creates kcpassword and configures com.apple.loginwindow' do
    expect(chef_run).to run_execute('enable automatic login').with(
      command: 'sudo /tmp/autologin.pl vagrant vagrant 0'
    )
  end

  it 'enables autologin' do
    expect(chef_run).to enable_macosx_autologin('vagrant')
      .with(restart_loginwindow: false, password: 'vagrant')
  end
end
