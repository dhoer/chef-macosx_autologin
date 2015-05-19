if defined?(ChefSpec)
  def enable_macosx_autologin(username)
    ChefSpec::Matchers::ResourceMatcher.new(:macosx_autologin, :enable, username)
  end

  def disable_macosx_autologin(username)
    ChefSpec::Matchers::ResourceMatcher.new(:macosx_autologin, :disable, username)
  end
end
