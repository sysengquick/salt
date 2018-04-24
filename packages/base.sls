# packages that should be installed on all linux minions
base-packages:
  pkg.latest:
    - pkgs:
      - acl
      - htop
      - salt-minion
      - sudo
      - {{ pillar['packages']['vim'] }}
    - require:
      - epel-repo
      - salt-repo

removed-packages:
  pkg.purged:
    - pkgs:
      - vim-tiny
