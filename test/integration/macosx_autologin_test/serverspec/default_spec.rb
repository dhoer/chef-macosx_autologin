require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'macosx_autologin_test' do
  case os[:family]
  when 'darwin'
    describe file('/etc/kcpassword') do
      it { should be_file }
    end
  end
end
