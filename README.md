# Mac OS X Autologin Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/macosx_autologin.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-macosx_autologin.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-macosx_autologin.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/macosx_autologin
[travis]: https://travis-ci.org/dhoer/chef-macosx_autologin
[github]: https://github.com/dhoer/chef-macosx_autologin/issues

Enables/disables automatic login for user on boot using a modified version of 
Gavin Brock's [kcpassword](http://www.brock-family.org/gavin/perl/kcpassword.html). 
                                                  
## Requirements

- Chef 11.14 (introduced `sensitive` resource) or higher

### Platforms

- Mac OS X 10.7 or higher

## Usage

Requires super-user privileges. 

Enable automatic login for user

```ruby
node.set['macosx_autologin']['username'] = 'username'
node.set['macosx_autologin']['password'] = 'password'
node.set['macosx_autologin']['restart_loginwindow'] = true # default is false

include_recipe[macosx_autologin]
```

Disable automatic login

```ruby
node.set['macosx_autologin']['restart_loginwindow'] = true # default is false

include_recipe[macosx_autologin::remove]
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
