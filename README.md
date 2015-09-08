# Ansible Role

[![Gem Version](https://badge.fury.io/rb/ansible-role.png)](http://badge.fury.io/rb/ansible-role)

> Gem with some useful Ansible role command line tools.

## Installation

```
$ gem install ansible-role
```

## Usage

```
$ ansible-role
Commands:
  ansible-role apache SUBCOMMAND ...ARGS  # Snippets & Tools for apache
  ansible-role help [COMMAND]             # Describe available commands or one specific command

Options:
  [--verbose]
```

### Apache

```
$ ansible-role apache
Commands:
  ansible-role apache certificate FILENAME  # Create self signed openssl certificate.
  ansible-role apache help [COMMAND]        # Describe subcommands or one specific subcommand
```

## Development

When developing you can use the given `rake` tasks:

```
$ rake -T
rake build    # Build ansible-role-0.1.1.gem into the pkg directory.
rake install  # Build and install ansible-role-0.1.1.gem into system gems.
rake release  # Create tag v0.1.1 and build and push ansible-role-0.1.1.gem to Rubygems```
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) franklin under the MIT license.
