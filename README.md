# Ansible Role

[![Gem Version](https://badge.fury.io/rb/ansible-role.svg)](http://badge.fury.io/rb/ansible-role)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/gem-ansible-role.svg)](https://github.com/weareinteractive/gem-ansible-role)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/gem-ansible-role.svg)](https://github.com/weareinteractive/gem-ansible-role)


> Ansible role command line tool for.
>
> * Initialize a new Ansible role
> * Re-Generating README.md

## Installation

```bash
$ gem install ansible-role
```

## Usage

```bash
$ ansible-role
Commands:
  ansible-role docgen          # Generate README file
  ansible-role help [COMMAND]  # Describe available commands or one specific command
  ansible-role init            # Initialize new role
```

### Init

`ansible-role init` generates a role skeleton including:

* [`Travis`](https://travis-ci.org): for testing
* [`Vagrant`](http://www.vagrantup.com): for local testing
* [`clog-cli`](https://github.com/clog-tool/clog-cli): for CHANGELOG generation
* [`.editorconfig`](http://editorconfig.org/): for consistent code

```bash
$ mkdir my-role
$ cd my-role
$ ansible-role init

To generate your role, please give me some info about:

• Author
  Name [franklin <franklin@weareinteractive.com>]: franklin <franklin@weareinteractive.com
  Company: We Are Interactive

• Role
  Name [my-role]: my-role
  Description [Best role ever!]: My best role ever!
  Category [development]: system
  Min ansible version [2.0]: 2.0

• GitHub
  User/Organization [franklin]: weareinteractive
  Repository [barfoo]: ansible-my-role

       exist
      create  .clog.toml
      create  .editorconfig
      create  .gitignore
      create  .travis.yml
      create  CHANGELOG.md
      create  LICENSE
      create  Vagrantfile
      create  defaults/main.yml
      create  handlers/main.yml
      create  meta/main.yml
      create  meta/readme.yml
      create  tasks/config.yml
      create  tasks/install.yml
      create  tasks/main.yml
      create  tasks/manage.yml
      create  tasks/service.yml
      create  templates/etc/my-role.conf.j2
      create  tests/main.yml
      create  vars/main.yml
      create  README.md
```

### Docgen

`ansible-role docgen` generates a `README.md` file frrom `meta/readme.yml` and your role files:

```bash
$ cd my-role
$ ansible-role docgen

```

You can configure the generated README through these variables:

```yaml
---
galaxy_name: weareinteractive.my-role
github_user: weareinteractive
github_name: ansible-my-role
badges: |
  [![Build Status](https://img.shields.io/travis/weareinteractive/ansible-my-role.svg)](https://travis-ci.org/weareinteractive/ansible-my-role)
  [![Galaxy](http://img.shields.io/badge/galaxy-weareinteractive.my-role-blue.svg)](https://galaxy.ansible.com/weareinteractive/my-role)
  [![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-my-role.svg)](https://github.com/weareinteractive/ansible-my-role)
  [![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-my-role.svg)](https://github.com/weareinteractive/ansible-my-role)
description: |
  > * installs foo
  > * configures foo
after_dependencies: |
  * foo dependency
  * bar dependency
after_handlers: |
  ## Rules

  Some other important section...
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
