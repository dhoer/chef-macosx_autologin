macosx_autologin node['macosx_autologin_test']['username'] do
  password node['macosx_autologin_test']['password']
  restart_loginwindow node['macosx_autologin_test']['restart_loginwindow']
  action :enable
end
