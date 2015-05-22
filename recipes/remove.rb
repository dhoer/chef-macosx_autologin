execute 'delete autoLoginUser from com.apple.loginwindow' do
  command "sudo defaults delete /Library/Preferences/com.apple.loginwindow \"autoLoginUser\""
  returns [0, 1]
end

execute 'delete /etc/kcpassword' do
  command 'sudo rm -f /etc/kcpassword'
end

execute 'restart loginwindow' do
  command 'sudo killall loginwindow'
  only_if { node['macosx_autologin']['restart_loginwindow'] }
end
