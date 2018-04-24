# packages that should be installed on all linux minions
base-packages:
  pkg.latest:
    - pkgs:
      - acl
      - htop
      - {{ pillar['packages']['iptables'] }}
      - salt-minion
      - sudo
      - tmux
      - {{ pillar['packages']['vim'] }}
    - require:
      - epel-repo
      - salt-repo

removed-packages:
  pkg.purged:
    - pkgs:
      - vim-tiny
