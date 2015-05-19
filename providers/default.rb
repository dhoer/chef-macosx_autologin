def whyrun_supported?
  true
end

use_inline_resources

action :enable do
  converge_by('macosx autologin enable') do
    execute 'set com.apple.loginwindow' do
      command 'sudo defaults write /Library/Preferences/com.apple.loginwindow '\
        "\"autoLoginUser\" '#{new_resource.username}'"
    end

    execute 'create /etc/kcpassword' do
      command "IO.write('/etc/kcpassword', #{kcpassword_xor(new_resource.password)}"
      # sensitive true
    end
  end
end

action :disable do
  converge_by('macosx autologin enable') do
    execute 'unset com.apple.loginwindow' do
      command "sudo defaults write /Library/Preferences/com.apple.loginwindow \"autoLoginUser\" ''"
    end

    execute 'delete /etc/kcpassword' do
      command 'sudo rm -f /etc/kcpassword'
    end
  end
end
