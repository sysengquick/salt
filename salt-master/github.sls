# change the /srv/(pillar|salt) repos to use ssh instead of https
srv-pillar-use-ssh:
  git.config_set:
    - name: remote.origin.url
    - value: git@github.com:sysengquick/pillar.git
    - repo: /srv/pillar

srv-salt-use-ssh:
  git.config_set:
    - name: remote.origin.url
    - value: git@github.com:sysengquick/salt.git
    - repo: /srv/salt
