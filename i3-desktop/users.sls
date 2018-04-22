create-users:
  user.present:
    - name: syseng
    - fullname: SysEng Quick
    - groups:
      - sudo
    - remove_groups: False
    - password: {{ pillar['users']['syseng']['password_hash'] }}

create-ssh-directory:
  file.directory:
    - name: '/home/syseng/.ssh'
    - user: syseng
    - group: syseng
    - dir_mode: 0700

setup-ssh-keys:
  file.managed:
    - name: '/home/syseng/.ssh/authorized_keys'
    - user: syseng
    - group: syseng
    - mode: 0600
    - contents: {{ pillar['users']['syseng']['ssh_public_key'] }}

setup-sudo:
  file.replace:
    - name: '/etc/sudoers'
    - pattern: '^#?%sudo.*'
    - repl: '%sudo  ALL=(ALL:ALL) NOPASSWD: ALL'

copy-root-files:
  file.recurse:
    - name: '/root'
    - source: salt://files/root
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: keep

copy-user-files:
  file.recurse:
    - name: '/home/syseng'
    - source: salt://files/home/syseng
    - user: syseng
    - group: syseng
    - dir_mode: 0755
    - file_mode: keep
