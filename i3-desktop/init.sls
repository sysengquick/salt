install-packages:
  pkg.latest:
    - pkgs:
      - acl
      - firefox-esr
      - fonts-inconsolata
      - git
      - i3
      - iptables-persistent
      - keychain
      - salt-master
      - salt-ssh
      - sudo
      - tigervnc-standalone-server
      - vim

remove-packages:
  pkg.purged:
    - pkgs:
      - vim-tiny
