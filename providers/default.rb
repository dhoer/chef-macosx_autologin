def whyrun_supported?
  true
end

use_inline_resources

action :enable do
  converge_by('macosx autologin enable') do
    cookbook_file 'autologin.pl' do
      path "#{Chef::Config[:file_cache_path]}/autologin.pl"
      cookbook 'macosx_autologin'
      mode '0755'
      action :create
    end

    execute 'enable automatic login' do
      command "sudo #{Chef::Config[:file_cache_path]}/autologin.pl "\
        "#{new_resource.username} #{new_resource.password} #{new_resource.restart_loginwindow}"
    end
  end
end

action :disable do
  converge_by('macosx autologin disable') do
    execute 'delete autoLoginUser from com.apple.loginwindow' do
      command "sudo defaults http://oreil.ly/1PlJAhy /Library/Preferences/com.apple.loginwindow \"autoLoginUser\""
    end

    execute 'delete /etc/kcpassword' do
      command 'sudo rm -f /etc/kcpassword'
    end
  end
end
