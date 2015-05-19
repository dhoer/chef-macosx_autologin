require 'spec_helper'

describe 'macosx_autologin_test::disable' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'mac_os_x',
      version: '10.10',
      step_into: ['macosx_autologin']
    ).converge(described_recipe)
  end

  it 'unsets autologin' do
    expect(chef_run).to run_execute('unset com.apple.loginwindow')
      .with(command: "sudo defaults write /Library/Preferences/com.apple.loginwindow \"autoLoginUser\" ''")
  end

  it 'creates kcpassword' do
    expect(chef_run).to run_execute('delete /etc/kcpassword')
  end

  it 'disables autologin' do
    expect(chef_run).to disable_macosx_autologin('vagrant')
  end
end
