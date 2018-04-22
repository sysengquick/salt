# make sure sudo package is installed
required-packages:
  pkg.latest:
    - name: sudo

# create syseng user with password 'syseng' in the sudo group
create-users:
  user.present:
    - name: syseng
    - fullname: SysEng Quick
    - groups:
      - sudo
    - remove_groups: False
    - password: {{ pillar['users']['syseng']['password_hash'] }}
    - enforce_password: False
    - require:
      - pkg: sudo

# ensure the correct permissions for the .ssh directory
create-ssh-directory:
  file.directory:
    - name: '/home/syseng/.ssh'
    - user: syseng
    - group: syseng
    - dir_mode: 0700

# add the ssh_public_key to the authorized_keys file
setup-ssh-keys:
  ssh_auth.present:
    - user: syseng
    - name: {{ pillar['users']['syseng']['ssh_public_key'] }}

# change sudo to not require a password for the sudo group
setup-sudo:
  file.replace:
    - name: '/etc/sudoers'
    - pattern: '^#?%sudo.*'
    - repl: '%sudo  ALL=(ALL:ALL) NOPASSWD: ALL'
    - append_if_not_found: True

# copy the root user's files over
copy-root-files:
  file.recurse:
    - name: '/root'
    - source: salt://files/root
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: keep

# copy the syseng user's files over
copy-user-files:
  file.recurse:
    - name: '/home/syseng'
    - source: salt://files/home/syseng
    - user: syseng
    - group: syseng
    - dir_mode: 0755
    - file_mode: keep
