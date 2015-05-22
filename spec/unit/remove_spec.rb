require 'spec_helper'

describe 'macosx_autologin::remove' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'mac_os_x',
      version: '10.10'
    ).converge(described_recipe)
  end

  it 'deletes autoLoginUser' do
    expect(chef_run).to run_execute('delete autoLoginUser from com.apple.loginwindow').with(
      command: "sudo defaults delete /Library/Preferences/com.apple.loginwindow \"autoLoginUser\"",
      returns: [0, 1])
  end

  it 'deletes kcpassword' do
    expect(chef_run).to run_execute('delete /etc/kcpassword').with(command: 'sudo rm -f /etc/kcpassword')
  end

  it 'restarts loginwindow' do
    expect(chef_run).to_not run_execute('restart loginwindow').with(command: 'sudo killall loginwindow')
  end
end
