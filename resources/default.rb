actions :enable, :disable
default_action :enable

attribute :username, kind_of: String, name_attribute: true
attribute :password, kind_of: String, required: true
attribute :restart_loginwindow, kind_of: [TrueClass, FalseClass], default: true
