# Ansible Role

[![Gem Version](https://badge.fury.io/rb/ansible-role.svg)](http://badge.fury.io/rb/ansible-role)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/gem-ansible-role.svg)](https://github.com/weareinteractive/gem-ansible-role)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/gem-ansible-role.svg)](https://github.com/weareinteractive/gem-ansible-role)

> Small commandline tool to help with ansible roles.
>
> * `init`: Initialize new ansible roles
> * `docgen`: Re-Generate README.md

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

Initialize a new role including:

* [`Travis`](https://travis-ci.org): for testing
* [`Docker`](https://www.docker.com/): for local testing
* [`clog-cli`](https://github.com/clog-tool/clog-cli): for generating CHANGELOG
* [`.editorconfig`](http://editorconfig.org/): for consistent coding stlye

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
  Description [Best role ever!]: My best role ever
  Category [development]: demo
  Min ansible version [2.0]: 2.0

• GitHub
  User/Organization [franklin]: weareinteractive
  Repository [my-role]: ansible-my-role

       exist
      create  .clog.toml
      create  .editorconfig
      create  .gitignore
      create  .travis.yml
      create  CHANGELOG.md
      create  LICENSE
      create  Makefile
      create  defaults/main.yml
      create  files
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

See [weareinteractive.unison](https://github.com/weareinteractive/ansible-unison) for example.

### Docgen

`docgen` reads meta data from `meta/main.yml` and a `meta/readme.yml` as well as code from your role files.

The `meta/readme.yml` might look like:

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
  > * installs my-role
  > * configures my-role
after_dependencies: |
  * dependency a
  * dependency b
after_handlers: |
  ## A new section after the handler section

  Lorem ipsum dolor sit atem ...
after_usage: |
  ## A new section after the usage section

  Lorem ipsum dolor sit atem ...
```

To re-generate the `README.md` file run:

```bash
$ mkdir my-role
$ cd my-role
$ ansble-docgen
conflict  README.md
Overwrite /path/to/my-role/README.md? (enter "h" for help) [Ynaqdh] y
   force  README.md
```

See [weareinteractive.unison](https://github.com/weareinteractive/ansible-unison) for example.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
