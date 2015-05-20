require 'spec_helper'

describe 'macosx_autologin_test::enable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'mac_os_x',
      version: '10.10',
      step_into: ['macosx_autologin']
    ).converge(described_recipe)
  end

  it 'downloads kcpassword script' do
    expect(chef_run).to create_cookbook_file('autologin.pl')
  end

  it 'creates kcpassword and configures com.apple.loginwindow' do
    expect(chef_run).to run_execute('enable automatic login')
  end

  it 'enables autologin' do
    expect(chef_run).to enable_macosx_autologin('vagrant')
      .with(restart_loginwindow: false, password: 'vagrant')
  end
end
