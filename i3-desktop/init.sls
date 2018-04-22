install-packages:
  pkg.latest:
    - pkgs:
      - acl
      - dkms
      - firefox-esr
      - fonts-inconsolata
      - git
      - i3
      - iptables-persistent
      - keychain
      - lightdm
      - salt-master
      - salt-ssh
      - sudo
      - tigervnc-standalone-server
      - vim

remove-packages:
  pkg.purged:
    - pkgs:
      - vim-tiny

disable-gui-on-boot:
  cmd.run:
    - name: 'systemctl set-default multi-user.target'
