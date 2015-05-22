cookbook_file 'autologin.pl' do
  path "#{Chef::Config[:file_cache_path]}/autologin.pl"
  cookbook 'macosx_autologin'
  mode '0755'
  action :create
end

restart_loginwindow = node['macosx_autologin']['restart_loginwindow'] ? 1 : 0

execute 'enable automatic login' do # ~FC009
  command "sudo #{Chef::Config[:file_cache_path]}/autologin.pl "\
        "#{node['macosx_autologin']['username']} #{node['macosx_autologin']['password']} #{restart_loginwindow}"
  sensitive true
end
