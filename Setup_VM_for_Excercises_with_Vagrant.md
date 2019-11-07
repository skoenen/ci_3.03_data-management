# Setup VM for Excercises with Vagrant

## Disclaimer

This manual is not comprehensive and can vary in details, depending on the
Operating System used.

## Prerequisites

On a computer attempting to follow this manual there must be some prerequisites
meet:

1. [Virtualbox](https://www.virtualbox.org/wiki/Downloads) Installed

2. Vagrant Installed in version 2.2.4
  (Because of Bug see [#11048 on github](https://github.com/hashicorp/vagrant/issues/11048))
  - Windows:
    [32bit](https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_i686.msi)
    or
    [64bit](https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.msi)
  - Ubuntu/Debian: `sudo apt install vagrant=2.2.4\*`
  - Arch Linux: **With current version 2.2.6 there is a bug preventing this.**
  - CentOS: _TODO: Show correct yum command._

3. [Git](https://git-scm.com/) Installed
  - `git` command must be executable in a _command line_ interface

3. Familarity with _command line_ interface
  - Windows:
    1. `Win-Key + R`
    2. Input in text field: `cmd.exe`
    3. Hit `Enter-Key`

## Instructions

These instructions have to be issued in a _command line_ interface at the home
folder of the current logged in user.

### Legend:

`commands to type in command line`

_Hints: To clarify something_

**Output:**
```
of command line that has to appear
```

### The Instructions:

1. Read the complete manual!
2. `git clone https://github.com/skoenen/ci_3.03_data-management`
3. `cd ci_3.03_data-management`
4. `vagrant up`
5. Wait for similar output to _(Hint: the `failed=` should be 0)_:

  **Output:**

  ```
  database               : ok=19 changed=18 unreachable=0 failed=0 skipped=0 rescued=0 ignored=0
  ```
6. Use a Browser to visit
   [http://localhost:1818/pgadmin](http://localhost:1818/pgadmin)
7. Login with following credentials:
  - Username: `db@hsrw.local`
  - Password: `secret`

