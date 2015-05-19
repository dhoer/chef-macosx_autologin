# Mac OS X Autologin Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/macosx_autologin.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-macosx_autologin.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-macosx_autologin.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/macosx_autologin
[travis]: https://travis-ci.org/dhoer/chef-macosx_autologin
[github]: https://github.com/dhoer/chef-macosx_autologin/issues

Enables/Disables automatic login for user on boot.  

## Requirements

- Chef 11 or higher

### Platforms

- Mac OS X - 10.4 or higher

## Usage

Requires super-user privileges. 

Enable automatic login

```ruby
macosx_autologin '' do
  password ''
end
```

Disable automatic login

```ruby
macosx_autologin '' do
  action :disable
end
```

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-macosx_autologin).
- Report bugs and discuss potential features in
[Github issues](https://github.com/dhoer/chef-macosx_autologin/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-macosx_autologin/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-macosx_autologin/blob/master/LICENSE.md) file
for details.
