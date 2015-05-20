macosx_autologin 'vagrant' do
  password 'vagrant'
  restart_loginwindow false
  action :enable
end

reboot 'reboot to start autologin' do
  delay_mins 1
  action :request_reboot
end
