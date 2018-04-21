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
