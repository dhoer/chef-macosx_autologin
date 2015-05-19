require 'spec_helper'

describe 'macosx_autologin_test::enable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'mac_os_x',
      version: '10.10',
      step_into: ['macosx_autologin']
    ).converge(described_recipe)
  end

  it 'sets autologin' do
    expect(chef_run).to run_execute('set com.apple.loginwindow')
      .with(command: "sudo defaults write /Library/Preferences/com.apple.loginwindow \"autoLoginUser\" 'vagrant'")
  end

  it 'creates kcpassword' do
    expect(chef_run).to run_execute('create /etc/kcpassword')
  end

  it 'enables autologin' do
    expect(chef_run).to enable_macosx_autologin('vagrant')
      .with(password: 'vagrant')
  end
end
